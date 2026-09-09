# 00_download_data.R -----------------------------------------------------
#
# Optional. The Quarto render does NOT depend on this. Run it only to
# confirm your machine can reach the CDC and that read_xpt() works on a
# real NHANES file.
#
# I have not been able to verify the URL below from where I am, and the
# CDC has reorganised these paths before, so treat a 404 as "the URL
# moved", not "your setup is broken". The nhanesA fallback is more
# robust because the package tracks the paths for you.

library(here)
library(haven)

dir.create(here("data", "raw"), recursive = TRUE, showWarnings = FALSE)

url  <- "https://wwwn.cdc.gov/Nchs/Nhanes/2017-2018/DEMO_J.XPT"
dest <- here("data", "raw", "DEMO_J.XPT")

ok <- tryCatch({
  download.file(url, destfile = dest, mode = "wb", quiet = TRUE)
  TRUE
}, error = function(e) {
  message("Direct download failed: ", conditionMessage(e))
  FALSE
})

if (ok && file.exists(dest)) {
  demo <- read_xpt(dest)
  message("Downloaded and read OK.")
  message("Rows: ", nrow(demo), "  Columns: ", ncol(demo))
  print(head(names(demo), 10))
} else {
  message("")
  message("Direct URL did not work. Try the package route instead:")
  message('  install.packages("nhanesA")')
  message('  demo <- nhanesA::nhanes("DEMO_J")')
  message("")
  message("If nhanesA also fails, the problem is network/proxy, not R.")
}
