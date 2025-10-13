import React from "react";
import { Routes, Route } from "react-router-dom";
import Login from "./Components/Login";
import Home from "./Components/Home";
import News from "./Components/News";
import TestimonialsAdmin from "./Components/TestimonialsAdmin";

const App = () => {
  return (
    <div>
      <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/home" element={<Home />} />
        <Route path="/news" element={<News />} />
        <Route path="/testimonials" element={<TestimonialsAdmin />} />
      </Routes>
    </div>
  );
};

export default App;
