From: Julia Lawall <julia@diku.dk>
Date: Tue, 24 Aug 2010 14:39:29 +0000
Subject: [PATCH 4/5] drivers/char/agp: Eliminate memory leak
Message-Id: <Pine.LNX.4.64.1008241639130.15172@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

alloc_pci_dev allocates some memory, so that memory should be freed before
leaving the function in an error case.

A simplified version of the semantic match that finds this problem is:
(http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
local idexpression x;
expression E;
identifier f1;
iterator I;
@@

x = alloc_pci_dev(...);
<... when != x
     when != true (x = NULL || ...)
     when != if (...) { <+...x...+> }
     when != I (...) { <+...x...+> }
(
 x = NULL
|
 x = E
|
 x->f1
)
...>
* return ...;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/char/agp/parisc-agp.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/char/agp/parisc-agp.c b/drivers/char/agp/parisc-agp.c
index 1c12921..e2372b7 100644
--- a/drivers/char/agp/parisc-agp.c
+++ b/drivers/char/agp/parisc-agp.c
@@ -357,9 +357,10 @@ parisc_agp_setup(void __iomem *ioc_hpa, void __iomem *lba_hpa)
 	fake_bridge_dev->device = PCI_DEVICE_ID_HP_PCIX_LBA;
 	bridge->dev = fake_bridge_dev;
 
-	error = agp_add_bridge(bridge);
+	return agp_add_bridge(bridge);
 
 fail:
+	kfree(fake_bridge_dev);
 	return error;
 }
 
