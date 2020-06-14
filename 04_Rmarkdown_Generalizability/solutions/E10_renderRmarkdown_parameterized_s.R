# define render parmeters outside the render function

inputFile = "/cloud/project/markdown/GP_report_render_function.Rmd"
outputDir = "/cloud/project/solutions"
yyyy = 2019
mm = "07"
selected_gp = "A81005"
nameFile = "sE10_GP_report_render_function_Cristina.html"



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
