// src/pages/TestimonialsAdmin.jsx
import React, { useEffect, useState } from "react";
import { supabase } from "../SupabaseClient";
import "../output.css";

const PRIMARY_COLOR_TEXT = "text-[#FF7F00]";
const PRIMARY_COLOR_BG = "bg-[#FF7F00]";
const LIGHT_BG = "bg-gray-50";

const TestimonialsAdmin = () => {
  const [testimonials, setTestimonials] = useState([]);
  const [loading, setLoading] = useState(true);
  const [formData, setFormData] = useState({ name: "", role: "", message: "" });
  const [editingId, setEditingId] = useState(null);
  const [actionLoading, setActionLoading] = useState(false);

  useEffect(() => {
    fetchTestimonials();
  }, []);

  const fetchTestimonials = async () => {
    setLoading(true);
    const { data, error } = await supabase
      .from("testimonials")
      .select("*")
      .order("id", { ascending: true });
    if (error) console.error("Error fetching testimonials:", error.message);
    else setTestimonials(data);
    setLoading(false);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!formData.name || !formData.role || !formData.message) {
      alert("All fields are required.");
      return;
    }

    setActionLoading(true);
    if (editingId) {
      // Update existing testimonial
      const { error } = await supabase
        .from("testimonials")
        .update({ ...formData })
        .eq("id", editingId);
      if (error) alert("Failed to update testimonial.");
      else {
        setTestimonials(
          testimonials.map((t) =>
            t.id === editingId ? { ...t, ...formData } : t
          )
        );
        setEditingId(null);
        setFormData({ name: "", role: "", message: "" });
      }
    } else {
      // Add new testimonial
      const { data, error } = await supabase
        .from("testimonials")
        .insert([formData]);
      if (error) alert("Failed to add testimonial.");
      else setTestimonials([...testimonials, data[0]]);
      setFormData({ name: "", role: "", message: "" });
    }
    setActionLoading(false);
  };

  const handleEdit = (testimonial) => {
    setEditingId(testimonial.id);
    setFormData({
      name: testimonial.name,
      role: testimonial.role,
      message: testimonial.message,
    });
  };

  const handleDelete = async (id) => {
    const confirmed = window.confirm(
      "Are you sure you want to delete this testimonial?"
    );
    if (!confirmed) return;
    setActionLoading(true);
    const { error } = await supabase.from("testimonials").delete().eq("id", id);
    if (error) alert("Failed to delete testimonial.");
    else setTestimonials(testimonials.filter((t) => t.id !== id));
    setActionLoading(false);
  };

  const handleDeleteAll = async () => {
    const confirmed = window.confirm(
      "Are you sure you want to delete ALL testimonials?"
    );
    if (!confirmed) return;
    setActionLoading(true);
    const { error } = await supabase.from("testimonials").delete().neq("id", 0); // deletes all rows
    if (error) alert("Failed to delete all testimonials.");
    else setTestimonials([]);
    setActionLoading(false);
  };

  return (
    <div className={`${LIGHT_BG} min-h-screen p-6`}>
      <h1 className={`text-3xl font-bold mb-6 ${PRIMARY_COLOR_TEXT}`}>
        Manage Testimonials
      </h1>

      {/* Form to Add / Update */}
      <form onSubmit={handleSubmit} className="mb-8 max-w-md">
        <input
          type="text"
          placeholder="Name"
          value={formData.name}
          onChange={(e) => setFormData({ ...formData, name: e.target.value })}
          className="w-full px-4 py-2 mb-3 border rounded-lg focus:ring-2 focus:ring-orange-400"
        />
        <input
          type="text"
          placeholder="Role"
          value={formData.role}
          onChange={(e) => setFormData({ ...formData, role: e.target.value })}
          className="w-full px-4 py-2 mb-3 border rounded-lg focus:ring-2 focus:ring-orange-400"
        />
        <textarea
          placeholder="Message"
          value={formData.message}
          onChange={(e) =>
            setFormData({ ...formData, message: e.target.value })
          }
          className="w-full px-4 py-2 mb-3 border rounded-lg focus:ring-2 focus:ring-orange-400"
        />
        <button
          type="submit"
          disabled={actionLoading}
          className={`${PRIMARY_COLOR_BG} text-white w-full py-2 rounded-lg hover:opacity-90 transition font-semibold`}
        >
          {editingId
            ? actionLoading
              ? "Updating..."
              : "Update Testimonial"
            : actionLoading
            ? "Adding..."
            : "Add Testimonial"}
        </button>
      </form>

      {/* Delete All Button */}
      {testimonials.length > 0 && (
        <button
          onClick={handleDeleteAll}
          disabled={actionLoading}
          className="mb-6 bg-red-500 text-white py-2 px-4 rounded-lg hover:opacity-90 transition font-semibold"
        >
          Delete All Testimonials
        </button>
      )}

      {/* List of Testimonials */}
      {loading ? (
        <p>Loading testimonials...</p>
      ) : testimonials.length === 0 ? (
        <p>No testimonials found.</p>
      ) : (
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
          {testimonials.map((t) => (
            <div
              key={t.id}
              className="bg-white p-5 rounded-2xl shadow-md hover:shadow-lg transition"
            >
              <p className="text-gray-700 italic mb-2">"{t.message}"</p>
              <p className="font-bold text-orange-500">
                - {t.name} ({t.role})
              </p>
              <div className="mt-4 flex gap-2">
                <button
                  onClick={() => handleEdit(t)}
                  disabled={actionLoading}
                  className="bg-blue-500 text-white py-1 px-3 rounded-lg hover:opacity-90 transition"
                >
                  Edit
                </button>
                <button
                  onClick={() => handleDelete(t.id)}
                  disabled={actionLoading}
                  className="bg-red-500 text-white py-1 px-3 rounded-lg hover:opacity-90 transition"
                >
                  Delete
                </button>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default TestimonialsAdmin;
