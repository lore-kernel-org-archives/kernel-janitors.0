From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 23 Sep 2019 13:56:32 +0000
Subject: [PATCH] ath9k: remove unused including <linux/version.h>
Message-Id: <20190923135632.145051-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ath9k-devel@qca.qualcomm.com, kvalo@codeaurora.org, afaerber@suse.de, manivannan.sadhasivam@linaro.org
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c b/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c
index 159490f5a111..956fa7828d0c 100644
--- a/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c
+++ b/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c
@@ -12,7 +12,6 @@
  * initialize the chip when the user-space is ready to extract the init code.
  */
 #include <linux/module.h>
-#include <linux/version.h>
 #include <linux/completion.h>
 #include <linux/etherdevice.h>
 #include <linux/firmware.h>
