From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon, 09 Aug 2010 19:52:06 +0000
Subject: [PATCH 18/18 v2] staging: spectra: call disable_pci_device() if pci_probe() failed
Message-Id: <1281383528-14558-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, David Woodhouse <David.Woodhouse@intel.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Driver should call disable_pci_device() if it returns from pci_probe()
with error.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/spectra/lld_nand.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/spectra/lld_nand.c b/drivers/staging/spectra/lld_nand.c
index 13c3ad2..0d647a8 100644
--- a/drivers/staging/spectra/lld_nand.c
+++ b/drivers/staging/spectra/lld_nand.c
@@ -2411,13 +2411,15 @@ static int nand_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
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
@@ -2464,6 +2466,7 @@ static int nand_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 failed_remap_csr:
 	pci_release_regions(dev);
 failed_req_csr:
+	pci_disable_device(dev);
 
 	return ret;
 }
-- 
1.7.0.4

