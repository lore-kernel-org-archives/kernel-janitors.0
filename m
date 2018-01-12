From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Jan 2018 20:37:53 +0000
Subject: [PATCH] gpio-wm831x: Use seq_putc() in wm831x_gpio_dbg_show()
Message-Id: <85344479-907c-adf7-6ae6-6d6acff2c1b1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Jan 2018 21:30:09 +0100

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpio/gpio-wm831x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index 938bbe3f831c..324813e8304e 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -182,7 +182,7 @@ static void wm831x_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 			dev_err(wm831x->dev,
 				"GPIO control %d read failed: %d\n",
 				gpio, reg);
-			seq_printf(s, "\n");
+			seq_putc(s, '\n');
 			continue;
 		}
 
-- 
2.15.1

