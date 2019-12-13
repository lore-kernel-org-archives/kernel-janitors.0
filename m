From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Dec 2019 10:51:27 +0000
Subject: [PATCH] ath11k: checking for NULL vs IS_ERR()
Message-Id: <20191213105127.kijiazxwtghmubyk@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Miles Hu <milehu@codeaurora.org>, kernel-janitors@vger.kernel.org, Venkateswara Naralasetty <vnaralas@codeaurora.org>, linux-wireless@vger.kernel.org, Muna Sinada <msinada@codeaurora.org>, Shashidhar Lakkavalli <slakkavalli@datto.com>, ath11k@lists.infradead.org

The ath11k_ce_alloc_ring() function returns error pointers on error, not
NULL.  The rest of the driver assumes that "pipe->src_ring" is either
valid or NULL so this patch introduces a temporary varaible to avoid
leaving it as an error pointer.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath11k/ce.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/ath/ath11k/ce.c
index a6572b414303..cdd40c8fc867 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -441,6 +441,7 @@ static int ath11k_ce_alloc_pipe(struct ath11k_base *ab, int ce_id)
 {
 	struct ath11k_ce_pipe *pipe = &ab->ce.ce_pipe[ce_id];
 	const struct ce_attr *attr = &host_ce_config_wlan[ce_id];
+	struct ath11k_ce_ring *ring;
 	int nentries;
 	int desc_sz;
 
@@ -450,24 +451,26 @@ static int ath11k_ce_alloc_pipe(struct ath11k_base *ab, int ce_id)
 		pipe->send_cb = ath11k_ce_send_done_cb;
 		nentries = roundup_pow_of_two(attr->src_nentries);
 		desc_sz = ath11k_hal_ce_get_desc_size(HAL_CE_DESC_SRC);
-		pipe->src_ring = ath11k_ce_alloc_ring(ab, nentries, desc_sz);
-		if (!pipe->src_ring)
-			return -ENOMEM;
+		ring = ath11k_ce_alloc_ring(ab, nentries, desc_sz);
+		if (IS_ERR(ring))
+			return PTR_ERR(ring);
+		pipe->src_ring = ring;
 	}
 
 	if (attr->dest_nentries) {
 		pipe->recv_cb = attr->recv_cb;
 		nentries = roundup_pow_of_two(attr->dest_nentries);
 		desc_sz = ath11k_hal_ce_get_desc_size(HAL_CE_DESC_DST);
-		pipe->dest_ring = ath11k_ce_alloc_ring(ab, nentries, desc_sz);
-
-		if (!pipe->dest_ring)
-			return -ENOMEM;
+		ring = ath11k_ce_alloc_ring(ab, nentries, desc_sz);
+		if (IS_ERR(ring))
+			return PTR_ERR(ring);
+		pipe->dest_ring = ring;
 
 		desc_sz = ath11k_hal_ce_get_desc_size(HAL_CE_DESC_DST_STATUS);
-		pipe->status_ring = ath11k_ce_alloc_ring(ab, nentries, desc_sz);
-		if (!pipe->status_ring)
-			return -ENOMEM;
+		ring = ath11k_ce_alloc_ring(ab, nentries, desc_sz);
+		if (IS_ERR(ring))
+			return PTR_ERR(ring);
+		pipe->status_ring = ring;
 	}
 
 	return 0;
-- 
2.11.0
