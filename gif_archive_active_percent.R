# MAKE GIF of archive
library(magick)
dir_out <- file.path("archive/active_users_percent")
## list file names and read in
imgs <- list.files(dir_out, full.names = TRUE)
img_list <- lapply(imgs, image_read)

## join the images together
img_joined <- image_join(img_list)

## animate at 2 frames per second
img_animated <- image_animate(img_joined, fps = 0.5)

## view animated image
img_animated

## save to disk
image_write(image = img_animated,
            path = "active_users_percent.gif")



# Now make gif for number of daily users
dir_out <- file.path("archive/users")

imgs <- list.files(dir_out, full.names = TRUE)
# Only keep all-time users
imgs <- imgs[grepl( "all_users", imgs, fixed = TRUE)]
img_list <- lapply(imgs, image_read)

## join the images together
img_joined <- image_join(img_list)

## animate at 2 frames per second
img_animated <- image_animate(img_joined, fps = 0.5)

## view animated image
img_animated

## save to disk
image_write(image = img_animated,
            path = "all_time_users.gif")



