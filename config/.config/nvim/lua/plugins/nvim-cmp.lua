return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip') -- Make sure you have luasnip installed and configured

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- Use luasnip to expand snippets
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(), -- Added for cycling up
        ['<C-n>'] = cmp.mapping.select_next_item(), -- Added for cycling down
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.close(), -- Added for closing the completion menu
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }), -- Use <CR> to confirm selection
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Keep your <C-y> mapping
      }),
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- Add luasnip as a source
      },
    })
  end
}
