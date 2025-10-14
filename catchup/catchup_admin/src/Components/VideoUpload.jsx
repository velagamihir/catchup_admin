import React, { useState } from "react";
import { supabase } from "../SupabaseClient";
import { useNavigate } from "react-router-dom";

export default function VideoUpload() {
  const navigate = useNavigate();
  const [uploading, setUploading] = useState(false);
  const [ytLink, setYtLink] = useState("");
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");
  const [thumbnailFile, setThumbnailFile] = useState(null);
  const [videoFile, setVideoFile] = useState(null);

  const logout = async () => {
    try {
      await supabase.auth.signOut();
      window.sessionStorage.clear();
      navigate("/", { replace: true });
    } catch (error) {
      console.error("Error signing out:", error);
      alert("❌ Error signing out: " + error.message);
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setUploading(true);

    try {
      const uploadToSupabase = async (file, folder = "") => {
        if (!file) return null;
        const uniqueName = folder
          ? `${folder}/${Date.now()}_${file.name}`
          : `${Date.now()}_${file.name}`;
        const { data, error } = await supabase.storage
          .from("picsbuckets")
          .upload(uniqueName, file);
        if (error) throw error;
        const { data: publicUrlData } = supabase.storage
          .from("picsbuckets")
          .getPublicUrl(uniqueName);
        return publicUrlData.publicUrl;
      };

      const thumbnailUrl = await uploadToSupabase(thumbnailFile, "thumbnails");
      const videoUrl = await uploadToSupabase(videoFile, "videos");

      const { error } = await supabase.from("catchup_media").insert([
        {
          title,
          description,
          thumbnail_url: thumbnailUrl,
          video_link: ytLink,
          created_at: new Date().toISOString(),
        },
      ]);

      if (error) throw error;

      alert("✅ Video submitted successfully!");
      setTitle("");
      setDescription("");
      setYtLink("");
      setThumbnailFile(null);
      setVideoFile(null);
      e.target.reset();
    } catch (err) {
      console.error(err);
      alert("❌ Error: " + err.message);
    } finally {
      setUploading(false);
    }
  };

  return (
    <div className="min-h-screen flex flex-col bg-gray-50">
      {/* App Bar */}
      <header className="bg-white shadow-md flex justify-between items-center px-8 py-6">
        <div
          className="text-3xl font-bold text-[#FF7F00] cursor-pointer"
          onClick={() => navigate("/")}
        >
          CatchUp 2.0
        </div>
        <div className="flex items-center gap-3">
          <button
            onClick={() => navigate("/")}
            className="bg-gray-100 hover:bg-gray-200 px-3 py-2 rounded-lg text-gray-800 font-medium shadow-sm transition"
          >
            Home
          </button>
          <button
            onClick={logout}
            className="bg-red-500 hover:bg-red-600 px-3 py-2 rounded-lg text-white font-medium shadow-sm transition"
          >
            Logout
          </button>
        </div>
      </header>

      {/* Main Form */}
      <main className="flex-grow flex items-center justify-center p-6">
        <div className="w-full max-w-3xl bg-white p-8 rounded-2xl shadow-xl border-t-4 border-[#FF7F00]">
          <h2 className="text-3xl font-bold text-center text-[#FF7F00] mb-8">
            Upload Your Video 🎬
          </h2>

          <form onSubmit={handleSubmit} className="space-y-5">
            {/* Title */}
            <div>
              <label className="block mb-2 font-semibold text-gray-700">
                Video Title
              </label>
              <input
                type="text"
                required
                placeholder="Enter video title"
                value={title}
                onChange={(e) => setTitle(e.target.value)}
                className="w-full p-2.5 border border-gray-300 rounded-xl shadow-sm focus:ring-2 focus:ring-[#FF7F00] focus:outline-none transition"
              />
            </div>

            {/* Description */}
            <div>
              <label className="block mb-2 font-semibold text-gray-700">
                Description
              </label>
              <textarea
                required
                placeholder="Briefly describe the video..."
                value={description}
                onChange={(e) => setDescription(e.target.value)}
                className="w-full p-2.5 border border-gray-300 rounded-xl shadow-sm focus:ring-2 focus:ring-[#FF7F00] focus:outline-none transition min-h-[100px]"
              />
            </div>

            {/* YouTube Link */}
            <div>
              <label className="block mb-2 font-semibold text-gray-700">
                YouTube Link
              </label>
              <input
                type="url"
                required
                placeholder="https://www.youtube.com/..."
                value={ytLink}
                onChange={(e) => setYtLink(e.target.value)}
                className="w-full p-2.5 border border-gray-300 rounded-xl shadow-sm focus:ring-2 focus:ring-[#FF7F00] focus:outline-none transition"
              />
            </div>

            {/* Thumbnail Image */}
            <div>
              <label className="block mb-2 font-semibold text-gray-700">
                Thumbnail Image
              </label>
              <input
                type="file"
                accept="image/*"
                required
                onChange={(e) => setThumbnailFile(e.target.files[0])}
                className="w-full p-2.5 border border-gray-300 rounded-xl shadow-sm cursor-pointer focus:ring-2 focus:ring-[#FF7F00] focus:outline-none transition"
              />
            </div>

            {/* Submit Button */}
            <button
              type="submit"
              disabled={uploading}
              className={`w-full bg-[#FF7F00] text-white py-3 rounded-xl font-bold text-lg hover:bg-orange-600 transition-transform ${
                uploading
                  ? "opacity-70 cursor-not-allowed"
                  : "hover:-translate-y-1"
              }`}
            >
              {uploading ? "Uploading..." : "Submit Video"}
            </button>
          </form>
        </div>
      </main>

      <footer className="bg-white text-center text-gray-600 py-4 border-t-2 border-[#FF7F00] text-sm">
        © 2025 CatchUp2.0. All Rights Reserved.
      </footer>
    </div>
  );
}
