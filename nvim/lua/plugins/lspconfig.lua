return {
	{
		"github/copilot.vim",
		enabled = true
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			'saghen/blink.cmp',
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{
							path = "${3rd}/luv/library",
							words = { "vim%.uv" }
						}
					}
				}
			}
		},
		config = function()
			local capabilities = require('blink.cmp').get_lsp_capabilities()

			require('lspconfig').gopls.setup {
				capabilities = capabilities
			}
			require('lspconfig').html.setup {
				capabilities = capabilities
			}
			require('lspconfig').lua_ls.setup {
				capabilities = capabilities
			}
			require("lspconfig").pyright.setup {
				capabilities = capabilities
			}
			require("lspconfig").ruff.setup {
				capabilities = capabilities
			}
			require("lspconfig").svelte.setup {
				capabilities = capabilities
			}
			require("lspconfig").ts_ls.setup {
				capabilities = capabilities
			}

			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function(args)
					vim.lsp.buf.format({ bufnr = args.buf })
				end
			})
		end
	}
}
