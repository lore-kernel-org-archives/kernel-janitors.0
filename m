From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Jan 2018 10:49:02 +0000
Subject: [PATCH] pinctrl: pinmux: Use seq_putc() in pinmux_pins_show()
Message-Id: <bb070097-4d6a-3986-398d-7276cb18bb37@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Jan 2018 11:33:47 +0100

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinmux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 55502fc4479c..139a004a5e71 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -619,7 +619,7 @@ static int pinmux_pins_show(struct seq_file *s, void *what)
 				   pctlops->get_group_name(pctldev,
 					desc->mux_setting->group));
 		else
-			seq_printf(s, "\n");
+			seq_putc(s, '\n');
 	}
 
 	mutex_unlock(&pctldev->mutex);
-- 
2.15.1

