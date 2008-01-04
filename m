From: Julia Lawall <julia@diku.dk>
Date: Fri, 04 Jan 2008 14:45:33 +0000
Subject: [PATCH] drivers/macintosh: Add missing pci_dev_get
Message-Id: <Pine.LNX.4.58.0801041545020.1184@pc-041.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benh@kernel.crashing.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

pci_get_bus_and_slot does a pci_dev_get, so pci_dev_put needs to be called
in an error case.

The problem was fixed using the following semantic patch.
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@exists@
type T1,T2;
identifier E;
statement S,S1;
expression x1,x2,x3;
expression test;
int ret != 0;
@@

  struct pci_dev *E;
  ...
(
  E = \(pci_get_slot\|pci_get_device\|pci_get_bus_and_slot\)(...);
  if (E = NULL) S
|
  if ((E = \(pci_get_slot\|pci_get_device\|pci_get_bus_and_slot\)(...)) = NULL) S
)
  ... when != pci_dev_put(...,(T1)E,...)
      when != if (E != NULL) { ... pci_dev_put(...,(T1)E,...); ...}
      when != x1 = (T1)E
      when != E = x3;
      when any
(
  if (E = NULL) S1
|
  if (test)
+   {
(
+   pci_dev_put(E);
    return;
|
+   pci_dev_put(E);
    return ret;
)
+   }
|
  if (test) {
    ... when != pci_dev_put(...,(T2)E,...)
        when != if (E != NULL) { ... pci_dev_put(...,(T2)E,...); ...}
        when != x2 = (T2)E
(
+   pci_dev_put(E);
    return;
|
+   pci_dev_put(E);
    return ret;
)
  }
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---


diff -u -p a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
--- a/drivers/macintosh/via-pmu.c 2007-12-21 06:57:19.000000000 +0100
+++ b/drivers/macintosh/via-pmu.c 2008-01-04 14:00:03.000000000 +0100
@@ -2142,6 +2142,7 @@ static int powerbook_sleep_grackle(void)
 	ret = pmac_suspend_devices();
 	if (ret) {
 		printk(KERN_ERR "Sleep rejected by devices\n");
+		pci_dev_put(grackle);
 		return ret;
 	}

