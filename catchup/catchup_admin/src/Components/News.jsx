// src/pages/NewsList.jsx
import React, { useEffect, useState } from "react";
import { supabase } from "../SupabaseClient";
import { useNavigate } from "react-router-dom";
import "../output.css"; // Assuming Tailwind CSS output

// --- UI Constants for Better Theming ---
const ACCENT_COLOR_TEXT = "text-indigo-600"; // Changed from orange to a professional blue/indigo
const ACCENT_COLOR_HOVER = "hover:text-indigo-700";
const ACCENT_COLOR_BG = "bg-indigo-600";
const LIGHT_BG = "bg-gray-50"; // Remains a light background
const CARD_SHADOW = "shadow-xl hover:shadow-2xl"; // More pronounced shadow for depth
const DELETE_BTN_CLASS =
  "bg-red-500 hover:bg-red-600 active:bg-red-700 disabled:opacity-50 transition-colors";

const NewsList = () => {
  const [newsList, setNewsList] = useState([]);
  const [loading, setLoading] = useState(true);
  const [deletingKey, setDeletingKey] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    fetchNews();
  }, []);

  const fetchNews = async () => {
    setLoading(true);
    try {
      const { data, error } = await supabase
        .from("news_uploads")
        .select("*")
        .order("created_at", { ascending: false });

      if (error) throw error;
      setNewsList(data);
    } catch (error) {
      console.error("Error fetching news:", error.message);
    } finally {
      setLoading(false);
    }
  }; // Create a unique key for deletion: contributor + created_at

  const generateKey = (news) => `${news.contributor_name}_${news.created_at}`;

  const handleDelete = async (news) => {
    const confirmed = window.confirm(
      "⚠️ Are you sure you want to permanently delete this news item? This action cannot be undone."
    );
    if (!confirmed) return;

    const key = generateKey(news);
    setDeletingKey(key);

    try {
      const { error } = await supabase
        .from("news_uploads")
        .delete()
        .eq("contributor_name", news.contributor_name)
        .eq("created_at", news.created_at);

      if (error) throw error; // Optimistically update UI

      setNewsList(newsList.filter((item) => generateKey(item) !== key));
    } catch (error) {
      console.error("Error deleting news:", error.message);
      alert("❌ Failed to delete news. Please check the console for details.");
    } finally {
      setDeletingKey(null);
    }
  };

  const formatDate = (timestamp) => {
    if (!timestamp) return "N/A";
    return new Date(timestamp).toLocaleDateString("en-US", {
      year: "numeric",
      month: "short",
      day: "numeric",
    });
  };

  return (
    <div className={`${LIGHT_BG} min-h-screen p-4 sm:p-8`}>
           {" "}
      <div className="max-w-7xl mx-auto">
                {/* Header Section */}       {" "}
        <header className="flex flex-col sm:flex-row justify-between items-start sm:items-center mb-8 border-b pb-4">
                   {" "}
          <h1
            className={`text-4xl font-extrabold ${ACCENT_COLOR_TEXT} mb-2 sm:mb-0`}
          >
                        📰 Contributor News Feed          {" "}
          </h1>
                   {" "}
          <button
            onClick={() => navigate("/home")}
            className={`text-gray-500 font-medium ${ACCENT_COLOR_HOVER} transition-colors`}
          >
                        ← Back to Dashboard          {" "}
          </button>
                 {" "}
        </header>
                {/* Content Section */}       {" "}
        {loading ? (
          <p className="text-gray-600 text-center text-xl mt-20">
                        Loading news... please wait.          {" "}
          </p>
        ) : newsList.length === 0 ? (
          <div className="text-center mt-20 p-10 bg-white rounded-xl border border-dashed">
                       {" "}
            <p className="text-gray-500 text-xl font-medium">
                            📥 No news uploaded yet.            {" "}
            </p>
                       {" "}
            <p className="text-gray-400 mt-2">
                            Start by adding your first news item.            {" "}
            </p>
                     {" "}
          </div>
        ) : (
          <div className="grid sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">
                       {" "}
            {newsList.map((news) => {
              const key = generateKey(news);
              const isDeleting = deletingKey === key;

              return (
                <div
                  key={key}
                  className={`bg-white rounded-xl p-6 transition-all duration-300 flex flex-col ${CARD_SHADOW}`}
                >
                                    {/* Contributor Info (Primary Focus) */}   
                               {" "}
                  <h2 className="text-xl font-bold mb-1 text-gray-900 leading-tight">
                                       {" "}
                    {news.contributor_name || "Unnamed Contributor"}           
                         {" "}
                  </h2>
                                   {" "}
                  <p
                    className={`text-xs font-semibold uppercase tracking-wider mb-3 ${ACCENT_COLOR_TEXT}`}
                  >
                                       {" "}
                    {news.designation || news.custom_designation || "Staff"}   
                                    •{" "}
                    {news.branch || news.custom_branch || "General"}           
                         {" "}
                  </p>
                                    {/* Description (The News Content) */}     
                             {" "}
                  <p className="text-gray-700 text-sm mb-4 whitespace-pre-wrap flex-grow">
                                       {" "}
                    {news.description?.length > 120
                      ? news.description.slice(0, 120) + "..."
                      : news.description ||
                        "No description provided for this item."}
                                     {" "}
                  </p>
                                    {/* File URLs / Clickable Images */}       
                           {" "}
                  {Array.isArray(news.file_urls) &&
                  news.file_urls.length > 0 ? (
                    <div className="grid grid-cols-2 gap-2 mb-4">
                                           {" "}
                      {news.file_urls.slice(0, 2).map((url, index) => (
                        <a
                          key={index}
                          href={url}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="relative group overflow-hidden block"
                        >
                                                   {" "}
                          <img
                            src={url}
                            alt="News Media"
                            className="rounded-lg w-full h-24 object-cover transform group-hover:scale-110 transition-transform duration-300"
                          />
                                                   {" "}
                          {index === 1 && news.file_urls.length > 2 && (
                            <div className="absolute inset-0 bg-black bg-opacity-40 flex items-center justify-center rounded-lg">
                                                           {" "}
                              <span className="text-white text-xl font-bold">
                                                                +
                                {news.file_urls.length - 2}                     
                                       {" "}
                              </span>
                                                         {" "}
                            </div>
                          )}
                                                 {" "}
                        </a>
                      ))}
                                         {" "}
                    </div>
                  ) : (
                    <p className="text-gray-400 text-sm italic mb-4">
                                            🖼️ No media uploaded.              
                           {" "}
                    </p>
                  )}
                                    {/* Date Details */}                 {" "}
                  <div className="flex justify-between text-xs text-gray-500 mb-4 border-t pt-3">
                                       {" "}
                    <p>
                                            **Publish Date:**{" "}
                      {formatDate(news.upload_date)}                   {" "}
                    </p>
                                       {" "}
                    <p className="text-right">
                                            **Created:**{" "}
                      {new Date(news.created_at).toLocaleTimeString()}         
                               {" "}
                    </p>
                                     {" "}
                  </div>
                                    {/* Delete Button */}                 {" "}
                  <button
                    onClick={() => handleDelete(news)}
                    disabled={isDeleting}
                    className={`mt-auto text-white w-full py-2.5 rounded-lg font-bold text-sm ${DELETE_BTN_CLASS}`}
                  >
                                       {" "}
                    {isDeleting ? "⏳ Deleting..." : "🗑️ Delete News Item"}     
                               {" "}
                  </button>
                                 {" "}
                </div>
              );
            })}
                     {" "}
          </div>
        )}
             {" "}
      </div>
         {" "}
    </div>
  );
};

export default NewsList;
