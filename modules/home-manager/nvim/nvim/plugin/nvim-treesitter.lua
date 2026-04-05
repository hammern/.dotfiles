vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind

    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end

      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

vim.filetype.add({ pattern = { [".*/hypr/.*%.conf"] = "hyprlang" } })

local languages = {
  "bash",
  "c",
  "fish",
  "gitignore",
  "hyprlang",
  "lua",
  "markdown",
  "nix",
  "python",
  "rust",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
}

local isnt_installed = function(lang)
  return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
end

local to_install = vim.tbl_filter(isnt_installed, languages)
if #to_install > 0 then
  require("nvim-treesitter").install(to_install)
end

local filetypes = {}
for _, lang in ipairs(languages) do
  for _, filetype in ipairs(vim.treesitter.language.get_filetypes(lang)) do
    table.insert(filetypes, filetype)
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = filetypes,
  callback = function(ev)
    vim.treesitter.start(ev.buf)
  end,
})
