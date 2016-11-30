From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Nov 2016 19:18:30 +0000
Subject: [patch] [patch] amd64_edac: fix some indenting
Message-Id: <20161130191830.GA22025@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Four printks weren't indented far enough and a return -ENODEV was
indented too far.  It's confusing to look at.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index df6d650..fd32afa 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -2528,8 +2528,8 @@ reserve_mc_sibling_devs(struct amd64_pvt *pvt, u16 pci_id1, u16 pci_id2)
 	if (pvt->umc) {
 		pvt->F0 = pci_get_related_function(pvt->F3->vendor, pci_id1, pvt->F3);
 		if (!pvt->F0) {
-		amd64_err("error F0 device not found: vendor %x device 0x%x (broken BIOS?)\n",
-			  PCI_VENDOR_ID_AMD, pci_id1);
+			amd64_err("error F0 device not found: vendor %x device 0x%x (broken BIOS?)\n",
+				  PCI_VENDOR_ID_AMD, pci_id1);
 			return -ENODEV;
 		}
 
@@ -2538,8 +2538,8 @@ reserve_mc_sibling_devs(struct amd64_pvt *pvt, u16 pci_id1, u16 pci_id2)
 			pci_dev_put(pvt->F0);
 			pvt->F0 = NULL;
 
-		amd64_err("error F6 device not found: vendor %x device 0x%x (broken BIOS?)\n",
-			  PCI_VENDOR_ID_AMD, pci_id2);
+			amd64_err("error F6 device not found: vendor %x device 0x%x (broken BIOS?)\n",
+				  PCI_VENDOR_ID_AMD, pci_id2);
 
 			return -ENODEV;
 		}
@@ -2553,8 +2553,8 @@ reserve_mc_sibling_devs(struct amd64_pvt *pvt, u16 pci_id1, u16 pci_id2)
 	/* Reserve the ADDRESS MAP Device */
 	pvt->F1 = pci_get_related_function(pvt->F3->vendor, pci_id1, pvt->F3);
 	if (!pvt->F1) {
-	amd64_err("error address map device not found: vendor %x device 0x%x (broken BIOS?)\n",
-		  PCI_VENDOR_ID_AMD, pci_id1);
+		amd64_err("error address map device not found: vendor %x device 0x%x (broken BIOS?)\n",
+			  PCI_VENDOR_ID_AMD, pci_id1);
 		return -ENODEV;
 	}
 
@@ -2564,9 +2564,9 @@ reserve_mc_sibling_devs(struct amd64_pvt *pvt, u16 pci_id1, u16 pci_id2)
 		pci_dev_put(pvt->F1);
 		pvt->F1 = NULL;
 
-	amd64_err("error F2 device not found: vendor %x device 0x%x (broken BIOS?)\n",
-		  PCI_VENDOR_ID_AMD, pci_id2);
-			return -ENODEV;
+		amd64_err("error F2 device not found: vendor %x device 0x%x (broken BIOS?)\n",
+			  PCI_VENDOR_ID_AMD, pci_id2);
+		return -ENODEV;
 	}
 
 	edac_dbg(1, "F1: %s\n", pci_name(pvt->F1));
