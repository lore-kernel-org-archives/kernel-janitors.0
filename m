From: Julia Lawall <julia@diku.dk>
Date: Mon, 19 Nov 2007 08:07:22 +0000
Subject: [PATCH 4/5] drivers/pnp/resource.c: Add missing pci_dev_put
Message-Id: <Pine.LNX.4.64.0711190905100.19198@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ambx1@neo.rr.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

There should be a pci_dev_put when breaking out of a loop that iterates
over calls to pci_get_device and similar functions.

This was fixed using the following semantic patch.

// <smpl>
@@
identifier d;
type T;
expression e;
iterator for_each_pci_dev;
@@

T *d;
...
for_each_pci_dev(d)
   {... when != pci_dev_put(d)
        when != e = d
(
    return d;
|
+  pci_dev_put(d);
?  return ...;
)
...}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -u -p a/drivers/pnp/resource.c b/drivers/pnp/resource.c
--- a/drivers/pnp/resource.c    2007-10-22 11:25:20.000000000 +0200
+++ b/drivers/pnp/resource.c    2007-11-19 08:18:44.000000000 +0100
@@ -367,8 +367,10 @@ int pnp_check_irq(struct pnp_dev *dev, i
         {
                 struct pci_dev *pci = NULL;
                 for_each_pci_dev(pci) {
-                       if (pci->irq = *irq)
+                       if (pci->irq = *irq) {
+                               pci_dev_put(pci);
                                 return 0;
+                       }
                 }
         }
  #endif
