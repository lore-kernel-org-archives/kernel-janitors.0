From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Tue, 21 Feb 2012 10:20:13 +0000
Subject: [PATCH 1/2] Driver: firewire: Use the macro DMA_BIT_MASK().
Message-Id: <1329818893-8276-1-git-send-email-santoshprasadnayak@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stefanr@s5r6.in-berlin.de
Cc: linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Santosh Nayak <santoshprasadnayak@gmail.com>

From: Santosh Nayak <santoshprasadnayak@gmail.com>

Use the macro DMA_BIT_MASK instead of the constant  0xffffffff

Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
---
 drivers/firewire/nosy.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/nosy.c b/drivers/firewire/nosy.c
index 763626b..a7c4422 100644
--- a/drivers/firewire/nosy.c
+++ b/drivers/firewire/nosy.c
@@ -36,7 +36,7 @@
 #include <linux/timex.h>
 #include <linux/uaccess.h>
 #include <linux/wait.h>
-
+#include <linux/dma-mapping.h>
 #include <linux/atomic.h>
 #include <asm/byteorder.h>
 
@@ -536,7 +536,7 @@ add_card(struct pci_dev *dev, const struct pci_device_id *unused)
 	u32 p, end;
 	int ret, i;
 
-	if (pci_set_dma_mask(dev, 0xffffffff)) {
+	if (pci_set_dma_mask(dev, DMA_BIT_MASK(32))) {
 		dev_err(&dev->dev,
 		    "DMA address limits not supported for PCILynx hardware\n");
 		return -ENXIO;
-- 
1.7.4.4

