rmarkdown::render(
  input="/cloud/project/markdown/GP_report_render_function.Rmd", 
  output_format = "html_document",
  output_dir = "/cloud/project/solutions",
  params = list(
    month = "07",
    year = 2019,
    gp = "A81005"
  ),
  run_pandoc = TRUE,
  output_file = "sE09_GP_report_render_function_s.html"
)

