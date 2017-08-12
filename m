From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 12 Aug 2017 05:44:31 +0000
Subject: [PATCH 3/6] scsi: aacraid: constify pci_error_handlers structures
Message-Id: <1502516674-8918-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502516674-8918-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502516674-8918-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adaptec OEM Raid Solutions <aacraid@microsemi.com>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

These pci_error_handlers structures are only stored in the err_handler
field of a pci_driver structure, and this field is declared as const.  Thus
the pci_error_handlers structures can be const too.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/scsi/aacraid/linit.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/aacraid/linit.c b/drivers/scsi/aacraid/linit.c
index a8dedc3..2b978d8 100644
--- a/drivers/scsi/aacraid/linit.c
+++ b/drivers/scsi/aacraid/linit.c
@@ -2070,7 +2070,7 @@ static void aac_pci_resume(struct pci_dev *pdev)
 	dev_err(&pdev->dev, "aacraid: PCI error - resume\n");
 }
 
-static struct pci_error_handlers aac_pci_err_handler = {
+static const struct pci_error_handlers aac_pci_err_handler = {
 	.error_detected		= aac_pci_error_detected,
 	.mmio_enabled		= aac_pci_mmio_enabled,
 	.slot_reset		= aac_pci_slot_reset,

