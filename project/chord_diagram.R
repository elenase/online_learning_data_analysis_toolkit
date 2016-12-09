p <- c("circlize", "plyr")
install.packages(p)
library("circlize")

function(chordDiagram) {
df0 <- read.csv("testdata/chord_diagram/flows_2016_unhcr_offices.csv", stringsAsFactors=FALSE)
df1 <- read.csv("testdata/chord_diagram/flows_2016_unhcr_offices_meta.csv", stringsAsFactors=FALSE)

chordDiagram(x = df0)

circos.clear()
circos.par(start.degree = 90, gap.degree = 4, track.margin = c(-0.1, 0.1), points.overflow.warning = FALSE)
par(mar = rep(0, 4))
chordDiagram(x = df0, grid.col = df1$col1, transparency = 0.25,
             order = df1$region, directional = 1,
             direction.type = c("arrows", "diffHeight"), diffHeight  = -0.02,
             annotationTrack = "grid", annotationTrackHeight = c(0.05, 0.1),
             link.arr.type = "big.arrow", link.sort = TRUE, link.largest.ontop = TRUE)

circos.trackPlotRegion(  track.index = 1,   bg.border = NA,   panel.fun = function(x, y) {
  xlim = get.cell.meta.data("xlim")    sector.index = get.cell.meta.data("sector.index")
  reg1 = df1$reg1[df1$region == sector.index]
  reg2 = df1$reg2[df1$region == sector.index]
  

circos.text(x = mean(xlim), 
            y = ifelse(test = nchar(reg2) == 0, yes = 7.2, no = 8.0), 
            labels = reg1, 
            facing = "bending", 
            cex = 0.8)
circos.text(x = mean(xlim), 
            y = 6.4, 
            labels = reg2,    
            facing = "bending", 
            cex = 0.8)
circos.axis(h = "top", 
            major.at = seq(from = 0, to = xlim[2], by = ifelse(test = xlim[2]>10, yes = 2, no = 1)), 
            minor.ticks = 1, 
            major.tick.percentage = 0.5,
            labels.niceFacing = FALSE)	
}	
)
}
