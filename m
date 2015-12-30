From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 30 Dec 2015 20:59:34 +0000
Subject: [PATCH] rtc: rtc-ds2404: constify ds2404_chip_ops structures
Message-Id: <1451509174-6343-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>
Cc: kernel-janitors@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org

The ds2404_chip_ops structure is never modified, so declare it as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/rtc/rtc-ds2404.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ds2404.c b/drivers/rtc/rtc-ds2404.c
index 7885edd..16310fe 100644
--- a/drivers/rtc/rtc-ds2404.c
+++ b/drivers/rtc/rtc-ds2404.c
@@ -48,7 +48,7 @@ struct ds2404_gpio {
 
 struct ds2404 {
 	struct ds2404_gpio *gpio;
-	struct ds2404_chip_ops *ops;
+	const struct ds2404_chip_ops *ops;
 	struct rtc_device *rtc;
 };
 
@@ -95,7 +95,7 @@ static void ds2404_gpio_unmap(struct ds2404 *chip)
 		gpio_free(ds2404_gpio[i].gpio);
 }
 
-static struct ds2404_chip_ops ds2404_gpio_ops = {
+static const struct ds2404_chip_ops ds2404_gpio_ops = {
 	.map_io		= ds2404_gpio_map,
 	.unmap_io	= ds2404_gpio_unmap,
 };

