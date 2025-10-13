// src/pages/Login.jsx
import React, { useState } from "react";
import { supabase } from "../SupabaseClient";
import { useNavigate } from "react-router-dom";
import "../output.css";

const PRIMARY_COLOR_BG = "bg-[#FF7F00]";
const PRIMARY_COLOR_TEXT = "text-[#FF7F00]";

const Login = () => {
  const navigate = useNavigate();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const handleLogin = async (e) => {
    e.preventDefault();
    setError("");
    setLoading(true);

    try {
      // 🔥 Supabase login (no signup)
      const { data, error } = await supabase.auth.signInWithPassword({
        email,
        password,
      });

      if (error) throw error;

      // ✅ Redirect on success
      navigate("/home");
    } catch (err) {
      console.error("Login failed:", err.message);
      setError("Invalid email or password. Access denied.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50">
      <div className="bg-white p-8 rounded-2xl shadow-lg w-full max-w-md border-t-4 border-[#FF7F00]">
        <h1
          className={`text-3xl font-bold mb-6 text-center ${PRIMARY_COLOR_TEXT}`}
        >
          CatchUp Admin Login
        </h1>

        {error && <p className="text-red-500 text-center mb-4">{error}</p>}

        <form onSubmit={handleLogin} className="space-y-4">
          <input
            type="email"
            placeholder="Admin Email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            className="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-orange-400"
          />
          <input
            type="password"
            placeholder="Password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            className="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-orange-400"
          />
          <button
            type="submit"
            disabled={loading}
            className={`${PRIMARY_COLOR_BG} text-white w-full py-2 rounded-lg hover:opacity-90 transition font-semibold`}
          >
            {loading ? "Logging in..." : "Login"}
          </button>
        </form>

        <p className="text-xs text-center text-gray-500 mt-4">
          Authorized admins only. Unauthorized access is prohibited.
        </p>
      </div>
    </div>
  );
};

export default Login;
