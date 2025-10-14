import React from "react";
import { Routes, Route } from "react-router-dom";
import Login from "./Components/Login";
import Home from "./Components/Home";
import News from "./Components/News";
import TestimonialsAdmin from "./Components/TestimonialsAdmin";
import AddAdmin from "./Components/AddAdmin";
import ProtectedRoute from "./Components/ProtectedRoute";
import NotFound from "./Components/NotFound";
import VideoUpload from "./Components/VideoUpload";

const App = () => {
  return (
    <div>
      <Routes>
        <Route path="/" element={<Login />} />
        <Route element={<ProtectedRoute />}>
          <Route path="/home" element={<Home />} />
          <Route path="/news" element={<News />} />
          <Route path="/testimonials" element={<TestimonialsAdmin />} />
          <Route path="/addAdmin" element={<AddAdmin />} />
          <Route path="*" element={<NotFound />} />
          <Route path="/videoUpload" element={<VideoUpload />} />
        </Route>
      </Routes>
    </div>
  );
};

export default App;
