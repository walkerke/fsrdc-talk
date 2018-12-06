library(sf)
library(tidyverse)
library(tigris)
options(tigris_use_cache = TRUE)

downtown <- c(-97.332326, 32.754640) %>%
  st_point() %>%
  st_sfc(crs = 4326) %>%
  st_sf() %>%
  st_transform(26914) %>%
  st_buffer(3000)

tarr_blocks <- blocks("TX", "Tarrant", year = 2017, class = "sf") %>%
  st_transform(26914)

downtown_blocks <- tarr_blocks[downtown, ]

write_rds(downtown_blocks, "downtown_blocks.rds")