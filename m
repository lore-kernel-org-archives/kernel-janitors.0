From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 Jan 2020 17:46:52 +0000
Subject: [PATCH v2] ath11k: fix up some error paths
Message-Id: <20200115174652.dvkmznhfvjaoc47l@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200115091903.7EC3FC4479C@smtp.codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Bhagavathi Perumal S <bperumal@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>, Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>

There are two error paths where "ret" wasn't set.  Also one error path
we set the error code to -EINVAL but we should just preserve the error
code from ath11k_hal_srng_get_entrysize().  That function only returns
-EINVAL so this doesn't change anything.

I removed the "ret = 0;" initializers so that hopefully GCC will be able
to detect these sorts of bugs in the future.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: rebase

 drivers/net/wireless/ath/ath11k/dp_tx.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 918305dda106..873b2cb2bb4c 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -630,7 +630,7 @@ int ath11k_dp_tx_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
 	dma_addr_t hp_addr, tp_addr;
 	enum htt_srng_ring_type htt_ring_type;
 	enum htt_srng_ring_id htt_ring_id;
-	int ret = 0;
+	int ret;
 
 	skb = ath11k_htc_alloc_skb(ab, len);
 	if (!skb)
@@ -642,9 +642,10 @@ int ath11k_dp_tx_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
 	hp_addr = ath11k_hal_srng_get_hp_addr(ab, srng);
 	tp_addr = ath11k_hal_srng_get_tp_addr(ab, srng);
 
-	if (ath11k_dp_tx_get_ring_id_type(ab, mac_id, ring_id,
-					  ring_type, &htt_ring_type,
-					  &htt_ring_id))
+	ret = ath11k_dp_tx_get_ring_id_type(ab, mac_id, ring_id,
+					    ring_type, &htt_ring_type,
+					    &htt_ring_id);
+	if (ret)
 		goto err_free;
 
 	skb_put(skb, len);
@@ -669,10 +670,8 @@ int ath11k_dp_tx_htt_srng_setup(struct ath11k_base *ab, u32 ring_id,
 				 HAL_ADDR_MSB_REG_SHIFT;
 
 	ret = ath11k_hal_srng_get_entrysize(ring_type);
-	if (ret < 0) {
-		ret = -EINVAL;
+	if (ret < 0)
 		goto err_free;
-	}
 
 	ring_entry_sz = ret;
 
@@ -817,7 +816,7 @@ int ath11k_dp_tx_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
 	int len = sizeof(*cmd);
 	enum htt_srng_ring_type htt_ring_type;
 	enum htt_srng_ring_id htt_ring_id;
-	int ret = 0;
+	int ret;
 
 	skb = ath11k_htc_alloc_skb(ab, len);
 	if (!skb)
@@ -826,9 +825,10 @@ int ath11k_dp_tx_htt_rx_filter_setup(struct ath11k_base *ab, u32 ring_id,
 	memset(&params, 0, sizeof(params));
 	ath11k_hal_srng_get_params(ab, srng, &params);
 
-	if (ath11k_dp_tx_get_ring_id_type(ab, mac_id, ring_id,
-					  ring_type, &htt_ring_type,
-					  &htt_ring_id))
+	ret = ath11k_dp_tx_get_ring_id_type(ab, mac_id, ring_id,
+					    ring_type, &htt_ring_type,
+					    &htt_ring_id);
+	if (ret)
 		goto err_free;
 
 	skb_put(skb, len);
-- 
2.11.0
