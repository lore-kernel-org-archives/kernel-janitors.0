From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Feb 2018 20:32:35 +0000
Subject: [PATCH 1/2] gpio: timberdale: Delete an error message for a failed memory allocation in timbgpio_pro
Message-Id: <758bf4e7-5beb-dbf6-54ed-6c691a56bbee@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <da77f86c-a366-0a0f-10fd-9b7cfd879391@users.sourceforge.net>
In-Reply-To: <da77f86c-a366-0a0f-10fd-9b7cfd879391@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Feb 2018 21:09:08 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpio/gpio-timberdale.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index 181f86ce00cd..ff155e437210 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -239,10 +239,9 @@ static int timbgpio_probe(struct platform_device *pdev)
 	}
 
 	tgpio = devm_kzalloc(dev, sizeof(struct timbgpio), GFP_KERNEL);
-	if (!tgpio) {
-		dev_err(dev, "Memory alloc failed\n");
+	if (!tgpio)
 		return -EINVAL;
-	}
+
 	tgpio->irq_base = pdata->irq_base;
 
 	spin_lock_init(&tgpio->lock);
-- 
2.16.1

