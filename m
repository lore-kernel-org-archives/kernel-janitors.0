From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 11 Dec 2015 17:50:50 +0000
Subject: [PATCH] rtc: v3020: constify v3020_chip_ops structures
Message-Id: <1449856250-24732-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>
Cc: kernel-janitors@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org

The v3020_chip_ops structures are never modified, so declare them as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/rtc/rtc-v3020.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-v3020.c b/drivers/rtc/rtc-v3020.c
index f9f9709..7a04363 100644
--- a/drivers/rtc/rtc-v3020.c
+++ b/drivers/rtc/rtc-v3020.c
@@ -57,7 +57,7 @@ struct v3020 {
 	/* GPIO access */
 	struct gpio *gpio;
 
-	struct v3020_chip_ops *ops;
+	const struct v3020_chip_ops *ops;
 
 	struct rtc_device *rtc;
 };
@@ -95,7 +95,7 @@ static unsigned char v3020_mmio_read_bit(struct v3020 *chip)
 	return !!(readl(chip->ioaddress) & (1 << chip->leftshift));
 }
 
-static struct v3020_chip_ops v3020_mmio_ops = {
+static const struct v3020_chip_ops v3020_mmio_ops = {
 	.map_io		= v3020_mmio_map,
 	.unmap_io	= v3020_mmio_unmap,
 	.read_bit	= v3020_mmio_read_bit,
@@ -158,7 +158,7 @@ static unsigned char v3020_gpio_read_bit(struct v3020 *chip)
 	return bit;
 }
 
-static struct v3020_chip_ops v3020_gpio_ops = {
+static const struct v3020_chip_ops v3020_gpio_ops = {
 	.map_io		= v3020_gpio_map,
 	.unmap_io	= v3020_gpio_unmap,
 	.read_bit	= v3020_gpio_read_bit,

