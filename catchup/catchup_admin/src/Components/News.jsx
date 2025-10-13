// src/pages/NewsList.jsx
import React, { useEffect, useState } from "react";
import { supabase } from "../SupabaseClient";
import { useNavigate } from "react-router-dom";
import "../output.css";

const PRIMARY_COLOR_TEXT = "text-[#FF7F00]";
const LIGHT_BG = "bg-gray-50";

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

    const { data, error } = await supabase
      .from("news_uploads")
      .select("*")
      .order("created_at", { ascending: false });

    if (error) {
      console.error("Error fetching news:", error.message);
    } else {
      setNewsList(data);
    }

    setLoading(false);
  };

  // Create a unique key for deletion: contributor + created_at
  const generateKey = (news) => `${news.contributor_name}_${news.created_at}`;

  const handleDelete = async (news) => {
    const confirmed = window.confirm(
      "Are you sure you want to delete this news item?"
    );
    if (!confirmed) return;

    const key = generateKey(news);
    setDeletingKey(key);

    const { error } = await supabase
      .from("news_uploads")
      .delete()
      .eq("contributor_name", news.contributor_name)
      .eq("created_at", news.created_at);

    if (error) {
      console.error("Error deleting news:", error.message);
      alert("Failed to delete. Try again.");
    } else {
      setNewsList(newsList.filter((item) => generateKey(item) !== key));
    }

    setDeletingKey(null);
  };

  return (
    <div className={`${LIGHT_BG} min-h-screen p-6`}>
      <div className="flex justify-between items-center mb-6">
        <h1 className={`text-3xl font-bold ${PRIMARY_COLOR_TEXT}`}>
          📰 Uploaded News
        </h1>
        <button
          onClick={() => navigate("/home")}
          className="text-gray-600 underline hover:text-black"
        >
          ← Back to Dashboard
        </button>
      </div>

      {loading ? (
        <p className="text-gray-600 text-center mt-10">Loading news...</p>
      ) : newsList.length === 0 ? (
        <p className="text-gray-500 text-center mt-10">No news uploaded yet.</p>
      ) : (
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
          {newsList.map((news) => {
            const key = generateKey(news);

            return (
              <div
                key={key}
                className="bg-white shadow-md rounded-2xl p-5 hover:shadow-lg transition-all"
              >
                {/* Contributor Info */}
                <h2 className="text-lg font-semibold mb-1 text-gray-800">
                  {news.contributor_name || "Unnamed Contributor"}
                </h2>

                <p className="text-sm text-gray-500 mb-2">
                  {news.designation ||
                    news.custom_designation ||
                    "No designation"}{" "}
                  • {news.branch || news.custom_branch || "No branch"}
                </p>

                {/* Upload Date */}
                <p className="text-xs text-gray-400 mb-3">
                  Uploaded on:{" "}
                  {news.upload_date
                    ? new Date(news.upload_date).toLocaleDateString()
                    : "N/A"}
                </p>

                {/* Description */}
                <p className="text-gray-700 text-sm mb-4 whitespace-pre-wrap">
                  {news.description?.length > 150
                    ? news.description.slice(0, 150) + "..."
                    : news.description || "No description"}
                </p>

                {/* File URLs / Clickable Images */}
                {Array.isArray(news.file_urls) && news.file_urls.length > 0 ? (
                  <div className="grid grid-cols-2 gap-2 mb-4">
                    {news.file_urls.map((url, index) => (
                      <a
                        key={index}
                        href={url}
                        target="_blank"
                        rel="noopener noreferrer"
                      >
                        <img
                          src={url}
                          alt="Uploaded"
                          className="rounded-lg w-full h-32 object-cover hover:scale-105 transition-transform cursor-pointer"
                        />
                      </a>
                    ))}
                  </div>
                ) : (
                  <p className="text-gray-400 text-sm italic mb-4">
                    No images available.
                  </p>
                )}

                {/* Delete Button */}
                <button
                  onClick={() => handleDelete(news)}
                  disabled={deletingKey === key}
                  className="mt-2 bg-red-500 text-white w-full py-2 rounded-lg hover:opacity-90 transition font-semibold"
                >
                  {deletingKey === key ? "Deleting..." : "Delete News"}
                </button>

                {/* Created Timestamp */}
                <p className="text-[10px] text-gray-400 mt-4">
                  Created:{" "}
                  {news.created_at
                    ? new Date(news.created_at).toLocaleString()
                    : "N/A"}
                </p>
              </div>
            );
          })}
        </div>
      )}
    </div>
  );
};

export default NewsList;
