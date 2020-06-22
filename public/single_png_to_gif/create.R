setwd("/git/sykdomspulsen-dokumentasjon/")

library(ggplot2)
library(magick)

set.seed(4)
d <- spread::commuter(r0=1.9, d=150)
d <- d[,.(
  incidence = sum(incidence)
),keyby=.(day)]
d[]

img <- image_graph(600, 340, res = 96)
days <- seq(28,150,2)
for(i in seq_along(days)){
  day_max <- days[i]
  q <- ggplot(d[day<=day_max], aes(x=day, y=incidence))
  q <- q + geom_line(data=d, alpha=0)
  q <- q + geom_line(size=2, color="red")
  q <- q + scale_y_continuous(
    "Incidence",
    labels = fhiplot::format_nor
    )
  q <- q + scale_x_continuous("Day")
  q <- q + fhiplot::theme_fhi_lines(12)
  print(q)
}
dev.off()
animation <- image_animate(img, fps = 2.5)
print(animation)
image_write(animation, "/git/sykdomspulsen-dokumentasjon/themes/hugo-whisper-theme/static/images/terminal.gif")
