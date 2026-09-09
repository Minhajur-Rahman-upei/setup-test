# MCS 8920 — Environment Smoke Test

### 1. Render locally (tests R, packages, Quarto, TinyTeX)

Open `mcs8920-smoketest.Rproj` in RStudio, then either click **Render**
or run in the RStudio terminal:

```bash
quarto render smoketest.qmd
```

Success = `smoketest.pdf` appears and contains tables and figures.

If a package fails to load, install it and re-render. If LaTeX errors,
run `quarto install tinytex`.

### 2. Optional network check

```r
source("R/00_download_data.R")
```

Confirms to reach the CDC and read a real `.XPT`.


### 3. Push

In **Git Bash**, from this folder:

```bash
git init
git branch -M main

# identity set per-repo, deliberately
git config user.name  "Minhajur Rahman"
git config user.email "minhajurrahman@upei.ca"

git add .
git commit -m "Environment smoke test"
git remote add origin https://github.com/<school-username>/mcs8920-smoketest.git
git push -u origin main
```

## Files

```
mcs8920-smoketest.Rproj   RStudio project; sets RestoreWorkspace: No
smoketest.qmd             the render target -- exercises every package
R/00_download_data.R      optional CDC network check
data/raw/.gitkeep         keeps the empty dir tracked
.gitignore                data, build artifacts, renv library
```
