From: Julia Lawall <julia@diku.dk>
Date: Mon, 01 Dec 2008 22:00:55 +0000
Subject: [PATCH retry] drivers/mtd/nand/pasemi_nand.c: Add missing pci_dev_put
Message-Id: <Pine.LNX.4.64.0812012259590.1541@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, olof@lixom.net

From: Julia Lawall <julia@diku.dk>

pci_get_device increments a reference count that should be decremented
using pci_dev_put.

The semantic patch that finds the problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
statement S,S1;
position p1,p2,p3;
expression E,E1;
type T,T1;
expression *ptr != NULL;
@@

(
 if ((x@p1 = pci_get_device(...)) = NULL) S
|
 x@p1 = pci_get_device(...);
)
 ... when != pci_dev_put(...,(T)x,...)
     when != if (...) { <+... pci_dev_put(...,(T)x,...) ...+> }
     when != true x = NULL || ...
     when != x = E
     when != E = (T)x
     when any
(
 if (x = NULL || ...) S1
|
 if@p2 (...) {
  ... when != pci_dev_put(...,(T1)x,...)
      when != if (...) { <+... pci_dev_put(...,(T1)x,...) ...+> }
      when != x = E1
      when != E1 = (T1)x
(
  return \(0\|<+...x...+>\|ptr\);
|
  return@p3 ...;
)
}
)

@ script:python @
p1 << r.p1;
p3 << r.p3;
@@

print "* file: %s pci_get_device: %s return: %s" % (p1[0].file,p1[0].line,p3[0].line)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mtd/nand/pasemi_nand.c      |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/pasemi_nand.c b/drivers/mtd/nand/pasemi_nand.c
index 75c8990..9bd6c9a 100644
--- a/drivers/mtd/nand/pasemi_nand.c
+++ b/drivers/mtd/nand/pasemi_nand.c
@@ -141,6 +141,7 @@ static int __devinit pasemi_nand_probe(struct of_device *ofdev,
 	}
 
 	lpcctl = pci_resource_start(pdev, 0);
+	pci_dev_put(pdev);
 
 	if (!request_region(lpcctl, 4, driver_name)) {
 		err = -EBUSY;
