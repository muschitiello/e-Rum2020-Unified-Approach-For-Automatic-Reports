# define render parmeters outside the render function

inputFile = "markdown/GP_report_render_function.Rmd"
outputDir = "output"
yyyy = 2019
mm = "07"
selected_gp = "A81005"
nameFile = "GP_report_render_function_E10.html"



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
  output_file = nameFile
)


