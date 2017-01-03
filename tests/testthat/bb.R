context("bb")

suppressMessages({
    library(tmap)
    library(raster)
    library(sp)
})
data(World, NLD_prov, land)

landb <- brick(land)
lands <- stack(land)
landr <- raster(land, layer=1)

test_that("bounding box is get from spatial", {
    expect_identical(bb(World), sp::bbox(World))
    expect_identical(bb(NLD_muni), sp::bbox(NLD_muni))
    expect_identical(bb(land), sp::bbox(land))
})

test_that("bounding box is get from raster", {
    expect_identical(bb(landr), bb(land))
    expect_identical(bb(landb), bb(land))
    expect_identical(bb(lands), bb(land))
})
