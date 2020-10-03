From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 03 Oct 2020 07:55:00 +0000
Subject: [PATCH] MAINTAINERS: adjust to mcp251xfd file renaming
Message-Id: <20201003075500.12477-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Kleine-Budde <mkl@pengutronix.de>, linux-can@vger.kernel.org
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Thomas Kopp <thomas.kopp@microchip.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 27cf93863cbc ("MAINTAINERS: Add entry for Microchip MCP25XXFD
SPI-CAN network driver"), added the MCP25XXFD SPI-CAN NETWORK DRIVER
section with the following two file entries:

F:      Documentation/devicetree/bindings/net/can/microchip,mcp25xxfd.yaml
F:      drivers/net/can/spi/mcp25xxfd/

Commit 1f0e21a0c065 ("can: mcp251xfd: rename driver files and subdir to
mcp251xfd") renamed the files from mcp25xxfd to mcp251xfd, but missed to
adjust the MAINTAINERS section.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches    F: \
      Documentation/devicetree/bindings/net/can/microchip,mcp25xxfd.yaml
  warning: no file matches    F:    drivers/net/can/spi/mcp25xxfd/

Adjust the MCP251XFD SPI-CAN NETWORK DRIVER section to this driver file
renaming.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-2020102

Marc, please pick this minor non-urgent clean-up patch for your -next tree.

 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 00214bbaa72c..b374e594a779 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10732,14 +10732,14 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/hid-mcp2221.c
 
-MCP25XXFD SPI-CAN NETWORK DRIVER
+MCP251XFD SPI-CAN NETWORK DRIVER
 M:	Marc Kleine-Budde <mkl@pengutronix.de>
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 R:	Thomas Kopp <thomas.kopp@microchip.com>
 L:	linux-can@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/net/can/microchip,mcp25xxfd.yaml
-F:	drivers/net/can/spi/mcp25xxfd/
+F:	Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
+F:	drivers/net/can/spi/mcp251xfd/
 
 MCP4018 AND MCP4531 MICROCHIP DIGITAL POTENTIOMETER DRIVERS
 M:	Peter Rosin <peda@axentia.se>
-- 
2.17.1
