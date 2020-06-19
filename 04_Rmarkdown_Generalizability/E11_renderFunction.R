# Define a function that generates parameters

renderReport = function(inputFile, outputDir, yyyy, mm, selected_gp, nameFile){
  
  rmarkdown::render(
    input=inputFile, 
    output_format = "html_document",
    output_dir = outputDir,
    params = list(
      year = yyyy,
      month = mm,
      gp = selected_gp
    ),
    run_pandoc = TRUE,
    output_file = paste0(outputDir,"/",nameFile)
  )
}


# Run the function with chosen parameters

renderReport(inputFile = "markdown/GP_report_render_function.Rmd",
             outputDir = "output",
             yyyy = 2019,
             mm = "07",
             selected_gp = "A81005",
             nameFile = "GP_report_render_function_E11.html")
