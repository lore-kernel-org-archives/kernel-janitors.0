From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 21 Mar 2020 06:42:17 +0000
Subject: [PATCH] MAINTAINERS: update entry after SPI NOR controller move
Message-Id: <20200321064217.6179-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <bbrezillon@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, linux-mtd@lists.infradead.org, Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-arm-kernel@lists.infradead.org

Commit a0900d0195d2 ("mtd: spi-nor: Prepare core / manufacturer code
split") moved all SPI NOR controller drivers to a controllers/
sub-directory. However, the moved nxp-spifi.c file was referenced in the
ARM/LPC18XX ARCHITECTURE entry in MAINTAINERS.

Hence, since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches F: drivers/mtd/spi-nor/nxp-spifi.c

Update the file entry in MAINTAINERS to its new location.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20200320
Boris, Tudor, please pick this trivial patch. Not urgent.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50e8b900c0ae..3822efce14bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1948,7 +1948,7 @@ F:	Documentation/devicetree/bindings/i2c/i2c-lpc2k.txt
 F:	arch/arm/boot/dts/lpc43*
 F:	drivers/i2c/busses/i2c-lpc2k.c
 F:	drivers/memory/pl172.c
-F:	drivers/mtd/spi-nor/nxp-spifi.c
+F:	drivers/mtd/spi-nor/controllers/nxp-spifi.c
 F:	drivers/rtc/rtc-lpc24xx.c
 N:	lpc18xx
 
-- 
2.17.1
