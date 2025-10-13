import React, { useState } from "react";
import { supabase } from "../SupabaseClient";

const AddAdmin = () => {
  const PRIMARY_COLOR_BG = "bg-[#FF7F00]";
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [role, setRole] = useState("admin"); // default role
  const [message, setMessage] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();
    setMessage("");

    try {
      // 1. Create user (sends verification email)
      const { data: signUpData, error: signUpError } =
        await supabase.auth.signUp({
          email,
          password,
        });

      if (signUpError) {
        setMessage(`Error: ${signUpError.message}`);
        return;
      }

      // 2. Add user to admins table with role
      const { data: profileData, error: profileError } = await supabase
        .from("admins") // make sure this table exists
        .insert([{ email, role }]);

      if (profileError) {
        setMessage(`Error adding to admins table: ${profileError.message}`);
        return;
      }

      setMessage(
        `Admin created successfully! Verification email sent to ${email}`
      );
      setEmail("");
      setPassword("");
    } catch (err) {
      console.error(err);
      setMessage("Something went wrong!");
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-100 p-4 pb-10 overflow-auto">
      <form
        onSubmit={handleSubmit}
        className="bg-white p-6 sm:p-8 rounded-lg shadow-lg w-full max-w-md"
      >
        <h2 className="text-2xl font-bold mb-6 text-center text-orange-500">
          Add New Admin
        </h2>

        <label className="block mb-2 font-semibold">Email</label>
        <input
          type="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
          placeholder="admin@example.com"
          className="w-full px-4 py-3 mb-4 border rounded-lg focus:ring-2 focus:ring-orange-400 focus:outline-none"
        />

        <label className="block mb-2 font-semibold">Password</label>
        <input
          type="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
          placeholder="Enter a strong password"
          className="w-full px-4 py-3 mb-4 border rounded-lg focus:ring-2 focus:ring-orange-400 focus:outline-none"
        />

        <label className="block mb-2 font-semibold">Role</label>
        <select
          value={role}
          onChange={(e) => setRole(e.target.value)}
          className="w-full px-4 py-3 mb-6 border rounded-lg focus:ring-2 focus:ring-orange-400 focus:outline-none"
        >
          <option value="admin">Admin</option>
          <option value="editor">Editor</option>
        </select>

        <button
          type="submit"
          className={`w-full block bg-orange border border-2 font-bold py-3 rounded-lg hover:${PRIMARY_COLOR_BG} transition-all`}
        >
          Add Admin
        </button>

        {message && (
          <p className="mt-4 text-center text-gray-700 font-medium">
            {message}
          </p>
        )}
      </form>
    </div>
  );
};

export default AddAdmin;
