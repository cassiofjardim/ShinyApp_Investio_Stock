
cards_charts_function <-  function(hc){

  hc %>%

    hc_xAxis(
      enabled = TRUE,
      title = TRUE,
      gridLineWidth = 0,

      categories = df_cards$x,
      style = list(fontStyle = '')
    ) %>%

    hc_yAxis(enabled = FALSE,
             opposite = TRUE,
             tickAmount = 6,
             gridLineWidth = 0.5,
             gridLineColor = 'gray',
             gridLineDashStyle = "longdash",
             title = FALSE,
             labels = list(
               align = 'left',
               fontWeight = 'bold',
               x = -20,
               y = -3,
               style = list(color =  'black',
                            fontWeight = "bold",
                            fontSize = '14px',
                            fontFamily = "Roboto Condensed")
             )) %>%

    hc_credits(enabled = FALSE) %>%
    hc_plotOptions(series = list(borderRadius = 3.5,
                                 marker = list(enabled = FALSE),
                                 lineWidth = 2,
                                 shadow = TRUE,
                                 fillOpacity = 0.25
    )) %>%
    hc_add_theme(hc_theme_elementary(chart = list(
      backgroundColor = 'white',
      margin = 0

    ))) %>%

    hc_size(height = 200)


}
