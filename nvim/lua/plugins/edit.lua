if true then
  return {}
end
return {
  {
    "folke/flash.nvim",
    keys = {
      -- 禁用默认的 s 和 S 映射
      { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "x", "o" }, false },
    },
  },
}
