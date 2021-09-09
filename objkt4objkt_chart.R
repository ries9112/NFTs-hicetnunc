library(ghql)
library(jsonlite)
library(tidyverse)
library(ggdark)
library(scales)

# Tag to lookup:
tag = "objkt4objkt"

# connect to the endpoint
con = GraphqlClient$new(
  url = "https://api.hicdex.com/v1/graphql"
)

# initialize a new query
graphql_request = Query$new()

# Define query
graphql_request$query('mydata', paste0('query mySecondaryMarketSales {
  hic_et_nunc_trade(where: {token: {token_tags: {tag: {tag: {_ilike: ',tag,'}, _or: {}}}}}, order_by: {swap: {price: desc}}) {
    token {
      title
      mime
      description
      id
      artifact_uri
      display_uri
    }
    timestamp
    amount
    token_id
    swap {
      price
    }
  }
}'))

# Run query (pull data)
hen_data = con$exec(graphql_request$queries$mydata)
# convert results to JSON
hen_data = fromJSON(hen_data)
# extract dataframe
hen_data = hen_data$data$hic_et_nunc_trade
# Add Tezos price
hen_data$price_tezos = hen_data$swap$price/1000000
# Add date
hen_data$date = as.Date(hen_data$timestamp)
# Add datetime
hen_data$datetime = as.POSIXct(hen_data$timestamp)
# Order by datetime
hen_data = arrange(hen_data, datetime)

# Plot cumulative sum over time
ggplot(hen_data, aes(x=date, y=cumsum(price_tezos))) + 
  #with_outer_glow(geom_point(color="white",size=1.1),colour="deeppink",sigma=10,expand=1) +
  geom_point() +
  scale_y_continuous(name='Cumulative Trades in Tezos', labels = comma) +
  ggtitle(paste('Cumulative Tezos Traded -', tag,'in tag'), paste('Through:', max(hen_data$date))) +
  theme(axis.title.x=element_blank()) +
  dark_theme_gray() + 
  theme(plot.background = element_rect(fill = "grey10"),
        panel.background = element_blank(),
        panel.grid.major = element_line(color = "grey30", size = 0.2),
        panel.grid.minor = element_line(color = "grey30", size = 0.2),
        legend.background = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x=element_blank())
        
# Save chart as image
ggsave('objkt4objkt_sales.png')
