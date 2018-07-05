From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Jul 2018 09:45:39 +0000
Subject: [PATCH] PCI: mobiveil: integer overflow in IB_WIN_SIZE
Message-Id: <20180705094539.xkmtfffbzl3kooum@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

IB_WIN_SIZE is larger than INT_MAX so we need to cast it to u64.

Fixes: 9af6bcb11e12 ("PCI: mobiveil: Add Mobiveil PCIe Host Bridge IP driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Untested...  Possibly the problem is that there are too many multiplies
by * 1024.

diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controller/pcie-mobiveil.c
index 4d6c20e47bed..cf0aa7cee5b0 100644
--- a/drivers/pci/controller/pcie-mobiveil.c
+++ b/drivers/pci/controller/pcie-mobiveil.c
@@ -107,7 +107,7 @@
 #define CFG_WINDOW_TYPE	0
 #define IO_WINDOW_TYPE		1
 #define MEM_WINDOW_TYPE	2
-#define IB_WIN_SIZE		(256 * 1024 * 1024 * 1024)
+#define IB_WIN_SIZE		((u64)256 * 1024 * 1024 * 1024)
 #define MAX_PIO_WINDOWS	8
 
 /* Parameters for the waiting for link up routine */
