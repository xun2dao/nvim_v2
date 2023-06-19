require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})


require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "cmake", "pyright"},
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')
lspconfig.clangd.setup{
    capabilities = capabilities,
}
lspconfig.lua_ls.setup{
    capabilities = capabilities,
}
lspconfig.cmake.setup{
    capabilities = capabilities,
}
lspconfig.pyright.setup{
    capabilities = capabilities,
}
lspconfig.rust_analyzer.setup{
    capabilities = capabilities,
}
