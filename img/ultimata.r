library(tikzDevice)
library(ggplot2)

x <- seq(0, 3, length.out = 100)
y <- as.numeric(x >= 1.25)
dat <- data.frame(x, y)

tikz(file = "ultimata.tex", standAlone = TRUE, width = 2.5, height = 1.5)
print(
    ggplot(dat, aes(x, y))
    + geom_blank()
    + geom_segment(x = 0, xend = 1.25, y = 0, yend = 0)
    + geom_segment(x = 1.25, xend = 3, y = 1, yend = 1)
    + geom_point(x = 1.25, y = 0, fill = "white", shape = 21)
    + geom_point(x = 1.25, y = 1, fill = "black", shape = 21)
    + scale_x_continuous("$t$",
                         breaks = c(0, 1.25, 3),
                         labels = c("$\\underline{t}$", "$t^W$",
                         "$\\bar{t}$"))
    + scale_y_continuous("$\\pi(t)$",
                         breaks = c(0, 1))
    + theme_classic()
    + theme(axis.title.y = element_text(angle = 0))
    )
dev.off()
