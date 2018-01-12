From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Jan 2018 20:01:49 +0000
Subject: [PATCH 1/4] gpio-stmpe: Use seq_putc() in stmpe_dbg_show()
Message-Id: <91234c1e-9106-ae5d-ebed-8e3d5f272c1e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <df11c007-360e-ce6b-2f70-61b6fb6b49cf@users.sourceforge.net>
In-Reply-To: <df11c007-360e-ce6b-2f70-61b6fb6b49cf@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Jan 2018 19:30:50 +0100

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpio/gpio-stmpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index e3d048e65339..79858c6ad31a 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -350,7 +350,7 @@ static void stmpe_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 
 	for (i = 0; i < gc->ngpio; i++, gpio++) {
 		stmpe_dbg_show_one(s, gc, i, gpio);
-		seq_printf(s, "\n");
+		seq_putc(s, '\n');
 	}
 }
 
-- 
2.15.1

