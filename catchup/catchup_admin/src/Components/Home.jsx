import React from "react";
import { useNavigate } from "react-router-dom";
import "../output.css";

const PRIMARY_COLOR_TEXT = "text-[#FF7F00]";
const PRIMARY_COLOR_BG = "bg-[#FF7F00]";
const LIGHT_BG = "bg-gray-50";

const Home = () => {
  const navigate = useNavigate();

  return (
    <div
      className={`${LIGHT_BG} min-h-screen flex flex-col items-center justify-center`}
    >
      <div className="bg-white p-8 rounded-2xl shadow-lg text-center w-full max-w-lg">
        <h1 className={`text-3xl font-bold mb-4 ${PRIMARY_COLOR_TEXT}`}>
          🧭 CatchUp Admin Dashboard
        </h1>
        <p className="text-gray-600 mb-8">
          Welcome back, Admin. Manage your uploaded news, media, and more.
        </p>

        <div className="space-y-4">
          <button
            onClick={() => navigate("/news")}
            className={`${PRIMARY_COLOR_BG} text-white w-full py-3 rounded-lg hover:opacity-90 transition font-semibold`}
          >
            View Uploaded News
          </button>
          <button
            onClick={() => navigate("/testimonials")}
            className={`${PRIMARY_COLOR_BG} text-white w-full py-3 rounded-lg hover:opacity-90 transition font-semibold`}
          >
            Testimonials
          </button>

          <button
            onClick={() => window.location.reload()}
            className="bg-gray-200 w-full py-3 rounded-lg hover:bg-gray-300 transition font-semibold"
          >
            Refresh Dashboard
          </button>
        </div>
      </div>
    </div>
  );
};

export default Home;
