From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 06 Nov 2019 18:22:05 +0000
Subject: [PATCH] bus: ti-sysc: Adjust exception handling in sysc_child_add_named_clock()
Message-Id: <8874d0c5-856a-809f-cba6-1b970df68d13@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Tero Kristo <t-kristo@ti.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 6 Nov 2019 19:12:30 +0100

Add a jump target so that a call of the function “clk_put”
can be better reused at the end of this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/bus/ti-sysc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 97b85493aa43..2042f6e45163 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1766,9 +1766,8 @@ static int sysc_child_add_named_clock(struct sysc *ddata,

 	clk = clk_get(child, name);
 	if (!IS_ERR(clk)) {
-		clk_put(clk);
-
-		return -EEXIST;
+		error = -EEXIST;
+		goto put_clk;
 	}

 	clk = clk_get(ddata->dev, name);
@@ -1778,7 +1777,7 @@ static int sysc_child_add_named_clock(struct sysc *ddata,
 	l = clkdev_create(clk, name, dev_name(child));
 	if (!l)
 		error = -ENOMEM;
-
+put_clk:
 	clk_put(clk);

 	return error;
--
2.24.0
