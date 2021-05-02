library(pacman)
#devtools::install_github('thomasp85/ggfx')
# devtools::install_github('lenkiefer/darklyplot')

# Load packages
p_load('pins','ggplot2','anytime','ggthemes','fs','gganimate','magick','dplyr','devtools',
       'transformr', 'ggforce','scales','tidyr','glue','darklyplot','ggfx', 'gridExtra')

# Register Board for data pull
board_register("https://raw.githubusercontent.com/predictcrypto/pins/master/","pins_repo")

#### Visualize Stats ####
# Pull data
stats_hicetnunc <- pin_get("stats_hicetnunc", "pins_repo")
# Daily Users
ggplot(data = stats_hicetnunc,
       aes(x = as.POSIXct(date_time_utc), y = stats_day_users)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: better-call.dev API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = stats_day_users == max(stats_day_users),
                        label = date_time_utc,
                        description = paste0('Max daily users - ', stats_day_users))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = stats_day_users == min(stats_day_users),
                        label = date_time_utc,
                        description = paste0('Min daily users - ', stats_day_users))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Number of Users') +
  ggtitle(paste('hic et nunc Daily Users')) 
# Save chart as image
ggsave('stats_hicetnunc_daily_users.png')
# Also archive
ggsave(glue('archive/users/stats_hicetnunc_daily_users_{Sys.Date()}.png'))


# Daily Transactions
ggplot(data = stats_hicetnunc,
       aes(x = as.POSIXct(date_time_utc), y = stats_day_txs)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: better-call.dev API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = stats_day_txs == max(stats_day_txs),
                        label = date_time_utc,
                        description = paste0('Max daily txs - ', stats_day_txs))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = stats_day_txs == min(stats_day_txs),
                        label = date_time_utc,
                        description = paste0('Min daily txs - ', stats_day_txs))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Number of Transactions') +
  ggtitle(paste('hic et nunc Daily Transactions')) 
# Save chart as image
ggsave('stats_hicetnunc_daily_txs.png')
# Also archive
ggsave(glue('archive/transactions/stats_hicetnunc_daily_txs_{Sys.Date()}.png'))


# Weekly Users
ggplot(data = stats_hicetnunc,
       aes(x = as.POSIXct(date_time_utc), y = stats_week_users)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: better-call.dev API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = stats_week_users == max(stats_week_users),
                        label = date_time_utc,
                        description = paste0('Max weekly users - ', stats_week_users))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = stats_week_users == min(stats_week_users),
                        label = date_time_utc,
                        description = paste0('Min weekly users - ', stats_week_users))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Number of Users') +
  ggtitle(paste('hic et nunc Weekly Users')) 
# Save chart as image
ggsave('stats_hicetnunc_week_users.png')
# Also archive
ggsave(glue('archive/users/stats_hicetnunc_week_users_{Sys.Date()}.png'))


# Weekly Transactions
ggplot(data = stats_hicetnunc,
       aes(x = as.POSIXct(date_time_utc), y = stats_week_txs)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: better-call.dev API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = stats_week_txs == max(stats_week_txs),
                        label = date_time_utc,
                        description = paste0('Max weekly txs - ', stats_week_txs))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = stats_week_txs == min(stats_week_txs),
                        label = date_time_utc,
                        description = paste0('Min weekly txs - ', stats_week_txs))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Number of Transactions') +
  ggtitle(paste('hic et nunc Weekly Transactions')) 
# Save chart as image
ggsave('stats_hicetnunc_week_txs.png')
# Also archive
ggsave(glue('archive/transactions/stats_hicetnunc_week_txs_{Sys.Date()}.png'))


# Monthly Users
ggplot(data = stats_hicetnunc,
       aes(x = as.POSIXct(date_time_utc), y = stats_month_users)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: better-call.dev API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = stats_month_users == max(stats_month_users),
                        label = date_time_utc,
                        description = paste0('Max monthly users - ', stats_month_users))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = stats_month_users == min(stats_month_users),
                        label = date_time_utc,
                        description = paste0('Min monthly users - ', stats_month_users))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Number of Users') +
  ggtitle(paste('hic et nunc Monthly Users')) 
# Save chart as image
ggsave('stats_hicetnunc_month_users.png')
# Also archive
ggsave(glue('archive/users/stats_hicetnunc_month_users_{Sys.Date()}.png'))


# Monthly Transactions
ggplot(data = stats_hicetnunc,
       aes(x = as.POSIXct(date_time_utc), y = stats_month_txs)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: better-call.dev API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = stats_month_txs == max(stats_month_txs),
                        label = date_time_utc,
                        description = paste0('Max monthly txs - ', stats_month_txs))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = stats_month_txs == min(stats_month_txs),
                        label = date_time_utc,
                        description = paste0('Min monthly txs - ', stats_month_txs))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Number of Transactions') +
  ggtitle(paste('hic et nunc Monthly Transactions')) 
