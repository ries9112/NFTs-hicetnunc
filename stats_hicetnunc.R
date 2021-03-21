library(pacman)
# Load packages
p_load('pins','ggplot2','anytime','ggthemes','fs','gganimate','magick','dplyr','transformr', 'ggforce')

# Register Board for data pull
board_register("https://raw.githubusercontent.com/predictcrypto/pins/master/","pins_repo")

#### Visualize Stats ####
# Pull data
stats_hicetnunc <- pin_get("stats_hicetnunc", "pins_repo")
# Daily Users
ggplot(data = stats_hicetnunc,
       aes(x = as.POSIXct(date_time_utc), y = stats_day_users)) + 
  geom_line(size=1.2) +
  geom_point(size=0.7, color='dark green') +
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
  xlab('Date Time Collected (UTC)') +
  ylab('Number of Users') +
  ggtitle(paste('Hicetnunc Daily Users')) 
# Save chart as image
ggsave('stats_hicetnunc_daily_users.png')

# Daily Transactions
ggplot(data = stats_hicetnunc,
       aes(x = as.POSIXct(date_time_utc), y = stats_day_txs)) + 
  geom_line(size=1.2) +
  geom_point(size=0.7, color='dark green') +
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
  xlab('Date Time Collected (UTC)') +
  ylab('Number of Transactions') +
  ggtitle(paste('Hicetnunc Daily Transactions')) 
# Save chart as image
ggsave('stats_hicetnunc_daily_txs.png')

# Weekly Users
ggplot(data = stats_hicetnunc,
       aes(x = as.POSIXct(date_time_utc), y = stats_week_users)) + 
  geom_line(size=1.2) +
  geom_point(size=0.7, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: better-call.dev API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = stats_week_users == max(stats_week_users),
                        label = date_time_utc,
                        description = paste0('Max daily users - ', stats_week_users))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = stats_week_users == min(stats_week_users),
                        label = date_time_utc,
                        description = paste0('Min daily users - ', stats_week_users))) +
  theme_solarized() +
  xlab('Date Time Collected (UTC)') +
  ylab('Number of Users') +
  ggtitle(paste('Hicetnunc Weekly Users')) 
# Save chart as image
ggsave('stats_hicetnunc_week_users.png')

# Weekly Transactions
ggplot(data = stats_hicetnunc,
       aes(x = as.POSIXct(date_time_utc), y = stats_week_txs)) + 
  geom_line(size=1.2) +
  geom_point(size=0.7, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: better-call.dev API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = stats_week_txs == max(stats_week_txs),
                        label = date_time_utc,
                        description = paste0('Max daily txs - ', stats_week_txs))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = stats_week_txs == min(stats_week_txs),
                        label = date_time_utc,
                        description = paste0('Min daily txs - ', stats_week_txs))) +
  theme_solarized() +
  xlab('Date Time Collected (UTC)') +
  ylab('Number of Transactions') +
  ggtitle(paste('Hicetnunc Weekly Transactions')) 
# Save chart as image
ggsave('stats_hicetnunc_week_txs.png')


# Monthly Users
ggplot(data = stats_hicetnunc,
       aes(x = as.POSIXct(date_time_utc), y = stats_month_users)) + 
  geom_line(size=1.2) +
  geom_point(size=0.7, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: better-call.dev API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = stats_month_users == max(stats_month_users),
                        label = date_time_utc,
                        description = paste0('Max daily users - ', stats_month_users))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = stats_month_users == min(stats_month_users),
                        label = date_time_utc,
                        description = paste0('Min daily users - ', stats_month_users))) +
  theme_solarized() +
  xlab('Date Time Collected (UTC)') +
  ylab('Number of Users') +
  ggtitle(paste('Hicetnunc Monthly Users')) 
# Save chart as image
ggsave('stats_hicetnunc_month_users.png')

