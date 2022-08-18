library(shiny)
ui=fluidPage(
  titlePanel("sum of two integers"),
  #number input from
  sidebarLayout(
    sidebarPanel(
      textInput("one","First Integer"),
      textInput("two","Second Integer"),
      actionButton("add","Add")
    ),
    #show result
    mainPanel(
      textOutput("sum")
    )
  )
)

server=function(input,output){
  #observe the add click and perform reactive expression
  observeEvent(input$add,{
    x=as.numeric(input$one)
    y=as.numeric(input$two)
    #reactive expression
    n=x+y
    output$sum=renderPrint(n)
  })
}
shinyApp(ui,server)


#assignment 1 = WAP to input Principle Rate, and Time , Find the SI and compund intrest as per your user input
#assignment 2=  WAP to read temperature files as temperature.csv(create new file) and convert it into farenhiet or vice versa and show the graph of temperature



ui=basicPage(
  h1(id="thetitle","Inline JavaScript to change the title style"),
  actionButton("thebutton","Click to change title color and transparency"),
  
  #here we're  including inline javascript code (jQuery)
  tags$footer(HTML("<script type='text/javascript'>
                   $(document).ready(function() {
                   var $thetitle= $('#thetitle');
                   var $thebutton= $('#thebutton');
                   $thebutton.click(function(){
                   $thetitle.fadeOut(2000);             ## .(dot) for class and  #(hash)for id
                   $thetitle.fadeIn(2000);
                   $thetitle.css('color','green');
                   })
                   });
                   </script>"))
)

server=function(input,output){}
shinyApp(ui,server)


#WAP in shiny to work with JQuery, show the functioning of SlideDown,SlideUp,SlideToggle
#study from W3school




