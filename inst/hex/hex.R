library(hexSticker)
library(showtext)

# Load Google font.
font_add_google(name = "Roboto", family = "Roboto")
showtext_auto()

SWIDTH = 700
SHEIGHT = 700

SFACTOR = 850

sticker(
        here::here("inst/hex/cex-icon.png"),
        # Image
        s_x = 0.925,
        s_y = 1.000,
        s_width = SWIDTH / SFACTOR,
        s_height = SHEIGHT / SFACTOR,
        # Package name
        package = NULL,
        # p_size = 36,
        # p_x = 1.370,
        # p_y = 0.395,
        # p_color = "#000000",
        # p_family = "Roboto",
        # Hex
        h_fill = "#cccccc",
        h_size = 1.5,
        h_color = "#1fbdc6",
        # Output
        filename = here::here("man/figures/cex-hex.png"),
        asp = 0.85,
        dpi = 600,
        angle = 30
)
