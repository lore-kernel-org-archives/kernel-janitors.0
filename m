From: Emil Goode <emilgoode@gmail.com>
Date: Tue, 30 Jul 2013 17:35:37 +0000
Subject: [PATCH 3/3] spi: spi-txx9: Fix warning by including linux/gpio.h
Message-Id: <1375205737-3468-3-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

According to the following commit direct inclusion of asm/gpio.h
is deprecated.
7563bbf89d065a2c3f05059ecbcc805645edcc62
("gpiolib/arches: Centralise bolierplate asm/gpio.h")

This patch fixes the below warnings by including linux/gpio.h.

arch/x86/include/asm/gpio.h:2:2: warning:
	Include linux/gpio.h instead of asm/gpio.h

In file included from drivers/spi/spi-txx9.c:29:0:
arch/x86/include/asm/gpio.h:2:2: warning:
	#warning Include linux/gpio.h instead of asm/gpio.h [-Wcpp]

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/spi/spi-txx9.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-txx9.c b/drivers/spi/spi-txx9.c
index e9b7681..7c6d157 100644
--- a/drivers/spi/spi-txx9.c
+++ b/drivers/spi/spi-txx9.c
@@ -26,7 +26,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <asm/gpio.h>
+#include <linux/gpio.h>
 
 
 #define SPI_FIFO_SIZE 4
-- 
1.7.10.4