# Save chart as image
ggsave('stats_hicetnunc_month_txs.png')
# Also archive
ggsave(glue('archive/transactions/stats_hicetnunc_month_txs_{Sys.Date()}.png'))


# All-time Users
ggplot(data = stats_hicetnunc,
       aes(x = as.POSIXct(date_time_utc), y = stats_all_users)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: better-call.dev API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = stats_all_users == max(stats_all_users),
                        label = date_time_utc,
                        description = paste0('all time users - ', stats_all_users))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Number of Users') +
  ggtitle(paste('hic et nunc Total Users')) 
# Save chart as image
ggsave('stats_hicetnunc_all_users.png')
# Also archive
ggsave(glue('archive/users/stats_hicetnunc_all_users_{Sys.Date()}.png'))

# All-time Transactions
ggplot(data = stats_hicetnunc,
       aes(x = as.POSIXct(date_time_utc), y = stats_all_txs)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: better-call.dev API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = stats_all_txs == max(stats_all_txs),
                        label = date_time_utc,
                        description = paste0('all time txs - ', stats_all_txs))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Number of Transactions') +
  ggtitle(paste('hic et nunc All-Time Transactions')) 
# Save chart as image
ggsave('stats_hicetnunc_all_txs.png')
# Also make an archive
ggsave(glue('archive/transactions/stats_hicetnunc_all_txs_{Sys.Date()}.png'))


# TODO - Calculate % of all the network that is active based on day, week, month
stats_hicetnunc_percent = mutate(stats_hicetnunc, 
                                 Day = stats_day_users/stats_all_users,
                                 Week = stats_week_users/stats_all_users,
                                 Month = stats_month_users/stats_all_users)
# Reshape the data to avoid issues coloring
stats_hicetnunc_percent = gather(stats_hicetnunc_percent, key = "days_out", 
                                 value = "percent_active", Day, Week, Month) %>% 
  select(date_utc, date_time_utc, days_out, percent_active)
# Reorder factors
stats_hicetnunc_percent$days_out <- factor(stats_hicetnunc_percent$days_out, 
                                           levels = c("Day", "Week", "Month"))

# Visualize Active Users
ggplot(data = stats_hicetnunc_percent,
       aes(x = as.POSIXct(date_time_utc), y = percent_active, color=days_out)) + 
  geom_line(size=1.2) +
  geom_point(size=2.5) +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc_percent$date_time_utc), ' - UTC'),
       caption='Data source: better-call.dev API') + 
  theme_solarized() +
  xlab('Date Time Collected (UTC)') +
  ylab('Active Users % of Total') +
  ggtitle(paste('hic et nunc Active Users - Percent of Total'))  + 
  labs(color='Days Out') +
  scale_y_continuous(labels = scales::percent) +
  scale_x_datetime(date_labels = "%m/%d/%y") +
  # Tried changing the order but was not able to
  scale_color_manual(labels = c("Day", "Week","Month"), values = c("#6DB9BE", "#87BE6D", "#876DBE"))
# Save chart as image
ggsave('stats_hicetnunc_active_users.png')
# Also make an archive
ggsave(glue('archive/active_users_percent/stats_hicetnunc_active_users_{Sys.Date()}.png'))

# 
# # GGFX - WAITING TO PROPERLY TEST inner AND outer GLOW ONCE MORE DATA COMES IN!
# ggplot(data = stats_hicetnunc_percent,
#        aes(x = as.POSIXct(date_time_utc), y = percent_active, color=days_out)) + 
#   with_outer_glow(geom_line(size=1.2)) + # Can do either `with_inner_glow` or `with_outer_glow`
#   #with_inner_glow(geom_point(size=5)) +
#   labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc_percent$date_time_utc), ' - UTC'),
#        caption='Data source: better-call.dev API') + 
#   theme_solarized() +
#   xlab('Date Time Collected (UTC)') +
#   ylab('Active Users % of Total') +
#   ggtitle(paste('Hicetnunc Active Users - Percent of Total'))  + 
#   labs(color='Days Out') +
#   scale_y_continuous(labels = scales::percent) +
#   scale_x_datetime(date_labels = "%m/%d/%y") +
#   # Tried changing the order but was not able to
#   scale_color_manual(labels = c("Day", "Week","Month"), values = c("#6DB9BE", "#87BE6D", "#876DBE"))
# #darklyplot::theme_dark2()
# # Save chart as image
# ggsave('stats_hicetnunc_active_users.png')
# # Also make an archive
# ggsave(glue('archive/active_users_percent/stats_hicetnunc_active_users_{Sys.Date()}.png'))


