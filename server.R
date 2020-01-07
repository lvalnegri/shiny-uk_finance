#################################
# SHINY - UK LENDING * server.R #
#################################

shinyServer(function(input, output, session) {
    
hide_waiter()
    
    # CHARTS (plt) -------------------
    source(file.path("server", "srv_plt.R"),  local = TRUE)$value
    
    # MAPS (mps) ------------
    source(file.path("server", "srv_mps.R"),  local = TRUE)$value
    
    #  () -----------
#    source(file.path("server", "srv_.R"),  local = TRUE)$value
    
})
