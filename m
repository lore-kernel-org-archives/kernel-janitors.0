From: Julia Lawall <julia@diku.dk>
Date: Sun, 06 Dec 2009 09:15:53 +0000
Subject: [PATCH 2/5] drivers/clocksource: correct size computation
Message-Id: <Pine.LNX.4.64.0912061015340.20858@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The size argument to ioremap_nocache should be the size of desired
information, not the pointer to it.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@expression@
expression *x;
@@

x  <+...
-sizeof(x)
+sizeof(*x)
...+>// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/clocksource/cyclone.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff -u -p a/drivers/clocksource/cyclone.c b/drivers/clocksource/cyclone.c
--- a/drivers/clocksource/cyclone.c
+++ b/drivers/clocksource/cyclone.c
@@ -50,7 +50,7 @@ static int __init init_cyclone_clocksour
 
 	/* find base address: */
 	offset = CYCLONE_CBAR_ADDR;
-	reg = ioremap_nocache(offset, sizeof(reg));
+	reg = ioremap_nocache(offset, sizeof(*reg));
 	if (!reg) {
 		printk(KERN_ERR "Summit chipset: Could not find valid CBAR register.\n");
 		return -ENODEV;
@@ -65,7 +65,7 @@ static int __init init_cyclone_clocksour
 
 	/* setup PMCC: */
 	offset = base + CYCLONE_PMCC_OFFSET;
-	reg = ioremap_nocache(offset, sizeof(reg));
+	reg = ioremap_nocache(offset, sizeof(*reg));
 	if (!reg) {
 		printk(KERN_ERR "Summit chipset: Could not find valid PMCC register.\n");
 		return -ENODEV;
@@ -75,7 +75,7 @@ static int __init init_cyclone_clocksour
 
 	/* setup MPCS: */
 	offset = base + CYCLONE_MPCS_OFFSET;
-	reg = ioremap_nocache(offset, sizeof(reg));
+	reg = ioremap_nocache(offset, sizeof(*reg));
 	if (!reg) {
 		printk(KERN_ERR "Summit chipset: Could not find valid MPCS register.\n");
 		return -ENODEV;
