From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 03 Jul 2010 16:04:31 +0000
Subject: [PATCH 15/19] drivers/pci: use for_each_pci_dev()
Message-Id: <1278173072-11915-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, Tejun Heo <tj@kernel.org>, Bjorn Helgaas <bjorn.helgaas@hp.com>, Yu Zhao <yu.zhao@intel.com>, Dexuan Cui <dexuan.cui@intel.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org

Use for_each_pci_dev() to simplify the code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/pci/quirks.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 3a81d9d..be632fa 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -2760,7 +2760,7 @@ static int __init pci_apply_final_quirks(void)
 		printk(KERN_DEBUG "PCI: CLS %u bytes\n",
 		       pci_cache_line_size << 2);
 
-	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		pci_fixup_device(pci_fixup_final, dev);
 		/*
 		 * If arch hasn't set it explicitly yet, use the CLS
-- 
1.7.0.4

