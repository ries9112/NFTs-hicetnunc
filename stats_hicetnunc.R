library(pacman)
#devtools::install_github('thomasp85/ggfx')
# devtools::install_github('lenkiefer/darklyplot')

# Load packages
p_load('pins','ggplot2','anytime','ggthemes','fs','gganimate','magick','dplyr','devtools',
       'transformr', 'ggforce','scales','tidyr','glue','darklyplot','ggfx')

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
                        description = paste0('Max all time users - ', stats_all_users))) +
  theme_solarized() +
  scale_x_datetime('Date Time Collected (UTC)',date_labels = "%m/%d/%y") +
  scale_y_continuous('Number of Users') +
  ggtitle(paste('hic et nunc All-Time Users')) 
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
                        description = paste0('Max all time txs - ', stats_all_txs))) +
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
