From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Apr 2017 20:26:29 +0000
Subject: [PATCH 1/2] firewire: ohci: Use kcalloc() in pci_probe()
Message-Id: <8d17e44a-054c-f7e2-ada2-db80ec148287@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139a329-f084-c4f3-d9af-19ad15445017@users.sourceforge.net>
In-Reply-To: <1139a329-f084-c4f3-d9af-19ad15445017@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux1394-devel@lists.sourceforge.net, Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Apr 2017 21:50:19 +0200

* Multiplications for the size determination of memory allocations
  indicated that array data structures should be processed.
  Thus use the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of data structures by pointer dereferences
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

* Delete the local variable "size" which became unnecessary
  with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firewire/ohci.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index 8bf89267dc25..30be5dbd5b09 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -3565,7 +3565,6 @@ static int pci_probe(struct pci_dev *dev,
 	u32 bus_options, max_receive, link_speed, version;
 	u64 guid;
 	int i, err;
-	size_t size;
 
 	if (dev->vendor = PCI_VENDOR_ID_PINNACLE_SYSTEMS) {
 		dev_err(&dev->dev, "Pinnacle MovieBoard is not yet supported\n");
@@ -3671,9 +3670,9 @@ static int pci_probe(struct pci_dev *dev,
 	reg_write(ohci, OHCI1394_IsoRecvIntMaskClear, ~0);
 	ohci->ir_context_mask = ohci->ir_context_support;
 	ohci->n_ir = hweight32(ohci->ir_context_mask);
-	size = sizeof(struct iso_context) * ohci->n_ir;
-	ohci->ir_context_list = kzalloc(size, GFP_KERNEL);
-
+	ohci->ir_context_list = kcalloc(ohci->n_ir,
+					sizeof(*ohci->ir_context_list),
+					GFP_KERNEL);
 	reg_write(ohci, OHCI1394_IsoXmitIntMaskSet, ~0);
 	ohci->it_context_support = reg_read(ohci, OHCI1394_IsoXmitIntMaskSet);
 	/* JMicron JMB38x often shows 0 at first read, just ignore it */
@@ -3684,9 +3683,9 @@ static int pci_probe(struct pci_dev *dev,
 	reg_write(ohci, OHCI1394_IsoXmitIntMaskClear, ~0);
 	ohci->it_context_mask = ohci->it_context_support;
 	ohci->n_it = hweight32(ohci->it_context_mask);
-	size = sizeof(struct iso_context) * ohci->n_it;
-	ohci->it_context_list = kzalloc(size, GFP_KERNEL);
-
+	ohci->it_context_list = kcalloc(ohci->n_it,
+					sizeof(*ohci->it_context_list),
+					GFP_KERNEL);
 	if (ohci->it_context_list = NULL || ohci->ir_context_list = NULL) {
 		err = -ENOMEM;
 		goto fail_contexts;
-- 
2.12.2

