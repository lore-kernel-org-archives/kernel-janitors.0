From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 12 Aug 2017 05:44:32 +0000
Subject: [PATCH 4/6] scsi: be2iscsi: constify pci_error_handlers structures
Message-Id: <1502516674-8918-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502516674-8918-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502516674-8918-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Subbu Seetharaman <subbu.seetharaman@broadcom.com>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Ketan Mukadam <ketan.mukadam@broadcom.com>, Jitendra Bhivare <jitendra.bhivare@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

These pci_error_handlers structures are only stored in the err_handler
field of a pci_driver structure, and this field is declared as const.  Thus
the pci_error_handlers structures can be const too.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/scsi/be2iscsi/be_main.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/be2iscsi/be_main.c b/drivers/scsi/be2iscsi/be_main.c
index b4542e7..511732a 100644
--- a/drivers/scsi/be2iscsi/be_main.c
+++ b/drivers/scsi/be2iscsi/be_main.c
@@ -5786,7 +5786,7 @@ static void beiscsi_remove(struct pci_dev *pcidev)
 }
 
 
-static struct pci_error_handlers beiscsi_eeh_handlers = {
+static const struct pci_error_handlers beiscsi_eeh_handlers = {
 	.error_detected = beiscsi_eeh_err_detected,
 	.slot_reset = beiscsi_eeh_reset,
 	.resume = beiscsi_eeh_resume,

