library(jsonlite)
library(tidyverse)
library(emojifont)
library(ggplot2)

# url with some information about project in Andalussia
url <- 'skeles/skele.json'

# read url and convert to data.frame
skele <- as_tibble(fromJSON(txt=url)$data)

# Extract attributes
full_data = data.frame(token_id = skele$token[[1]][1], 
           hat = skele$token$token_attributes[[1]][1]$attribute$value[[1]],
           glasses = skele$token$token_attributes[[1]][1]$attribute$value[[2]],
           body = skele$token$token_attributes[[1]][1]$attribute$value[[3]],
           arm = skele$token$token_attributes[[1]][1]$attribute$value[[4]],
           hand = skele$token$token_attributes[[1]][1]$attribute$value[[5]],
           bottom = skele$token$token_attributes[[1]][1]$attribute$value[[6]],
           top = skele$token$token_attributes[[1]][1]$attribute$value[[7]],
           background = skele$token$token_attributes[[1]][1]$attribute$value[[8]],
           ipfs_url = skele$token$display_uri[[1]])
# iterate over whole dataset
for (i in 2:nrow(skele)){
  temp_data = data.frame(token_id = skele$token[[1]][i], 
                         hat = skele$token$token_attributes[[i]][1]$attribute$value[[1]],
                         glasses = skele$token$token_attributes[[i]][1]$attribute$value[[2]],
                         body = skele$token$token_attributes[[i]][1]$attribute$value[[3]],
                         arm = skele$token$token_attributes[[i]][1]$attribute$value[[4]],
                         hand = skele$token$token_attributes[[i]][1]$attribute$value[[5]],
                         bottom = skele$token$token_attributes[[i]][1]$attribute$value[[6]],
                         top = skele$token$token_attributes[[i]][1]$attribute$value[[7]],
                         background = skele$token$token_attributes[[i]][1]$attribute$value[[8]],
                         ipfs_url = skele$token$display_uri[[i]])
  # append to full data
  full_data = rbind(full_data, temp_data)
  # print current round
  print(paste('Now on round',i))
}
# Convert full dataset to tibble:
full_data = as_tibble(full_data)

# pin data?


# HAT
# summarize data
summarized_hat = group_by(full_data, hat) %>% count() %>% arrange(n) %>% mutate(percent=round((n/nrow(full_data))*100,2))
# show
summarized_hat %>% print(n=30)
# Visualize results
ggplot(summarized_hat, aes(reorder(hat, n), n, label = hat)) + geom_bar(stat = "identity")+
  geom_text(family = "EmojiOne", size = 6, vjust = -.5) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) #+
  #geom_text(aes(label = percent), vjust = 1)

# GLASSES
summarized_glasses = group_by(full_data, glasses) %>% count() %>% arrange(n) %>% mutate(percent=round((n/nrow(full_data))*100,2))
# show
summarized_glasses %>% print(n=30)
# Visualize results
ggplot(summarized_glasses, aes(reorder(glasses, n), n, label = glasses)) + geom_bar(stat = "identity")+
  geom_text(family = "EmojiOne", size = 6, vjust = -.5) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) 

# BODY
summarized_body = group_by(full_data, body) %>% count() %>% arrange(n) %>% mutate(percent=round((n/nrow(full_data))*100,2))
# show
summarized_body %>% print(n=30)
# Visualize results
ggplot(summarized_body, aes(reorder(body, n), n, label = body)) + geom_bar(stat = "identity")+
  geom_text(family = "EmojiOne", size = 6, vjust = -.5) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) 

# ARM
summarized_arm = group_by(full_data, arm) %>% count() %>% arrange(n) %>% mutate(percent=round((n/nrow(full_data))*100,2))
# show
summarized_arm %>% print(n=30)
# Visualize results
ggplot(summarized_arm, aes(reorder(arm, n), n, label = arm)) + geom_bar(stat = "identity")+
  geom_text(family = "EmojiOne", size = 6, vjust = -.5) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) 

# HAND
summarized_hand = group_by(full_data, hand) %>% count() %>% arrange(n) %>% mutate(percent=round((n/nrow(full_data))*100,2))
# show
summarized_hand %>% print(n=30)
# Visualize results
ggplot(summarized_hand, aes(reorder(hand, n), n, label = hand)) + geom_bar(stat = "identity")+
  geom_text(family = "EmojiOne", size = 6, vjust = -.5) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) 

# BOTTOM
summarized_bottom = group_by(full_data, bottom) %>% count() %>% arrange(n) %>% mutate(percent=round((n/nrow(full_data))*100,2))
# show
summarized_bottom %>% print(n=30)
# Visualize results
ggplot(summarized_bottom, aes(reorder(bottom, n), n, label = bottom)) + geom_bar(stat = "identity")+
  geom_text(family = "EmojiOne", size = 6, vjust = -.5) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) 


# TOP
summarized_top = group_by(full_data, top) %>% count() %>% arrange(n) %>% mutate(percent=round((n/nrow(full_data))*100,2))
# show
summarized_top %>% print(n=30)
# Visualize results
ggplot(summarized_top, aes(reorder(top, n), n, label = top)) + geom_bar(stat = "identity")+
  geom_text(family = "EmojiOne", size = 6, vjust = -.5) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) 

# BACKGROUND
summarized_background = group_by(full_data, background) %>% count() %>% arrange(n) %>% mutate(percent=round((n/nrow(full_data))*100,2))
# show
summarized_background %>% print(n=30)
# Visualize results
ggplot(summarized_background, aes(reorder(background, n), n, label = background)) + geom_bar(stat = "identity")+
  geom_text(family = "EmojiOne", size = 6, vjust = -.5) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) 


# How many have two of the same trait?
doubles = full_data %>% filter(hat == glasses | hat == body | hat == arm | hat == hand | hat == bottom | hat == top | hat == background |
                               glasses == body | glasses == arm | glasses == hand | glasses == bottom | glasses == top | glasses == background |
                               body == arm | body == hand | body == bottom | body == top | body == background |
                               arm == hand | arm == bottom | arm == top | arm == background |
                               hand == bottom | hand == top | hand == background |
                               bottom == top | bottom == background |
                               top == background)
# percentage
(nrow(doubles)/nrow(full_data))*100

# Are there any that have all of the same trait?


