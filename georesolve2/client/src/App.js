import React from "react";
import { Route, Routes } from "react-router-dom";
import "./output.css";
import Home from "./Components/Home/Home";
import Login from "./Components/Login";
import { ParallaxProvider } from "react-scroll-parallax";
const App = () => {
  return (
    <div>
      <ParallaxProvider>
        <Routes>
          <Route element={<Home />} path="/"></Route>
          <Route element={<Login />} path="/login"></Route>
        </Routes>
      </ParallaxProvider>
    </div>
  );
};

export default App;
