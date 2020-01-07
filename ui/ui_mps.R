#####################################################
# SHINY - UK LENDING * CHOROPLETH - ui.R (ui_mps.R) #
#####################################################

tabPanel('MAPS', icon = icon('globe', lib = 'glyphicon'),
         
    sidebarPanel(
        
        pickerInput('cbo_mps_prd', 'PRODUCT:', lst.prd),

        pickerInput('cbo_mps_geo', 'GEOGRAPHY:', lst.geo),

        pickerInput('cbo_mps_mtc', 'METRIC:', lst.mtc),

        width = 3
        
    ),

    mainPanel(

        withSpinner( leafletOutput('out_mps') )

    )

)
