From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 12 Jan 2012 09:55:15 +0000
Subject: [PATCH 13/15] drivers/clocksource/cyclone.c: add missing iounmap
Message-Id: <1326362117-29371-13-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Stultz <johnstul@us.ibm.com>
Cc: kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Add missing iounmap in error handling code, in a case where the function
already preforms iounmap on some other execution path.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e;
statement S,S1;
int ret;
@@
e = \(ioremap\|ioremap_nocache\)(...)
... when != iounmap(e)
if (<+...e...+>) S
... when any
    when != iounmap(e)
*if (...)
   { ... when != iounmap(e)
     return ...; }
... when any
iounmap(e);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/clocksource/cyclone.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/cyclone.c b/drivers/clocksource/cyclone.c
index 72f811f..9e0998f 100644
--- a/drivers/clocksource/cyclone.c
+++ b/drivers/clocksource/cyclone.c
@@ -55,11 +55,11 @@ static int __init init_cyclone_clocksource(void)
 	}
 	/* even on 64bit systems, this is only 32bits: */
 	base = readl(reg);
+	iounmap(reg);
 	if (!base) {
 		printk(KERN_ERR "Summit chipset: Could not find valid CBAR value.\n");
 		return -ENODEV;
 	}
-	iounmap(reg);
 
 	/* setup PMCC: */
 	offset = base + CYCLONE_PMCC_OFFSET;

