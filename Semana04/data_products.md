Covid19 in Guatemala
========================================================
author: William V. Paredes (Data Products Coursera Project)
date: 22/10/2020
autosize: true

Introduction
========================================================
This presentation is part of the Developing Data Products Coursera.org course project submission.

<p align="left">
<img src="covid19.jpg" width="400" height="200">
</p>

***
The application shows the progress of the pandemic COVID19 in Guatemala and makes a comparison per million inhabitants against neighboring Central American countries except for Belize.

Data Source: ourwordlindata




What is the purpose of the Shiny app?
========================================================
The application has 2 menus, the first one for analysis, where you can see a time series in lines and then another in columns, you can filter by date and use the button to update the plots. In it, she realizes how the pandemic crisis and its evolution in the territory have been handled.

The second is an arima autoregression model, with an impact forecast for the next 10 days, it has buttons above the graph where results are filtered by month, quarter, semester or year, in addition to a lower movable cursor to transpose the dates.

- You have to wait a few moments, as the data is loaded in real time.
- An own server was used, since some instructions did not work correctly in the free servers.


How the prediction works?
========================================================
For the ARIMA predictive model, the forecast and ggforify libraries were used. Part of the code is shown below.

- t_arima_datosgt <- auto.arima(datosgt$total_cases)
- datosgt_forecast <- forecast(t_arima_datosgt, level = c(95,80))
- df_datosgt <- fortify(datosgt_forecast)

I load a model of the total cases, then I generate a prediction with a regression fit between 80% and 95%, finally I use the fortify function to format the data that I will later paste in the plot.


Ready to give it a try?
========================================================
- Use the Shiny app at http://34.121.180.45:3838/data_products/
- Get the app source code at https://github.com/wparedesgt/project_pml/tree/gh-pages/data_products



