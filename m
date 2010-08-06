From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 06 Aug 2010 19:53:29 +0000
Subject: [PATCH 18/18] staging: spectra: call disable_pci_device() if pci_probe() failed
Message-Id: <1281124411-14011-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, David Woodhouse <David.Woodhouse@intel.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Driver should call disable_pci_device() if it returns from pci_probe()
with error. Also it must not be called if pci_request_region() fails as
it means that somebody uses device resources and rules the device.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/spectra/lld_nand.c |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/spectra/lld_nand.c b/drivers/staging/spectra/lld_nand.c
index 13c3ad2..90eeb0a 100644
--- a/drivers/staging/spectra/lld_nand.c
+++ b/drivers/staging/spectra/lld_nand.c
@@ -2395,6 +2395,7 @@ static int nand_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	unsigned long csr_base;
 	unsigned long csr_len;
 	struct mrst_nand_info *pndev = &info;
+	int pci_dev_busy = 0;
 
 	nand_dbg_print(NAND_DBG_WARN, "%s, Line %d, Function: %s\n",
 		       __FILE__, __LINE__, __func__);
@@ -2411,19 +2412,22 @@ static int nand_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	csr_base = pci_resource_start(dev, 0);
 	if (!csr_base) {
 		printk(KERN_ERR "Spectra: pci_resource_start failed!\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto failed_req_csr;
 	}
 
 	csr_len = pci_resource_len(dev, 0);
 	if (!csr_len) {
 		printk(KERN_ERR "Spectra: pci_resource_len failed!\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto failed_req_csr;
 	}
 
 	ret = pci_request_regions(dev, SPECTRA_NAND_NAME);
 	if (ret) {
 		printk(KERN_ERR "Spectra: Unable to request "
 		       "memory region\n");
+		pci_dev_busy = 1;
 		goto failed_req_csr;
 	}
 
@@ -2464,6 +2468,8 @@ static int nand_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 failed_remap_csr:
 	pci_release_regions(dev);
 failed_req_csr:
+	if (!pci_dev_busy)
+		pci_disable_device(dev);
 
 	return ret;
 }
-- 
1.7.0.4

