From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Jun 2013 07:28:46 +0000
Subject: [patch] ath10k: off by one sanity check
Message-Id: <20130618072846.GC12329@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

This should be >= ARRAY_SIZE() instead of > ARRAY_SIZE().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 8e4e832..c8e9056 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1772,7 +1772,7 @@ static irqreturn_t ath10k_pci_per_engine_handler(int irq, void *arg)
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
 	int ce_id = irq - ar_pci->pdev->irq - MSI_ASSIGN_CE_INITIAL;
 
-	if (ce_id < 0 || ce_id > ARRAY_SIZE(ar_pci->pipe_info)) {
+	if (ce_id < 0 || ce_id >= ARRAY_SIZE(ar_pci->pipe_info)) {
 		ath10k_warn("unexpected/invalid irq %d ce_id %d\n", irq, ce_id);
 		return IRQ_HANDLED;
 	}
