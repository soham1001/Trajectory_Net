library(shiny)
library(ggplot2)
library(DT)
library(shinythemes)
library(shinydashboard)
# g1 <- read.csv(paste(getwd(),'/inc/data/Mouse_Embryo.csv',sep = ''))
# g2 <- read.csv(paste(getwd(),'/inc/data/Human_Lung.csv',sep = ''))
# g3 <- read.csv(paste(getwd(),'/inc/data/Nasal_Mucosa.csv',sep = ''))
# g4 <- read.csv(paste(getwd(),'/inc/data/NHP_ileum.csv',sep = ''))
# g5 <- read.csv(paste(getwd(),'/inc/data/NHP_lung.csv',sep = ''))

ui <- fluidPage( # theme = "mytheme.css",
                 shinythemes::themeSelector(),
                  theme = shinytheme("darkly"),

    # Application title
    titlePanel("Trajectory Net"),

    # Sidebar
    sidebarLayout(

        sidebarPanel( # tags$style(".well {background-color:black;}"),
            selectInput(
                inputId ="G_groups",
                label = "A- Choose The Dataset to Display:",
                choices = c("1- Mouse Embryonic Data",
                            "2- Pancreatic Cell Data",
                            "3- Dentate Gyrus Data", 
                            "4- Covid Human Lung Data", 
                            "5- Covid Nasal Mucosa Data", 
                            "6- Covid NHP Ileum Data",
                            "7- Covid NHP Lung Data" )),
            selectInput(
                inputId = "Format",
                label = "B- Choose the image format to display",
                choices = c('Image Format-1', 'Image Format-2','Image Format-3' )),

            selectInput(
                inputId = "More_info",
                label = "C- Documentation:",
                choices = c('Introduction', 'Information', 'Help', 'Covid Dataset Summary',
                            'References'),
                selected = "Introduction")
            ,
            submitButton(
                text = "Apply Changes",
                icon = icon("sliders"),
                width ='200px'),
            br(),
            br(),
            # downloadButton(
            #     outputId = "downloadData",
            #     label = "Download Data"),

            br(),br(),br(),br(),br(),br(),br(),br(),
            
            includeHTML("inc/copyright.html")
            
            
            
        ),
        

    
        mainPanel(
            
            uiOutput(outputId = "image1"),
            # 
            
            # verbatimTextOutput(
            #     outputId = "odataset"),
            # 
            uiOutput(
                outputId = "text1")
            
            
            

        )
    )
)



