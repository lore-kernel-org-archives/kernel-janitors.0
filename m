From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 12 Aug 2017 05:44:29 +0000
Subject: [PATCH 1/6] scsi: mpt3sas: constify pci_error_handlers structures
Message-Id: <1502516674-8918-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502516674-8918-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502516674-8918-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sathya Prakash <sathya.prakash@broadcom.com>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Chaitra P B <chaitra.basappa@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

These pci_error_handlers structures are only stored in the err_handler
field of a pci_driver structure, and this field is declared as const.  Thus
the pci_error_handlers structures can be const too.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/scsi/mpt3sas/mpt3sas_scsih.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/mpt3sas/mpt3sas_scsih.c b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
index 22998cb..52c163f 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_scsih.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
@@ -9277,7 +9277,7 @@ bool scsih_ncq_prio_supp(struct scsi_device *sdev)
 };
 MODULE_DEVICE_TABLE(pci, mpt3sas_pci_table);
 
-static struct pci_error_handlers _mpt3sas_err_handler = {
+static const struct pci_error_handlers _mpt3sas_err_handler = {
 	.error_detected	= scsih_pci_error_detected,
 	.mmio_enabled	= scsih_pci_mmio_enabled,
 	.slot_reset	= scsih_pci_slot_reset,

