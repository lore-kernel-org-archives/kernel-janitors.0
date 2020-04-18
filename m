From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 18 Apr 2020 10:09:33 +0000
Subject: [PATCH RESEND] MAINTAINERS: adjust to renaming physmap_of_versatile.c
Message-Id: <20200418100933.8012-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <bbrezillon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
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
applies cleanly on current master and next-20200417

v1: https://lore.kernel.org/lkml/20200228063338.4099-1-lukas.bulwahn@gmail.com/
  - was wrongly sent to old boris.brezillon@bootlin.com address
  - got Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c77f02282044..52bb8819230a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1342,7 +1342,7 @@ F:	arch/arm/plat-versatile/
 F:	drivers/clk/versatile/
 F:	drivers/i2c/busses/i2c-versatile.c
 F:	drivers/irqchip/irq-versatile-fpga.c
-F:	drivers/mtd/maps/physmap_of_versatile.c
+F:	drivers/mtd/maps/physmap-versatile.*
 F:	drivers/power/reset/arm-versatile-reboot.c
 F:	drivers/soc/versatile/
 
-- 
2.17.1
