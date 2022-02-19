library(pacman)

# Load packages
p_load('pins', 'dplyr', 'gridExtra')

# Register Board for data pull
board_register("https://raw.githubusercontent.com/predictcrypto/pins/master/","pins_repo")

#### Visualize Stats ####
# Pull data
transfer_summary <- pin_get("data_name_service_transfers_latest", "pins_repo")
# Take screenshot of top holders
png("data_name_service.png")
p <- tableGrob(head(select(transfer_summary, transfer_summary),20), rows = NULL)
grid.arrange( p)
dev.off()
