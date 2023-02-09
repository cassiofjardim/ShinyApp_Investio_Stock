library(imola)
library(tidyverse)
library(highcharter)
library(shinyWidgets)

card <- function(x1,card_title, subtitile ){
  tagList(
    div(
      style = 'padding: .25em;',
      class = 'card_main_div',

      div(
        style = 'display: flex; justify-content: space-between; align-items: baseline;margin: 0 1em;',
        h4(card_title , syle = 'font-weight: 900;'),
        span('41.25 PLN', style = 'display: inline-bock; color: green;font-weight: 700')
      ),

      div(
        style = 'display: flex; justify-content: space-between; align-items: baseline;margin: 0 1em;',
        h6(subtitile,
           syle = 'font-weight: 700;  color: red !important;'),
        span('41.25 PLN', style = 'display: inline-bock; color: red !important; font-weight: 600;')
      ),

      div(class = 'chart',
          style = 'width: 100%;
          ',
          div(x1)),

      div(
        class = 'switch',
        style = 'display: flex;
    justify-content: space-between;
    align-items: baseline;
    position: relative;padding: 0 1em;',
        materialSwitch(
          inputId = "input_switch",
          label = span("Notifications", style = 'color: gray; font-weight: 400'),
          value = TRUE
        ),
        span('Advanced chart', style = 'color: gray; font-weight: 400')

      )
  ))
}
