import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { supabase } from "../SupabaseClient";
import {
  BarChart,
  Bar,
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  Legend,
  PieChart,
  Pie,
  Cell,
} from "recharts";
import {
  Menu,
  X,
  LayoutDashboard,
  LogOut,
  Newspaper,
  Users,
  Plus,
  Video,
  TrendingUp,
  BarChart2,
  Upload,
} from "lucide-react";

// 🎨 Original Color Palette Restored
const PRIMARY_COLOR_TEXT = "text-[#FF7F00]"; // Orange
const PRIMARY_COLOR_BG = "bg-[#FF7F00]";
const LIGHT_BG = "bg-gray-50";
const DARK_BG = "bg-slate-900";
const COLORS = ["#FF7F00", "#8884d8"]; // Orange and Blue-Violet

// 🔄 Skeleton Loader Component (Improved)
const SkeletonLoader = () => (
  <div className="animate-pulse space-y-8 p-4">
    {/* Stats Cards Skeleton */}
    <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
      <div className="h-32 bg-gray-200 rounded-2xl shadow-md"></div>
      <div className="h-32 bg-gray-200 rounded-2xl shadow-md"></div>
    </div>
    {/* Charts Skeleton */}
    <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
      <div className="lg:col-span-2 h-96 bg-gray-200 rounded-2xl shadow-md"></div>
      <div className="h-96 bg-gray-200 rounded-2xl shadow-md"></div>
    </div>
    <div className="h-80 bg-gray-200 rounded-2xl shadow-md"></div>
  </div>
);

// Navigation Item Component
const NavItem = ({
  icon: Icon,
  label,
  onClick,
  isActive = false,
  sidebarOpen,
}) => (
  <button
    onClick={onClick}
    className={`w-full px-4 py-3 rounded-xl flex items-center gap-3 group transition-all duration-300 transform hover:scale-[1.03] focus:outline-none ${
      isActive
        ? `${PRIMARY_COLOR_BG} text-white shadow-lg shadow-orange-700/50`
        : "text-slate-300 hover:text-white hover:bg-slate-700/50"
    }`}
    title={!sidebarOpen ? label : null}
  >
    <Icon
      size={20}
      className={`flex-shrink-0 transition-transform ${
        isActive ? "" : "group-hover:scale-110"
      }`}
    />
    <span
      className={`font-medium whitespace-nowrap transition-all duration-300 overflow-hidden ${
        !sidebarOpen ? "opacity-0 w-0" : "w-full"
      }`}
    >
      {label}
    </span>
  </button>
);

// Stat Card Component
const StatCard = ({ title, value, icon: Icon, color, bgColor }) => (
  <div className="bg-white rounded-2xl shadow-xl hover:shadow-2xl transition-all duration-300 p-6 flex items-center justify-between border-l-4 border-r-4 border-transparent hover:border-l-4 hover:border-r-4 hover:border-opacity-100 transform hover:-translate-y-0.5">
    <div>
      <p className="text-gray-500 text-sm mb-1 uppercase tracking-wider font-semibold">
        {title}
      </p>
      <h3 className={`text-4xl font-extrabold ${color}`}>{value}</h3>
    </div>
    <div
      className={`p-3 rounded-xl ${bgColor} transition-transform duration-300 group-hover:rotate-6`}
    >
      <Icon size={30} className={color} />
    </div>
  </div>
);

// Chart Container Component
const ChartContainer = ({ title, children, className = "" }) => (
  <div
    className={`bg-white rounded-2xl shadow-xl p-6 lg:p-8 transition-all duration-300 hover:shadow-2xl hover:ring-2 ring-[#FF7F00]/20 ${className}`}
  >
    <h3 className="text-xl font-bold mb-6 text-[#FF7F00] border-b border-gray-100 pb-3">
      {title}
    </h3>
    {children}
  </div>
);

