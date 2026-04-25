## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE-------------------------------------------------------------
# library("devtools")
# install_github("scollinselliott/lakhesis", dependencies = TRUE, build_vignettes = TRUE)

## -----------------------------------------------------------------------------
library("lakhesis")
data("quattrofontanili")
qf_long <- im_long(quattrofontanili)

## ----eval = FALSE-------------------------------------------------------------
# write.table(qf_long, file = "qf.csv", row.names = FALSE, col.names = FALSE, sep = ",")

## ----eval = FALSE-------------------------------------------------------------
# qf1 <- quattrofontanili[1:20, 1:40]
# qf1 <- qf1[rowSums(qf1) != 0, colSums(qf1) != 0]
# 
# qf2 <- quattrofontanili[30:50, 20:60]
# qf2 <- qf2[rowSums(qf2) != 0, colSums(qf2) != 0]
# 
# im_merge(qf1, qf2)

## ----fig.align = 'center'-----------------------------------------------------
data("quattrofontanili")
qf_caproc <- ca_procrustes(quattrofontanili)
class(qf_caproc)
print(qf_caproc)
plot(qf_caproc)

## -----------------------------------------------------------------------------
qf_ser <- ca_procrustes_ser(quattrofontanili)
class(qf_ser)
print(qf_ser)
summary(qf_ser)

## ----fig.align = 'center'-----------------------------------------------------
plot(qf_ser, display = "ca")
plot(qf_ser, display = "ref")
plot(qf_ser, display = "im_seriated")

## -----------------------------------------------------------------------------
quattrofontanili.caproc <- qf_ser$im_seriated

## -----------------------------------------------------------------------------
print(qf_strands)
L <- lakhesize(qf_strands, pbar = FALSE)
summary(L)

## -----------------------------------------------------------------------------
quattrofontanili.L <- L$im_seriated

## -----------------------------------------------------------------------------
# the original seriation
conc_wrc(quattrofontanili)
# using procrustes-fit ca
conc_wrc(quattrofontanili.caproc)
# using lakhesis
conc_wrc(quattrofontanili.L)

## -----------------------------------------------------------------------------
qf_eval <- element_eval(quattrofontanili)
head(qf_eval$RowFit)
head(qf_eval$ColFit)

## ----fig.align = 'center'-----------------------------------------------------
plot(L, display = "im_seriated") 
plot(L, display = "agreement") 
plot(L, display = "criterion") 

## ----eval = FALSE-------------------------------------------------------------
# LC()

## ----eval = FALSE-------------------------------------------------------------
# im_ref( matrix(NA, nrow = 20, ncol = 20) )

