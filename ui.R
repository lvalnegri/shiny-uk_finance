#############################
# SHINY - UK LENDING * ui.R #
#############################

shinyUI(fluidPage(
    
    use_waiter(),
    show_waiter_on_load(spin_hourglass(), "#333e48"),
    
    includeCSS(file.path(app_path, 'styles.css')),
    # includeScript(file.path(app_path, 'scripts.js')),
    tags$head(
        tags$link(rel="shortcut icon", href="favicon.ico"),
        tags$link(rel="stylesheet", href="https://use.fontawesome.com/releases/v5.8.1/css/all.css")
    ),
    
    navbarPageWithText(
        header = '',
        title = HTML('<div><img src="logo.png" class="logo"><span class = "title">UK Lending</span></div>'),
        windowTitle = 'UK Lending', 
        id = 'mainNav',
        theme = shinytheme('united'), inverse = TRUE,
        
        # CHARTS (plt) -------------------
        source(file.path("ui", "ui_plt.R"),  local = TRUE)$value,

        # MAPS (mps) ------------
        source(file.path("ui", "ui_mps.R"),  local = TRUE)$value,
        
        # ABOUT (abt) -------------------
        source(file.path("ui", "ui_abt.R"),  local = TRUE)$value,
    
        # UPDATE ---------------
        text = paste('Last Update:', format(last_updated, '%d %b %Y') )
    
    ),

    useShinyjs()

))
