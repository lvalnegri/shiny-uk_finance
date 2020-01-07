#################################################
# SHINY - UK LENDING * CHARTS - ui.R (ui_plt.R) #
#################################################

tabPanel('CHARTS', icon = icon('chart-area'),
         
    sidebarPanel(

        pickerInput('cbo_plt_prd', 'PRODUCT:', lst.prd),

        pickerInput('cbo_plt_geo', 'GEOGRAPHY:', lst.geo),

        pickerInput('cbo_plt_mtc', 'METRIC:', lst.mtc),

        width = 3
        
    ),

    mainPanel(

        withSpinner( plotOutput('out_tms') ),

        withSpinner( plotOutput('out_brp') )

    )

)
