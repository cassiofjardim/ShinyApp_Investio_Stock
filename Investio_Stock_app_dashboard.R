library(shiny)
library(imola)
library(tidyverse)
library(highcharter)
library(shinyWidgets)

ui <- navbarPage(id = 'menus',

   title = tags$img(src = 'img/instagram.png'),

  includeCSS(path = 'www/css/style.css'),

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  textInput("searchField",
            placeholder = 'Search for a Company',
            tags$img(class = 'google_icon',
                     src = 'img/google.png',width = '24px', height = '24px'),
            ),

  div(class = "marquee-container",
      div(class = "marquee",
          lista_marquee,lista_marquee)
  ),
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  tabPanel("My Companies",

           gridPanel(
             title = 'Tutorial',
             id = 'main_grid',

             areas =   list(
               default = c(
                 "hello hello revenue revenue",
                 "investments_radar investments_radar investments_radar investments_radar ",
                 "card_1 card_2 card_3 card_4"

               ),
               md = c(
                 "hello revenue",
                 "investments_radar investments_radar ",
                 "card_1 card_2",
                 "card_3 card_4"
               )
             ),
             columns = list(default = "1fr 1fr 1fr 1fr",
                            md = "1fr 1fr ",
                            xs =  "1fr"),

             gap = '3em',
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
             div(class = 'hello',
                 style = 'grid-area: hello; ',
                 div(class = 'message_top',

                     h3(tags$img(src = 'img/hello.png',width = '24px', height = '24px'),
                        "Hello Hans, its good to be back"),
                     tags$button(

                       tags$img(src = 'img/synch.png',width = '24px', height = '24px',
                              'Sync with Google Charts'))),

                 div(
                   class = 'current_portfolio',

                   h4('Current Portfolio'),
                   div(
                   class = 'pickers',
                   pickerInput(
                     inputId = "savings",
                     label = "",
                     choices = c("My savings")
                   ),

                   pickerInput(
                     inputId = "investments",
                     label = "",
                     choices = c("+ Add Wallets"),
                     choicesOpt = list(
                       icon = c("glyphicon-folder-close"))
                   ))
                 ),
                 div(class = 'message_bottom',

                    div(
                      h5("My Holdings"),
                      h3("$32.568,52"),
                      strong("Today: +9.25 (%)")

                     ),
                    div(
                      h5("My Revenue"),
                      h3("$132.568,52"),
                      strong("This Month: -232,56 (%)")

                    )
                 )
                 ),
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
             div(class = 'revenue',
                 style = 'grid-area: revenue; ',
                 div(
                   class = 'pickers_div',

                   h4('Revenue Stats'),

                 div(
                   class = 'revenue_pickers',
                   style = 'display: flex; gap: 1em;',
                   pickerInput(
                     inputId = "revenue_1",
                     label = "",
                     choices = c("Monthly")
                   ),
                   pickerInput(
                     inputId = "revenue_2",
                     label = "",
                     choices = c("View Reports"),
                     choicesOpt = list(
                       icon = c("glyphicon-eye-open" ))
                   ))),

                 div(
                   class = 'revenue_bottom',

                   div(class = 'left_right',
                     div(class = 'left',

                         actionButton(inputId = 'modal',
                                      label =tags$img(src = "img/download.png",
                                                      span("Advanced - Others Stats",
                                                           style = 'font-size: .75em;
                                                           color: blue;font-weight: 600;'),
                                      width = '16px', height = '16px')),
                         p("Average monthly revenue"),

                         tags$span("$ 3.450,98"),
                         br(),
                         p("Transactions - Info")

                         ),


                     highchartOutput('chart_revenue', height = 200)
                   )

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
                 )),
             div(class = 'investments_radar',
                 h4("Investment Radar"),
                 div(
                   class = 'investments_radar_pickers',
                   pickerInput(
                     inputId = "revenue_1",
                     label = "",
                     choices = c("Edit list")
                   ),
                   pickerInput(
                     inputId = "revenue_2",
                     label = "",
                     choices = c("+ Add Instrument"),
                     choicesOpt = list(
                       icon = c("glyphicon-th"))
                   ))),

             div(class = 'card_1',
                 style = 'grid-area: card_1;',
                 card(card_title = span(tags$img(src = 'img/card_title_1.png',
                                                 width = '20px', height = '20px'),
                                        "PKO (PKOB)", style = 'font-weight: 700;'),
                      subtitile = "Update: Global Equity",
                      x1 = highchartOutput('chart_1', height = 200))),

             div(class = 'card_2',
                 style = 'grid-area: card_2;',
                 card(card_title = span(tags$img(src = 'img/card_title_2.png',
                                                 width = '20px', height = '20px'),
                                        "CAT.US", style = 'font-weight: 700;'),
                      subtitile = "Update: Americas Equity",
                      x1 = highchartOutput('chart_2', height = 200))),

             div(class = 'card_3',
                 style = 'grid-area: card_3;',
                 card(card_title = span(tags$img(src = 'img/card_title_3.png',
                                                 width = '20px', height = '20px'),
                                        "KGH (XGHM)", style = 'font-weight: 700;'),
                      subtitile = "Update: Global Equity",
                      x1 = highchartOutput('chart_3', height = 200))),

             div(class = 'card_4',
                 style = 'grid-area: card_4;',
                 card(card_title = span(tags$img(src = 'img/card_title_4.png',
                                                 width = '20px', height = '20px'),
                                        "CDR (CDR)", style = 'font-weight: 700;'),
                      subtitile = "Update: Investment Funds Equity",
                      x1 = highchartOutput('chart_4', height = 200)))


             )),
  tabPanel("Wallets"),
  tabPanel("IPO")
)

server <- function(input, output, session) {

  output$chart_revenue <- renderHighchart({

    hchart(df_revenue, "column",
           hcaes(x, y, color =colors),

           name = "Revenue",
           color = 'black',
           showInLegend = TRUE)  %>%
      hc_xAxis(enabled = TRUE,
               title = TRUE,

               categories = df_revenue$x,
               style = list(fontStyle = '')) %>%

      hc_yAxis(enabled = FALSE,
               title = FALSE) %>%

      hc_credits(enabled = TRUE) %>%
      hc_plotOptions(series = list(borderRadius = 3.5))%>%
      hc_size(height = 200)


  })

  charts_function <- function(grafico) {

    sample_2_colors <-  sample(c('#0F60D2', '#EF2D3E'),1)

    output[[paste0('chart_', grafico)]] <- renderHighchart({

      hchart(
        df_cards,
        "areaspline",
        hcaes(x, y, color = colors),

        name = "Revenue",
        color = sample_2_colors,
        showInLegend = TRUE
      )  %>%

        cards_charts_function()

    })
  }

  1:4 %>% map(~charts_function(grafico = .x))

}

shinyApp(ui, server)
