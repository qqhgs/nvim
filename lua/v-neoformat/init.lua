-- autoformat
if Var.format_on_save then
  require("v-utils").define_augroups {
    autoformat = {
      {
        "BufWritePre",
        "*",
        [[try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry]],
      },
    },
  }
end
