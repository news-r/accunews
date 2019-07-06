.onAttach <- function(...) {

  key <- Sys.getenv("ACCUNEWS_API_KEY")

  msg <- "No API key found, see `accunews_key`"
  if(nchar(key) > 1) msg <- "API key loaded!"

  packageStartupMessage(msg)

}