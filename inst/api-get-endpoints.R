library(rvest)

html <- read_html("https://cex.io/rest-api")

operations <- html %>%
  html_elements("h3 + pre > code")

for (operation in operations) {
  cat(paste("- [ ]", html_text(operation)), sep = "")
}