server <- function(input, output) {


    output$downloadData <- downloadHandler(

        filename = full_file_name,

        content = function(file){
            write.csv(read.csv(full_file_name()), quote = FALSE, file)
        } )

    # output$datatable1 <- renderDT(datatable(g1))
    # output$datatable2 <- renderDT(datatable(g2))
    # output$datatable3 <- renderDT(datatable(g3))
    # output$datatable4 <- renderDT(datatable(g4))
    # output$datatable5 <- renderDT(datatable(g5))
    
    output$image1 <- renderUI({
        if(input$G_groups =="1- Mouse Embryonic Data" )
        {
            if(input$Format == "Image Format-1" )
            {
                img(src="Mouse_Trajectory.jpeg", align = "centre",height='300px',width='600')    
            }
            else if(input$Format == "Image Format-2" )
            {
                img(src="EB-Trajectory.gif", align = "centre",height='300px',width='600')
            }
            else if(input$Format == "Image Format-3" )
            {
                img(src="timages/Mouse Cell Image.jpeg", align = "centre",height='300',width='600')
            }
        }
        else if(input$G_groups =="2- Pancreatic Cell Data" )
        {
            if(input$Format == "Image Format-1" )
            {
                img(src="timages/Pancreas Trajectory.jpeg", align = "centre",height='300px',width='600')    
            }
            else if(input$Format == "Image Format-2" )
            {
                img(src="pancreas.gif", align = "centre",height='300px',width='600')
            }
            else if(input$Format == "Image Format-3" )
            {
                img(src="timages/Pancreatic Cells.jpeg", align = "centre",height='300px',width='600')
            }
        }
        else if(input$G_groups =="3- Dentate Gyrus Data" )
        {
            if(input$Format == "Image Format-1" )
            {
                img(src="timages/Dentate Gyrus Trajectory.jpeg", align = "centre",height='300px',width='600')    
            }
            else if(input$Format == "Image Format-2" )
            {
                img(src="dentate_gyrus.gif", align = "centre",height='300px',width='600')
            }
            else if(input$Format == "Image Format-3" )
            {
                img(src="timages/Dentate Gyrus Cells.jpeg", align = "centre",height='300px',width='600')
            }
        }
        else if(input$G_groups =="4- Covid Human Lung Data" )
        {
            if(input$Format == "Image Format-1" )
            {
                img(src="timages/Human Lung.jpeg", align = "centre",height='300px',width='600')    
            }
            else if(input$Format == "Image Format-2" )
            {
                img(src="timages/Human Lung UMAP ACE.jpeg", align = "centre",height='300px',width='600')
            }
            else if(input$Format == "Image Format-3" )
            {
                img(src="timages/UMAP TRMP Human Lung.png", align = "centre",height='300px',width='600')
            }
        }
        else if(input$G_groups =="5- Covid Nasal Mucosa Data" )
        {
            if(input$Format == "Image Format-1" )
            {
                img(src="timages/Nasal Mucosa.jpeg", align = "centre",height='300px',width='600')  
            }
            else if(input$Format == "Image Format-2" )
            {
                img(src="timages/Nasal Mucosa UMAP ACE.jpeg", align = "centre",height='300px',width='600')
            }
            else if(input$Format == "Image Format-3" )
            {
                img(src="timages/UMAP TRMP NAsal Mucosa.jpeg", align = "centre",height='300px',width='600')
            }
        }
        else if(input$G_groups =="6- Covid NHP Ileum Data" )
        {
            if(input$Format == "Image Format-1" )
            {
                img(src="timages/NHP Ileum.jpeg", align = "centre",height='300px',width='600')  
            }
            else if(input$Format == "Image Format-2" )
            {
                img(src="timages/UMAP NHP Ileum Ace2.jpeg", align = "centre",height='300px',width='600')
            }
            else if(input$Format == "Image Format-3" )
            {
                img(src="timages/UMAP TRMP NHP Ileum.jpeg", align = "centre",height='300px',width='600')
            }
        }
        else if(input$G_groups =="7- Covid NHP Lung Data" )
        {
            if(input$Format == "Image Format-1" )
            {
                img(src="timages/NHP Lung.jpeg", align = "centre",height='300px',width='600')  
            }
            else if(input$Format == "Image Format-2" )
            {
                img(src="timages/UMAP ACE NHP Lung.jpeg", align = "centre",height='300px',width='600')
            }
            else if(input$Format == "Image Format-3" )
            {
                img(src="timages/UMAP NHP LUNG TRMP.jpeg", align = "centre",height='300px',width='600')
            }
        }
        
        
    })
    
    
    output$text1 <- renderUI({
        if(input$More_info=="Introduction"){
            includeHTML("inc/introduction.html")
        } else if(input$More_info=="Information"){
            includeHTML("inc/information.html")
        } else if(input$More_info=="Help"){
            includeHTML("inc/help.html")
        } 
        # else if(input$More_info=="Mouse Data"){
        #     DTOutput('datatable1')
        #     
        # }
        # else if(input$More_info=="Human Lung Data"){
        #     DTOutput('datatable2')
        # }
        # else if(input$More_info=="Nasal Mucosa Data"){
        #     DTOutput('datatable3')
        # }
        # else if(input$More_info=="NHP Ileum Data"){
        #     DTOutput('datatable4')
        # }
        # else if(input$More_info=="NHP Lung Data"){
        #     DTOutput('datatable5')
        # }
        #
        else if(input$More_info=="Covid Dataset Summary"){
            includeHTML("inc/Covidinfo.html")
        }
        else if(input$More_info=="References"){
            includeHTML("inc/references.html")
        }
    })
    
    
    
    

}

# ===================================================== server.R END ============

# Run the application 
shinyApp(ui = ui, server = server)
