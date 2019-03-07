From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Mar 2019 05:33:44 +0000
Subject: [PATCH] scsi: lpfc: Fix error codes in lpfc_sli4_pci_mem_setup()
Message-Id: <20190307053344.GA4517@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

It used to be that "error" was set to -ENODEV at the start of the
function but we shifted some code around an now "error" is set to
zero for most error paths.  There is a mix of direct returns and
"goto out" but I changed everything to direct returns for consistency.

Fixes: 56de8357049c ("scsi: lpfc: fix calls to dma_set_mask_and_coherent()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/lpfc/lpfc_init.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index 3b5873f6751e..f0b9a672f3c3 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -10052,7 +10052,7 @@ lpfc_sli4_pci_mem_setup(struct lpfc_hba *phba)
 {
 	struct pci_dev *pdev = phba->pcidev;
 	unsigned long bar0map_len, bar1map_len, bar2map_len;
-	int error = -ENODEV;
+	int error;
 	uint32_t if_type;
 
 	if (!pdev)
@@ -10071,7 +10071,7 @@ lpfc_sli4_pci_mem_setup(struct lpfc_hba *phba)
 	 */
 	if (pci_read_config_dword(pdev, LPFC_SLI_INTF,
 				  &phba->sli4_hba.sli_intf.word0)) {
-		return error;
+		return -ENODEV;
 	}
 
 	/* There is no SLI3 failback for SLI4 devices. */
@@ -10081,7 +10081,7 @@ lpfc_sli4_pci_mem_setup(struct lpfc_hba *phba)
 				"2894 SLI_INTF reg contents invalid "
 				"sli_intf reg 0x%x\n",
 				phba->sli4_hba.sli_intf.word0);
-		return error;
+		return -ENODEV;
 	}
 
 	if_type = bf_get(lpfc_sli_intf_if_type, &phba->sli4_hba.sli_intf);
@@ -10105,7 +10105,7 @@ lpfc_sli4_pci_mem_setup(struct lpfc_hba *phba)
 			dev_printk(KERN_ERR, &pdev->dev,
 				   "ioremap failed for SLI4 PCI config "
 				   "registers.\n");
-			goto out;
+			return -ENODEV;
 		}
 		phba->pci_bar0_memmap_p = phba->sli4_hba.conf_regs_memmap_p;
 		/* Set up BAR0 PCI config space register memory map */
@@ -10116,7 +10116,7 @@ lpfc_sli4_pci_mem_setup(struct lpfc_hba *phba)
 		if (if_type >= LPFC_SLI_INTF_IF_TYPE_2) {
 			dev_printk(KERN_ERR, &pdev->dev,
 			   "FATAL - No BAR0 mapping for SLI4, if_type 2\n");
-			goto out;
+			return -ENODEV;
 		}
 		phba->sli4_hba.conf_regs_memmap_p  				ioremap(phba->pci_bar0_map, bar0map_len);
@@ -10124,7 +10124,7 @@ lpfc_sli4_pci_mem_setup(struct lpfc_hba *phba)
 			dev_printk(KERN_ERR, &pdev->dev,
 				"ioremap failed for SLI4 PCI config "
 				"registers.\n");
-			goto out;
+			return -ENODEV;
 		}
 		lpfc_sli4_bar0_register_memmap(phba, if_type);
 	}
@@ -10170,6 +10170,7 @@ lpfc_sli4_pci_mem_setup(struct lpfc_hba *phba)
 		if (!phba->sli4_hba.drbl_regs_memmap_p) {
 			dev_err(&pdev->dev,
 			   "ioremap failed for SLI4 HBA doorbell registers.\n");
+			error = -ENOMEM;
 			goto out_iounmap_conf;
 		}
 		phba->pci_bar2_memmap_p = phba->sli4_hba.drbl_regs_memmap_p;
@@ -10219,6 +10220,7 @@ lpfc_sli4_pci_mem_setup(struct lpfc_hba *phba)
 		if (!phba->sli4_hba.dpp_regs_memmap_p) {
 			dev_err(&pdev->dev,
 			   "ioremap failed for SLI4 HBA dpp registers.\n");
+			error = -ENOMEM;
 			goto out_iounmap_ctrl;
 		}
 		phba->pci_bar4_memmap_p = phba->sli4_hba.dpp_regs_memmap_p;
@@ -10249,7 +10251,7 @@ lpfc_sli4_pci_mem_setup(struct lpfc_hba *phba)
 	iounmap(phba->sli4_hba.ctrl_regs_memmap_p);
 out_iounmap_conf:
 	iounmap(phba->sli4_hba.conf_regs_memmap_p);
-out:
+
 	return error;
 }
 
-- 
2.17.1
