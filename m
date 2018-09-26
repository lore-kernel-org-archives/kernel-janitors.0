From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 26 Sep 2018 10:51:10 +0000
Subject: [PATCH -next] PCI/AER: Remove duplicated include from err.c
Message-Id: <1537959610-71713-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell Currey <ruscur@russell.cc>, Sam Bobroff <sbobroff@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pci/pcie/err.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 4da2a62b..773197a 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -12,7 +12,6 @@
 
 #include <linux/pci.h>
 #include <linux/module.h>
-#include <linux/pci.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/aer.h>
