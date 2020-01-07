#################################
# SHINY - UK LENDING * global.R #
#################################

#===== LOAD PACKAGES ----------------------------
# pkg <- c('popiFun',
#     'bcrypt', 'Cairo', 'crosstalk', 'data.table', 'fst', 'htmltools', 'htmlwidgets', 'stringr',
#     'bsplus', 'colourpicker', 'DT', 'dygraphs', 'fontawesome', 'kableExtra',
#     'circlize', 'extrafont', 'RColorBrewer', 'scales', 'classInt',
#     'GGally', 'ggparallel', 'ggplot2', 'ggiraph', 'ggrepel', 'ggthemes', 'leaflet', 'leaflet.extras', 'rgeos', 'sp',
#     'shiny',  'shinyalert', 'shinyBS', 'shinycssloaders', 'shinyDND', 'shinyjs', 'shinymaterial', 'shinyjqui', 'shinythemes', 'shinyWidgets'
# )
pkg <- c('popiFun',
    'Cairo', 'data.table', 'DT', 'dygraphs', 'fontawesome', 'leaflet', 'leaflet.extras', 'sp',
    'shiny',  'shinyalert', 'shinycssloaders', 'shinyjs', 'shinythemes', 'shinyWidgets', 'waiter'
)
invisible( lapply(pkg, require, character.only = TRUE) )

#===== GENERAL OPTIONS --------------------------
options(spinner.color = '#333399', spinner.size = 1, spinner.type = 4)
options(bitmapType = 'cairo', shiny.usecairo = TRUE)
options(knitr.table.format = 'html')

#===== CONSTANTS --------------------------------
app_path <- file.path(pub_path, 'shiny_apps', 'master_portal')
last_updated <- as.Date('2019-11-03')

#===== LOAD DATA --------------------------------
# dts <- list()
# bnd <- rgdal::readOGR(app_path, '')
# font.lst <- read.fst(file.path(data_path, 'common', 'fonts'), as.data.table = TRUE)
# font.lst <- sort(unique(font.lst[is_active == 1, family]))
# maptiles <- fread(file.path(app_path, 'maptiles.csv'))
# maptiles <- maptiles[require_reg == 0,
#     .(
#         name = paste(provider, ifelse(name == '\\N', '', paste('-', name))),
#         provider = paste0(provider, ifelse(name == '\\N', '', paste0('.', name)))
#     )
# ]
# palettes <- fread(file.path(app_path, 'palettes.csv'))


#===== LISTS ------------------------------------

# products
lst.prd <- c('Personal' = 'pax', 'SME' = 'sme', 'Mortgage' = 'mortgage')

# geographies
lst.geo <- c(
    'Postcode Sectors' = 'PCS', 'Postcode Districts' = 'PCD', 'Postcode Towns' = 'PCT', 
    'Postcode Areas' = 'PCA', 'Regions' = 'RGS', 'Countries' = 'CTRY'
)

# metrics
lst.mtc <- c('None' = 'None')

# list of options for labels in maps
lbl.options <- labelOptions(
    textsize = '12px', direction = 'right', sticky = FALSE, opacity = 0.8,
    offset = c(60, -40), style = list('font-weight' = 'normal', 'padding' = '2px 6px')
)

# list of classification methods, to be used with classInt and ColorBrewer packages 
class.methods <- c(
#    'Fixed' = 'fixed',                  # need an additional argument fixedBreaks that lists the n+1 values to be used
    'Equal Intervals' = 'equal',        # the range of the variable is divided into n part of equal space
    'Quantiles' = 'quantile',           # each class contains (more or less) the same amount of values
    'Pretty Integers' = 'pretty',       # sequence of about ‘n+1’ equally spaced ‘round’ values which cover the range of the values in ‘x’. The values are chosen so that they are 1, 2 or 5 times a power of 10.
#    'Natural Breaks' = 'jenks',         # seeks to reduce the variance within classes and maximize the variance between classes
    'Hierarchical Cluster' = 'hclust',  # Cluster with short distance
    'K-means Cluster' = 'kmeans'        # Cluster with low variance and similar size
)

# maptiles
# tiles.lst <- as.list(maptiles[, provider])
# names(tiles.lst) <- maptiles[, name]



#===== FUNCTIONS --------------------------------



#===== THEMES / STYLES --------------------------

# add text at the left of the upper navbar
navbarPageWithText <- function(..., text) {
    navbar <- navbarPage(...)
    textEl <- tags$p(class = "navbar-text", text)
    navbar[[3]][[1]]$children[[1]] <- tagAppendChild( navbar[[3]][[1]]$children[[1]], textEl)
    navbar
}
