From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Tue, 21 Feb 2012 10:25:31 +0000
Subject: [PATCH 2/2] Driver: video: Use the macro DMA_BIT_MASK().
Message-Id: <1329819211-8359-1-git-send-email-santoshprasadnayak@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: awalls@md.metrocast.net
Cc: mchehab@infradead.org, ivtv-devel@ivtvdriver.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Santosh Nayak <santoshprasadnayak@gmail.com>

From: Santosh Nayak <santoshprasadnayak@gmail.com>

Use the macro DMA_BIT_MASK instead of the constant  0xffffffff.

Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
---
 drivers/media/video/cx18/cx18-driver.c |    4 ++--
 drivers/media/video/ivtv/ivtv-driver.c |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/video/cx18/cx18-driver.c b/drivers/media/video/cx18/cx18-driver.c
index 349bd9c..08118e5 100644
--- a/drivers/media/video/cx18/cx18-driver.c
+++ b/drivers/media/video/cx18/cx18-driver.c
@@ -38,7 +38,7 @@
 #include "cx18-ioctl.h"
 #include "cx18-controls.h"
 #include "tuner-xc2028.h"
-
+#include <linux/dma-mapping.h>
 #include <media/tveeprom.h>
 
 /* If you have already X v4l cards, then set this to X. This way
@@ -812,7 +812,7 @@ static int cx18_setup_pci(struct cx18 *cx, struct pci_dev *pci_dev,
 		CX18_ERR("Can't enable device %d!\n", cx->instance);
 		return -EIO;
 	}
-	if (pci_set_dma_mask(pci_dev, 0xffffffff)) {
+	if (pci_set_dma_mask(pci_dev, DMA_BIT_MASK(32))) {
 		CX18_ERR("No suitable DMA available, card %d\n", cx->instance);
 		return -EIO;
 	}
diff --git a/drivers/media/video/ivtv/ivtv-driver.c b/drivers/media/video/ivtv/ivtv-driver.c
index 107e9e6..d84e5df 100644
--- a/drivers/media/video/ivtv/ivtv-driver.c
+++ b/drivers/media/video/ivtv/ivtv-driver.c
@@ -55,7 +55,7 @@
 #include "ivtv-routing.h"
 #include "ivtv-controls.h"
 #include "ivtv-gpio.h"
-
+#include <linux/dma-mapping.h>
 #include <media/tveeprom.h>
 #include <media/saa7115.h>
 #include <media/v4l2-chip-ident.h>
@@ -813,7 +813,7 @@ static int ivtv_setup_pci(struct ivtv *itv, struct pci_dev *pdev,
 		IVTV_ERR("Can't enable device!\n");
 		return -EIO;
 	}
-	if (pci_set_dma_mask(pdev, 0xffffffff)) {
+	if (pci_set_dma_mask(pdev, DMA_BIT_MASK(32))) {
 		IVTV_ERR("No suitable DMA available.\n");
 		return -EIO;
 	}
-- 
1.7.4.4