# Monthly Transactions
ggplot(data = stats_hicetnunc,
       aes(x = as.POSIXct(date_time_utc), y = stats_month_txs)) + 
  geom_line(size=1.2) +
  geom_point(size=0.7, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: better-call.dev API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = stats_month_txs == max(stats_month_txs),
                        label = date_time_utc,
                        description = paste0('Max daily txs - ', stats_month_txs))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = stats_month_txs == min(stats_month_txs),
                        label = date_time_utc,
                        description = paste0('Min daily txs - ', stats_month_txs))) +
  theme_solarized() +
  xlab('Date Time Collected (UTC)') +
  ylab('Number of Transactions') +
  ggtitle(paste('Hicetnunc Monthly Transactions')) 
# Save chart as image
ggsave('stats_hicetnunc_month_txs.png')


# All-time Users
ggplot(data = stats_hicetnunc,
       aes(x = as.POSIXct(date_time_utc), y = stats_all_users)) + 
  geom_line(size=1.2) +
  geom_point(size=0.7, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: better-call.dev API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = stats_all_users == max(stats_all_users),
                        label = date_time_utc,
                        description = paste0('Max daily users - ', stats_all_users))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = stats_all_users == min(stats_all_users),
                        label = date_time_utc,
                        description = paste0('Min daily users - ', stats_all_users))) +
  theme_solarized() +
  xlab('Date Time Collected (UTC)') +
  ylab('Number of Users') +
  ggtitle(paste('Hicetnunc All-Time Users')) 
# Save chart as image
ggsave('stats_hicetnunc_all_users.png')

# All-time Transactions
ggplot(data = stats_hicetnunc,
       aes(x = as.POSIXct(date_time_utc), y = stats_all_txs)) + 
  geom_line(size=1.2) +
  geom_point(size=0.7, color='dark green') +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: better-call.dev API') + 
  # Circle max
  geom_mark_ellipse(aes(filter = stats_all_txs == max(stats_all_txs),
                        label = date_time_utc,
                        description = paste0('Max daily txs - ', stats_all_txs))) +
  # Now the same to circle the minimum:
  geom_mark_ellipse(aes(filter = stats_all_txs == min(stats_all_txs),
                        label = date_time_utc,
                        description = paste0('Min daily txs - ', stats_all_txs))) +
  theme_solarized() +
  xlab('Date Time Collected (UTC)') +
  ylab('Number of Transactions') +
  ggtitle(paste('Hicetnunc All-Time Transactions')) 
# Save chart as image
ggsave('stats_hicetnunc_all_txs.png')


# TODO - Calculate % of all the network that is active based on day, week, month
stats_hicetnunc = mutate(stats_hicetnunc, 
                         percent_active_day = stats_day_users/stats_all_users,
                         percent_active_week = stats_week_users/stats_all_users,
                         percent_active_month = stats_month_users/stats_all_users)
# Visualize Active Users
ggplot(data = stats_hicetnunc,
       aes(x = as.POSIXct(date_time_utc), y = percent_active_day)) + 
  geom_line(size=1.2, aes(color='Daily')) +
  geom_point(size=0.7, aes(color='Daily')) +
  geom_line(size=1.2, aes(y = percent_active_week, color='Weekly')) +
  geom_point(size=0.7, aes(y = percent_active_week, color='Weekly')) +
  geom_line(size=1.2, aes(y = percent_active_month, color='Monthly')) +
  geom_point(size=0.7, aes(y = percent_active_month, color='Monthly')) +
  labs(subtitle=paste('Latest data collected on:', max(stats_hicetnunc$date_time_utc), ' - UTC'),
       caption='Data source: better-call.dev API') + 
  theme_solarized() +
  xlab('Date Time Collected (UTC)') +
  ylab('Number of Transactions') +
  ggtitle(paste('Hicetnunc Percent of Total Active Users')) 
# Save chart as image
ggsave('stats_hicetnunc_active_users.png')