# NOW hDAO
# Pull data
hdao_price <- pin_get("hdao_price", "pins_repo")
# Daily Users
ggplot(data = hdao_price,
       aes(x = as.POSIXct(date_time_utc), y = hdao_price)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: tzkt.io API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = hdao_price == max(hdao_price),
                        label = date_time_utc,
                        description = paste0('Max price - ', hdao_price))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = hdao_price == min(hdao_price),
                        label = date_time_utc,
                        description = paste0('Min price - ', hdao_price))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Price ($XTZ)') +
  ggtitle(paste('Price of hDAO ($XTZ)')) 
# Save chart as image
ggsave('hdao_price.png')
# Also archive
ggsave(glue('archive/hdao_price/hdao_price_{Sys.Date()}.png'))



# NOW wrap
# Pull data
wrap_price <- pin_get("wrap_price", "pins_repo")
# Daily Users
ggplot(data = wrap_price,
       aes(x = as.POSIXct(date_time_utc), y = wrap_price)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: tzkt.io API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = wrap_price == max(wrap_price),
                        label = date_time_utc,
                        description = paste0('Max price - ', wrap_price))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = wrap_price == min(wrap_price),
                        label = date_time_utc,
                        description = paste0('Min price - ', wrap_price))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Price ($XTZ)') +
  ggtitle(paste('Price of WRAP ($XTZ)')) 
# Save chart as image
ggsave('wrap_price.png')
# Also archive
ggsave(glue('archive/wrap_price/wrap_price_{Sys.Date()}.png'))


# NOW wxtz
# Pull data
wxtz_price <- pin_get("wxtz_price", "pins_repo")
# Daily Users
ggplot(data = wxtz_price,
       aes(x = as.POSIXct(date_time_utc), y = wxtz_price)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: tzkt.io API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = wxtz_price == max(wxtz_price),
                        label = date_time_utc,
                        description = paste0('Max price - ', wxtz_price))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = wxtz_price == min(wxtz_price),
                        label = date_time_utc,
                        description = paste0('Min price - ', wxtz_price))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Price ($XTZ)') +
  ggtitle(paste('Price of wXTZ ($XTZ)')) 
# Save chart as image
ggsave('wxtz_price.png')
# Also archive
ggsave(glue('archive/wxtz_price/wxtz_price_{Sys.Date()}.png'))


# NOW stkr
# Pull data
stkr_price <- pin_get("stkr_price", "pins_repo")
# Daily Users
ggplot(data = stkr_price,
       aes(x = as.POSIXct(date_time_utc), y = stkr_price)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: tzkt.io API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = stkr_price == max(stkr_price),
                        label = date_time_utc,
                        description = paste0('Max price - ', stkr_price))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = stkr_price == min(stkr_price),
                        label = date_time_utc,
                        description = paste0('Min price - ', stkr_price))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Price ($XTZ)') +
  ggtitle(paste('Price of STKR ($XTZ)')) 
# Save chart as image
ggsave('stkr_price.png')
# Also archive
ggsave(glue('archive/stkr_price/stkr_price_{Sys.Date()}.png'))


# NOW kusd
# Pull data
kusd_price <- pin_get("kusd_price", "pins_repo")
# Daily Users
ggplot(data = kusd_price,
       aes(x = as.POSIXct(date_time_utc), y = kusd_price)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: tzkt.io API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = kusd_price == max(kusd_price),
                        label = date_time_utc,
                        description = paste0('Max price - ', kusd_price))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = kusd_price == min(kusd_price),
                        label = date_time_utc,
                        description = paste0('Min price - ', kusd_price))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Price ($XTZ)') +
  ggtitle(paste('Price of KUSD ($XTZ)')) 
# Save chart as image
ggsave('kusd_price.png')
# Also archive
ggsave(glue('archive/kusd_price/kusd_price_{Sys.Date()}.png'))


# NOW usds
# Pull data
usds_price <- pin_get("usds_price", "pins_repo")
# Daily Users
ggplot(data = usds_price,
       aes(x = as.POSIXct(date_time_utc), y = usds_price)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: tzkt.io API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = usds_price == max(usds_price),
                        label = date_time_utc,
                        description = paste0('Max price - ', usds_price))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = usds_price == min(usds_price),
                        label = date_time_utc,
                        description = paste0('Min price - ', usds_price))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Price ($XTZ)') +
  ggtitle(paste('Price of USDS ($XTZ)')) 
# Save chart as image
ggsave('usds_price.png')
# Also archive
ggsave(glue('archive/usds_price/usds_price_{Sys.Date()}.png'))


