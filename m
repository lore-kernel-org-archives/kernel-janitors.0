From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 31 May 2018 02:33:14 +0000
Subject: [PATCH net-next] ath10k: make some functions static
Message-Id: <1527733994-149212-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@qca.qualcomm.com>, Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, ath10k@lists.infradead.org

Fixes the following sparse warnings:

drivers/net/wireless/ath/ath10k/snoc.c:823:5: warning:
 symbol 'ath10k_snoc_get_ce_id_from_irq' was not declared. Should it be static?
drivers/net/wireless/ath/ath10k/snoc.c:871:6: warning:
 symbol 'ath10k_snoc_init_napi' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 47a4d2a..c82bc6f 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -820,7 +820,7 @@ static int ath10k_snoc_hif_power_up(struct ath10k *ar)
 	.write32	= ath10k_snoc_write32,
 };
 
-int ath10k_snoc_get_ce_id_from_irq(struct ath10k *ar, int irq)
+static int ath10k_snoc_get_ce_id_from_irq(struct ath10k *ar, int irq)
 {
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
 	int i;
@@ -868,7 +868,7 @@ static int ath10k_snoc_napi_poll(struct napi_struct *ctx, int budget)
 	return done;
 }
 
-void ath10k_snoc_init_napi(struct ath10k *ar)
+static void ath10k_snoc_init_napi(struct ath10k *ar)
 {
 	netif_napi_add(&ar->napi_dev, &ar->napi, ath10k_snoc_napi_poll,
 		       ATH10K_NAPI_BUDGET);

