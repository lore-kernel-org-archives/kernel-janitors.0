From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 28 Feb 2020 06:33:38 +0000
Subject: [PATCH] MAINTAINERS: adjust to renaming physmap_of_versatile.c
Message-Id: <20200228063338.4099-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <boris.brezillon@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Sebastian Duda <sebastian.duda@fau.de>, linux-arm-kernel@lists.infradead.org

Commit 6ca15cfa0788 ("mtd: maps: Rename physmap_of_{versatile, gemini}
into physmap-{versatile, gemini}") renamed physmap_of_versatile.c to
physmap-versatile.c, but did not adjust the MAINTAINERS entry.

Since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches F: drivers/mtd/maps/physmap_of_versatile.c

Rectify the ARM INTEGRATOR, VERSATILE AND REALVIEW SUPPORT entry and now
also cover drivers/mtd/maps/physmap-versatile.h while at it.

Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Boris, please pick or ack this patch.
applies cleanly on current master and next-20200228

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fcd79fc38928..bbf2108fb9fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1294,7 +1294,7 @@ F:	arch/arm/boot/dts/versatile*
 F:	drivers/clk/versatile/
 F:	drivers/i2c/busses/i2c-versatile.c
 F:	drivers/irqchip/irq-versatile-fpga.c
-F:	drivers/mtd/maps/physmap_of_versatile.c
+F:	drivers/mtd/maps/physmap-versatile.*
 F:	drivers/power/reset/arm-versatile-reboot.c
 F:	drivers/soc/versatile/
 
-- 
2.17.1
