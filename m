From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Wed, 28 Jul 2010 18:29:52 +0000
Subject: [PATCH] video/w100fb: ignore void return value / fix build failure
Message-Id: <201007282029.52989.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Peter Huewe <peterhuewe@gmx.de>

This patch fixes a build failure [1] (error: void value not ignored as
it ought to be) by removing an assignment of a void return value.
The functionality of the code is not changed.

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
KernelVersion: linux-next-20100728
References:
[1] http://kisskb.ellerman.id.au/kisskb/buildresult/2980912/

 drivers/video/w100fb.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/w100fb.c b/drivers/video/w100fb.c
index e66b8b1..d8b12c3 100644
--- a/drivers/video/w100fb.c
+++ b/drivers/video/w100fb.c
@@ -858,9 +858,9 @@ unsigned long w100fb_gpio_read(int port)
 void w100fb_gpio_write(int port, unsigned long value)
 {
 	if (port=W100_GPIO_PORT_A)
-		value = writel(value, remapped_regs + mmGPIO_DATA);
+		writel(value, remapped_regs + mmGPIO_DATA);
 	else
-		value = writel(value, remapped_regs + mmGPIO_DATA2);
+		writel(value, remapped_regs + mmGPIO_DATA2);
 }
 EXPORT_SYMBOL(w100fb_gpio_read);
 EXPORT_SYMBOL(w100fb_gpio_write);
-- 
1.7.1

