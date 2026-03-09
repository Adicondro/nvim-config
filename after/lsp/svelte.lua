return{
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePost",{
      patter = { "*.js", "*.ts" },
      callback = function(ctx)
        client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
      end,
    })
  end,
}
