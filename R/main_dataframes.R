df_revenue <- data.frame(x = paste0(month.abb[1:5]," - 2021"),
                         y = runif(n = 5,min = 20, max = 30),
                         colors = c(color = c('#0F60D2','#0F60D2',
                                              '#EF2D3E','#EF2D3E',
                                              '#EF2D3E')))



df_cards <- data.frame(
  x = paste0(month.abb[1:5], " - 2021"),
  y = runif(n = 5, min = 20, max = 30),
  colors = c(
    color = c('#0F60D2', '#0F60D2', '#EF2D3E', '#EF2D3E', '#EF2D3E')
  )
)