// Custom Tooltip Component for Recharts
const CustomTooltip = ({ active, payload, label, isPie = false }) => {
  if (active && payload && payload.length) {
    return (
      <div className="bg-white/90 p-3 border border-gray-200 rounded-lg shadow-lg backdrop-blur-sm transition-opacity duration-300">
        <p className="font-bold text-sm mb-1 text-gray-700">
          {isPie ? "Distribution" : `Month: ${label}`}
        </p>
        <div className="space-y-1">
          {payload.map((p, index) => (
            <p key={index} className="text-xs flex items-center gap-2">
              <span
                style={{ backgroundColor: p.color }}
                className="w-2 h-2 rounded-full inline-block"
              ></span>
              <span className="text-gray-600">{p.name}:</span>
              <span className="font-semibold">{p.value}</span>
            </p>
          ))}
        </div>
      </div>
    );
  }
  return null;
};

// --- Main Home Component ---

const Home = () => {
  const navigate = useNavigate();
  const [monthlyStats, setMonthlyStats] = useState([]);
  const [totalNews, setTotalNews] = useState(0);
  const [totalVideos, setTotalVideos] = useState(0);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [sidebarOpen, setSidebarOpen] = useState(window.innerWidth >= 768);

  const logout = async () => {
    await supabase.auth.signOut();
    navigate("/");
  };

  useEffect(() => {
    const handleResize = () => {
      setSidebarOpen(window.innerWidth >= 768);
    };
    window.addEventListener("resize", handleResize);
    return () => window.removeEventListener("resize", handleResize);
  }, []);

  // 📈 Fetch news and video stats
  useEffect(() => {
    const fetchStats = async () => {
      try {
        const { data: newsData, error: newsErr } = await supabase
          .from("news_uploads")
          .select("created_at");

        const { data: videoData, error: videoErr } = await supabase
          .from("catchup_media")
          .select("created_at");

        if (newsErr || videoErr) throw newsErr || videoErr;

        // Initialize monthly stats for the current year
        const stats = Array.from({ length: 12 }, (_, i) => ({
          month: new Date(0, i).toLocaleString("default", { month: "short" }),
          news: 0,
          videos: 0,
        }));

        newsData.forEach((n) => {
          const month = new Date(n.created_at).getMonth();
          if (stats[month]) stats[month].news += 1;
        });

        videoData.forEach((v) => {
          const month = new Date(v.created_at).getMonth();
          if (stats[month]) stats[month].videos += 1;
        });

        // Calculate cumulative values for the Line Chart
        let cumulativeNews = 0;
        let cumulativeVideos = 0;
        const cumulativeStats = stats.map((s) => {
          cumulativeNews += s.news;
          cumulativeVideos += s.videos;
          return {
            ...s,
            cumulativeNews,
            cumulativeVideos,
          };
        });

        setMonthlyStats(cumulativeStats);
        setTotalNews(newsData.length);
        setTotalVideos(videoData.length);
      } catch (err) {
        console.error("Error fetching stats:", err);
        setError("Failed to load dashboard stats.");
      } finally {
        setLoading(false);
      }
    };

    fetchStats();
  }, []);

  const pieData = [
    { name: "News", value: totalNews },
    { name: "Videos", value: totalVideos },
  ];

  return (
    <div className={`${LIGHT_BG} min-h-screen flex`}>
      {/* Mobile Overlay */}
      {sidebarOpen && window.innerWidth < 768 && (
        <div
          className="fixed inset-0 bg-black/50 z-40 transition-opacity duration-300"
          onClick={() => setSidebarOpen(false)}
        ></div>
      )}

      {/* Sidebar */}
      <div
        className={`${
          sidebarOpen ? "w-64" : "w-20"
        } ${DARK_BG} h-screen shadow-2xl transition-all duration-300 ease-in-out flex flex-col fixed md:relative z-50`}
      >
        {/* Header with Logo and Close Button */}
        <div className="flex items-center justify-between px-4 py-6 border-b border-slate-700/50">
          <div className={`${PRIMARY_COLOR_BG} p-2 rounded-xl shadow-lg`}>
            <BarChart2 size={24} className="text-white" />
          </div>

          {/* Close button - visible on mobile only */}
          <button
            onClick={() => setSidebarOpen(false)}
            className="p-2 hover:bg-slate-700/50 rounded-full text-slate-300 hover:text-white transition duration-200 focus:outline-none md:hidden"
            title="Close Sidebar"
          >
            <X size={22} />
          </button>

          {/* Collapse button - visible on desktop only when expanded */}
          {sidebarOpen && (
            <button
              onClick={() => setSidebarOpen(false)}
              className="hidden md:flex p-2 hover:bg-slate-700/50 rounded-full text-slate-300 hover:text-white transition duration-200 focus:outline-none"
              title="Collapse Sidebar"
            >
              <X size={22} />
            </button>
          )}
        </div>

        {/* Navigation Section */}
        <nav className="flex-1 px-3 py-6 space-y-3 overflow-y-auto">
          <NavItem
            icon={LayoutDashboard}
            label="Dashboard"
            onClick={() => navigate("/home")}
            isActive={true}
            sidebarOpen={sidebarOpen}
          />
          <NavItem
            icon={Newspaper}
            label="News"
            onClick={() => navigate("/news")}
            sidebarOpen={sidebarOpen}
          />
          <NavItem
            icon={Users}
            label="Testimonials"
            onClick={() => navigate("/testimonials")}
            sidebarOpen={sidebarOpen}
          />
          <NavItem
            icon={Plus}
            label="Add Admin"
            onClick={() => navigate("/addAdmin")}
            sidebarOpen={sidebarOpen}
          />
          <NavItem
            icon={Upload}
            label="Video Upload"
            onClick={() => navigate("/videoUpload")}
            sidebarOpen={sidebarOpen}
          />
        </nav>

        {/* Logout Button */}
        <div className="px-3 py-4 border-t border-slate-700/50">
          <button
            onClick={logout}
            className="w-full px-4 py-3 rounded-xl flex items-center gap-3 group bg-red-600/20 hover:bg-red-600/30 text-red-400 hover:text-red-300 transition-all duration-300 transform hover:scale-[1.02]"
            title={!sidebarOpen ? "Logout" : null}
          >
            <LogOut
              size={20}
              className="flex-shrink-0 group-hover:rotate-1 transition-transform"
            />
            <span
              className={`font-medium transition-all duration-300 ${
                !sidebarOpen && "opacity-0 w-0"
              }`}
            >
              Logout
            </span>
          </button>
        </div>
      </div>

      {/* Main Content Area */}
      <div className="flex-1 flex flex-col relative">
        {/* Header */}
        <header className="sticky top-0 z-10 bg-gradient-to-r from-white to-gray-50 shadow-md border-b-4 border-[#FF7F00]/20 w-full">
          <div className="px-6 sm:px-8 py-5 flex items-center gap-4">
            {/* Mobile Menu Toggle */}
            {!sidebarOpen && (
              <button
                onClick={() => setSidebarOpen(true)}
                className="md:hidden p-2 hover:bg-gray-200 rounded-full text-gray-700 transition duration-200 focus:outline-none"
                title="Open Sidebar"
              >
                <Menu size={22} />
              </button>
            )}

            <div className="flex-1">
              <h2
                className={`text-3xl font-extrabold ${PRIMARY_COLOR_TEXT} mb-1`}
              >
                Admin Dashboard
              </h2>
              <p className="text-gray-500 text-sm">
                Manage your content and monitor performance
              </p>
            </div>

            <div className="text-right hidden sm:block">
              <p className="text-gray-600 font-semibold">
                Welcome back, Admin 👋
              </p>
              <p className="text-gray-400 text-sm mt-1">
                {new Date().toLocaleDateString("en-US", {
                  weekday: "long",
                  year: "numeric",
                  month: "long",
                  day: "numeric",
                })}
              </p>
            </div>
          </div>
        </header>

        {/* Dashboard Content */}
        <main className="flex-1 p-6 md:p-8 overflow-auto">
          {loading ? (
            <SkeletonLoader />
          ) : error ? (
            <div className="bg-red-50 border border-red-200 rounded-2xl p-6 text-red-700 shadow-inner">
              <p className="font-semibold">{error}</p>
            </div>
          ) : (
            <div className="space-y-8">
              {/* Quick Stats Row */}
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                <StatCard
                  title="Total News"
                  value={totalNews}
                  icon={Newspaper}
                  color={PRIMARY_COLOR_TEXT}
                  bgColor={`${PRIMARY_COLOR_BG}/10`}
                />
                <StatCard
                  title="Total Videos"
                  value={totalVideos}
                  icon={Video}
                  color="text-blue-600"
                  bgColor="bg-blue-100"
                />
                <StatCard
                  title="Total Content"
                  value={totalNews + totalVideos}
                  icon={TrendingUp}
                  color="text-green-600"
                  bgColor="bg-green-100"
                />
              </div>

              {/* Charts Section */}
              <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
                {/* Bar Chart */}
                <ChartContainer
                  title="Monthly Upload Overview"
                  className="lg:col-span-2"
                >
                  <div className="h-96 w-full">
                    <ResponsiveContainer width="100%" height="100%">
                      <BarChart
                        data={monthlyStats}
                        margin={{ top: 20, right: 30, left: 0, bottom: 10 }}
                      >
                        <CartesianGrid strokeDasharray="4 4" stroke="#e0e0e0" />
                        <XAxis
                          dataKey="month"
                          tickLine={false}
                          axisLine={false}
                        />
                        <YAxis axisLine={false} tickLine={false} />
                        <Tooltip content={<CustomTooltip />} />
                        <Legend wrapperStyle={{ paddingTop: "10px" }} />
                        <Bar
                          dataKey="news"
                          fill="#FF7F00"
                          name="News Uploaded"
                          radius={[8, 8, 0, 0]}
                        />
                        <Bar
                          dataKey="videos"
                          fill="#8884d8"
                          name="Videos Uploaded"
                          radius={[8, 8, 0, 0]}
                        />
                      </BarChart>
                    </ResponsiveContainer>
                  </div>
                </ChartContainer>

                {/* Pie Chart */}
                <ChartContainer title="Content Distribution">
                  <div className="h-80 w-full flex items-center justify-center">
                    <ResponsiveContainer width="100%" height="100%">
                      <PieChart>
                        <Pie
                          data={pieData}
                          cx="50%"
                          cy="50%"
                          labelLine={false}
                          label={({ name, percent }) =>
                            `${name}: ${(percent * 100).toFixed(0)}%`
                          }
                          outerRadius={100}
                          fill="#8884d8"
                          dataKey="value"
                          innerRadius={50}
                          paddingAngle={5}
                        >
                          {pieData.map((entry, index) => (
                            <Cell
                              key={`cell-${index}`}
                              fill={COLORS[index % COLORS.length]}
                              className="transition-all duration-300 hover:opacity-80"
                            />
                          ))}
                        </Pie>
                        <Tooltip content={<CustomTooltip isPie={true} />} />
                        <Legend
                          layout="horizontal"
                          align="center"
                          verticalAlign="bottom"
                          wrapperStyle={{ paddingTop: "10px" }}
                        />
                      </PieChart>
                    </ResponsiveContainer>
                  </div>
                </ChartContainer>
              </div>

              {/* Line Chart */}
              <ChartContainer title="Cumulative Growth Trend">
                <div className="h-80 w-full">
                  <ResponsiveContainer width="100%" height="100%">
                    <LineChart
                      data={monthlyStats}
                      margin={{ top: 20, right: 30, left: 0, bottom: 10 }}
                    >
                      <CartesianGrid strokeDasharray="3 3" stroke="#e0e0e0" />
                      <XAxis
                        dataKey="month"
                        tickLine={false}
                        axisLine={false}
                      />
                      <YAxis axisLine={false} tickLine={false} />
                      <Tooltip content={<CustomTooltip />} />
                      <Legend wrapperStyle={{ paddingTop: "10px" }} />
                      <Line
                        type="monotone"
                        dataKey="cumulativeNews"
                        stroke="#FF7F00"
                        strokeWidth={3}
                        dot={{ fill: "#FF7F00", r: 4 }}
                        name="Cumulative News"
                        activeDot={{ r: 8 }}
                      />
                      <Line
                        type="monotone"
                        dataKey="cumulativeVideos"
                        stroke="#8884d8"
                        strokeWidth={3}
                        dot={{ fill: "#8884d8", r: 4 }}
                        name="Cumulative Videos"
                        activeDot={{ r: 8 }}
                      />
                    </LineChart>
                  </ResponsiveContainer>
                </div>
              </ChartContainer>
            </div>
          )}
        </main>
      </div>
    </div>
  );
};

export default Home;
