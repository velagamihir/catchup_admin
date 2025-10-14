import React, { useEffect, useState } from "react";
import { Navigate, Outlet } from "react-router-dom";
import { supabase } from "../SupabaseClient";

const ProtectedRoute = () => {
  const [session, setSession] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const getSession = async () => {
      const {
        data: { session },
      } = await supabase.auth.getSession();
      setSession(session);
      setLoading(false);
    };

    getSession();

    const { data: listener } = supabase.auth.onAuthStateChange(
      (_event, session) => {
        setSession(session);
      }
    );

    return () => listener.subscription.unsubscribe();
  }, []);

  if (loading) {
    return (
      <div className="flex justify-center items-center min-h-screen text-[#FF7F00] font-semibold">
        Checking authentication...
      </div>
    );
  }

  // 🚫 If not logged in → redirect to login
  if (!session) {
    return <Navigate to="/" replace />;
  }

  // ✅ If logged in → render nested route
  return <Outlet />;
};

export default ProtectedRoute;
