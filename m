From: Julia Lawall <julia@diku.dk>
Date: Fri, 27 Aug 2010 21:01:29 +0000
Subject: [PATCH 1/2] drivers/clocksource/cyclone.c: Move up iounmap
Message-Id: <1282942890-465-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

By moving the iounmap up above the test, it takes place whether the test
succeeds or fails.

The sematic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
local idexpression x;
expression E,E1;
identifier l;
statement S;
@@

*x = ioremap_nocache(...);
...
if (x = NULL) S
... when != iounmap(x)
    when != if (...) { ... iounmap(x); ... }
    when != E = x
if (...) {
  ... when != iounmap(x)
      when != if (...) { ... iounmap(x); ... }
(
  return <+...x...+>;
|
* return ...;
)
}
... when != x = E1
iounmap(x);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/clocksource/cyclone.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/cyclone.c b/drivers/clocksource/cyclone.c
index 64e528e..4c62e20 100644
--- a/drivers/clocksource/cyclone.c
+++ b/drivers/clocksource/cyclone.c
@@ -57,11 +57,11 @@ static int __init init_cyclone_clocksource(void)
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

