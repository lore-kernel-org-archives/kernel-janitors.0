From: Julia Lawall <julia@diku.dk>
Date: Fri, 30 Nov 2007 15:51:50 +0000
Subject: [PATCH 2/2] drivers/macintosh/via-pmu.c: Added a missing iounmap
Message-Id: <Pine.LNX.4.64.0711301651020.26269@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benh@kernel.crashing.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The error handling code should undo the ioremap as well.

The problem was detected using the following semantic match
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T,T1,T2;
identifier E;
statement S;
expression x1,x2;
constant C;
int ret;
@@

  T E;
  ...
* E = ioremap(...);
  if (E = NULL) S
  ... when != iounmap(E)
      when != if (E != NULL) { ... iounmap(E); ...}
      when != x1 = (T1)E
  if (...) {
    ... when != iounmap(E)
        when != if (E != NULL) { ... iounmap(E); ...}
        when != x2 = (T2)E
(
*   return;
|
*   return C;
|
*   return ret;
)
  }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
--- a/drivers/macintosh/via-pmu.c	2007-11-18 20:43:10.000000000 +0100
+++ b/drivers/macintosh/via-pmu.c	2007-11-29 18:47:46.000000000 +0100
@@ -2336,6 +2336,7 @@ powerbook_sleep_3400(void)
 	ret = pmac_suspend_devices();
 	if (ret) {
 		pbook_free_pci_save();
+		iounmap(mem_ctrl);
 		printk(KERN_ERR "Sleep rejected by devices\n");
 		return ret;
 	}