# NOW usdtz
# Pull data
usdtz_price <- pin_get("usdtz_price", "pins_repo")
# Daily Users
ggplot(data = usdtz_price,
       aes(x = as.POSIXct(date_time_utc), y = usdtz_price)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: tzkt.io API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = usdtz_price == max(usdtz_price),
                        label = date_time_utc,
                        description = paste0('Max price - ', usdtz_price))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = usdtz_price == min(usdtz_price),
                        label = date_time_utc,
                        description = paste0('Min price - ', usdtz_price))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Price ($XTZ)') +
  ggtitle(paste('Price of USDtz ($XTZ)')) 
# Save chart as image
ggsave('usdtz_price.png')
# Also archive
ggsave(glue('archive/usdtz_price/usdtz_price_{Sys.Date()}.png'))


# NOW ethtz
# Pull data
ethtz_price <- pin_get("ethtz_price", "pins_repo")
# Daily Users
ggplot(data = ethtz_price,
       aes(x = as.POSIXct(date_time_utc), y = ethtz_price)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: tzkt.io API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = ethtz_price == max(ethtz_price),
                        label = date_time_utc,
                        description = paste0('Max price - ', ethtz_price))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = ethtz_price == min(ethtz_price),
                        label = date_time_utc,
                        description = paste0('Min price - ', ethtz_price))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Price ($XTZ)') +
  ggtitle(paste('Price of ETHtz ($XTZ)')) 
# Save chart as image
ggsave('ethtz_price.png')
# Also archive
ggsave(glue('archive/ethtz_price/ethtz_price_{Sys.Date()}.png'))

# NOW sDAO
# Pull data
sdao_price <- pin_get("sdao_price", "pins_repo")
# Daily Users
ggplot(data = sdao_price,
       aes(x = as.POSIXct(date_time_utc), y = sdao_price)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: tzkt.io API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = sdao_price == max(sdao_price),
                        label = date_time_utc,
                        description = paste0('Max price - ', sdao_price))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = sdao_price == min(sdao_price),
                        label = date_time_utc,
                        description = paste0('Min price - ', sdao_price))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Price ($XTZ)') +
  ggtitle(paste('Price of SDAO ($XTZ)')) 
# Save chart as image
ggsave('sdao_price.png')
# Also archive
ggsave(glue('archive/sdao_price/sdao_price_{Sys.Date()}.png'))

# NOW RSAL
# Pull data
rsal_price <- pin_get("rsal_price", "pins_repo")
# Daily Users
ggplot(data = rsal_price,
       aes(x = as.POSIXct(date_time_utc), y = rsal_price)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: tzkt.io API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = rsal_price == max(rsal_price),
                        label = date_time_utc,
                        description = paste0('Max price - ', rsal_price))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = rsal_price == min(rsal_price),
                        label = date_time_utc,
                        description = paste0('Min price - ', rsal_price))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Price ($XTZ)') +
  ggtitle(paste('Price of RSAL ($XTZ)')) 
# Save chart as image
ggsave('rsal_price.png')
# Also archive
ggsave(glue('archive/rsal_price/rsal_price_{Sys.Date()}.png'))


# NOW TZ10X
# Pull data
tz10x_price <- pin_get("tz10x_price", "pins_repo")
# Daily Users
ggplot(data = tz10x_price,
       aes(x = as.POSIXct(date_time_utc), y = tz10x_price)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: tzkt.io API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = tz10x_price == max(tz10x_price),
                        label = date_time_utc,
                        description = paste0('Max price - ', tz10x_price))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = tz10x_price == min(tz10x_price),
                        label = date_time_utc,
                        description = paste0('Min price - ', tz10x_price))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Price ($XTZ)') +
  ggtitle(paste('Price of TZ10X ($XTZ)')) 
# Save chart as image
ggsave('tz10x_price.png')
# Also archive
ggsave(glue('archive/tz10x_price/tz10x_price_{Sys.Date()}.png'))


# NOW bDAO
# Pull data
bdao_price <- pin_get("bdao_price", "pins_repo")
# Daily Users
ggplot(data = bdao_price,
       aes(x = as.POSIXct(date_time_utc), y = bdao_price)) + 
  geom_line(size=1.2) +
  geom_point(size=2, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: tzkt.io API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = bdao_price == max(bdao_price),
                        label = date_time_utc,
                        description = paste0('Max price - ', bdao_price))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = bdao_price == min(bdao_price),
                        label = date_time_utc,
                        description = paste0('Min price - ', bdao_price))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Price ($XTZ)') +
  ggtitle(paste('Price of bDAO ($XTZ)')) 
# Save chart as image
ggsave('bdao_price.png')
# Also archive
ggsave(glue('archive/bdao_price/bdao_price_{Sys.Date()}.png'))


# hDAO Distribution
hdao_holders <- pin_get("hdao_holders", "pins_repo")
# Take screenshot of top holders
png("hdao_top_holders.png")
p <- tableGrob(head(select(hdao_holders, address, hdao_value, percent_of_supply),20))
grid.arrange(top = "Distribution of hDAO supply", p)
dev.off()
