import React, { useState, useEffect } from "react";
import { supabase } from "../SupabaseClient";
import { useNavigate } from "react-router-dom";
import { Edit2, Trash2 } from "lucide-react";

export default function VideoUpload() {
  const navigate = useNavigate();
  const [uploading, setUploading] = useState(false);
  const [ytLink, setYtLink] = useState("");
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");
  const [thumbnailFile, setThumbnailFile] = useState(null);
  const [videoFile, setVideoFile] = useState(null);

  // Video list state
  const [videos, setVideos] = useState([]);
  const [loadingVideos, setLoadingVideos] = useState(true);

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

  // Fetch all videos
  const fetchVideos = async () => {
    setLoadingVideos(true);
    const { data, error } = await supabase
      .from("catchup_media")
      .select("*")
      .order("created_at", { ascending: false });

    if (error) {
      console.error(error);
      alert("Failed to fetch videos");
    } else setVideos(data || []);
    setLoadingVideos(false);
  };

  useEffect(() => {
    fetchVideos();
  }, []);

  // Upload handler
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

      fetchVideos(); // refresh list
    } catch (err) {
      console.error(err);
      alert("❌ Error: " + err.message);
    } finally {
      setUploading(false);
    }
  };

  // Delete single video
  const deleteVideo = async (id) => {
    if (!window.confirm("Are you sure you want to delete this video?")) return;
    const { error } = await supabase
      .from("catchup_media")
      .delete()
      .eq("id", id);
    if (error) alert("Failed to delete video");
    else setVideos((prev) => prev.filter((v) => v.id !== id));
  };

  // Delete all videos
  const deleteAllVideos = async () => {
    if (!window.confirm("Are you sure you want to delete ALL videos?")) return;
    const { error } = await supabase
      .from("catchup_media")
      .delete()
      .neq("id", 0);
    if (error) alert("Failed to delete all videos");
    else setVideos([]);
  };

  // Edit video (prefill form)
  const editVideo = (video) => {
    setTitle(video.title);
    setDescription(video.description);
    setYtLink(video.video_link);
    // Optionally: allow editing thumbnail/video files
    window.scrollTo({ top: 0, behavior: "smooth" });
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

      {/* Main Content */}
      <main className="flex-grow flex flex-col items-center justify-start p-6 space-y-8">
        {/* Upload Form */}
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
                onChange={(e) => setThumbnailFile(e.target.files[0])}
                className="w-full p-2.5 border border-gray-300 rounded-xl shadow-sm cursor-pointer focus:ring-2 focus:ring-[#FF7F00] focus:outline-none transition"
              />
            </div>

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

        {/* Existing Videos List */}
        <div className="w-full max-w-5xl bg-white p-6 rounded-2xl shadow-xl border-t-4 border-[#FF7F00]">
          <h2 className="text-2xl font-bold text-[#FF7F00] mb-4">
            Uploaded Videos
          </h2>

          {loadingVideos ? (
            <p>Loading videos...</p>
          ) : videos.length === 0 ? (
            <p>No videos uploaded yet.</p>
          ) : (
            <>
              <table className="w-full text-left border-collapse shadow-md rounded-lg">
                <thead>
                  <tr className="bg-gray-100">
                    <th className="px-4 py-2">Title</th>
                    <th className="px-4 py-2">YouTube Link</th>
                    <th className="px-4 py-2">Uploaded At</th>
                    <th className="px-4 py-2">Actions</th>
                  </tr>
                </thead>
                <tbody>
                  {videos.map((v) => (
                    <tr key={v.id} className="border-b hover:bg-gray-50">
                      <td className="px-4 py-2">{v.title}</td>
                      <td className="px-4 py-2 break-all">{v.video_link}</td>
                      <td className="px-4 py-2">
                        {new Date(v.created_at).toLocaleString()}
                      </td>
                      <td className="px-4 py-2 flex gap-2">
                        <button
                          onClick={() => editVideo(v)}
                          className="bg-yellow-500 text-white px-3 py-1 rounded flex items-center gap-1"
                        >
                          <Edit2 size={16} /> Edit
                        </button>
                        <button
                          onClick={() => deleteVideo(v.id)}
                          className="bg-red-500 text-white px-3 py-1 rounded flex items-center gap-1"
                        >
                          <Trash2 size={16} /> Delete
                        </button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>

              <div className="mt-4 flex justify-end">
                <button
                  onClick={deleteAllVideos}
                  className="bg-red-600 text-white px-4 py-2 rounded shadow-md"
                >
                  Delete All Videos
                </button>
              </div>
            </>
          )}
        </div>
      </main>

      <footer className="bg-white text-center text-gray-600 py-4 border-t-2 border-[#FF7F00] text-sm">
        © 2025 CatchUp2.0. All Rights Reserved.
      </footer>
    </div>
  );
}
