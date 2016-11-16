From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Nov 2016 11:41:51 +0000
Subject: [patch] pinctrl: single: Fix a couple error codes
Message-Id: <20161116114151.GA31224@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Lindgren <tony@atomide.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

We should return -ENOMEM instead of success if pcs_add_function() fails.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 2b196e5..a5a0392 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1181,8 +1181,10 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 
 	pgnames[0] = np->name;
 	function = pcs_add_function(pcs, np, np->name, vals, found, pgnames, 1);
-	if (!function)
+	if (!function) {
+		res = -ENOMEM;
 		goto free_pins;
+	}
 
 	res = pcs_add_pingroup(pcs, np, np->name, pins, found);
 	if (res < 0)
@@ -1313,8 +1315,10 @@ static int pcs_parse_bits_in_pinctrl_entry(struct pcs_device *pcs,
 
 	pgnames[0] = np->name;
 	function = pcs_add_function(pcs, np, np->name, vals, found, pgnames, 1);
-	if (!function)
+	if (!function) {
+		res = -ENOMEM;
 		goto free_pins;
+	}
 
 	res = pcs_add_pingroup(pcs, np, np->name, pins, found);
 	if (res < 0)
