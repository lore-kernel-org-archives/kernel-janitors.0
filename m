From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Oct 2018 08:09:20 +0000
Subject: [PATCH] ath10k: htt: remove some dead code
Message-Id: <20181011080920.GA15131@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Anilkumar Kolli <akolli@codeaurora.org>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

We added an unnecessary condition here in commit a904417fc876 ("ath10k:
add extended per sta tx statistics support").  "legacy_rate_idx" is a u8
so it can't be negative.  The caller doesn't pass negatives either.  I
have deleted this code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I didn't use the Fixes tag because it's not really a bug.

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index f2405258a6d3..13717a287848 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2680,8 +2680,6 @@ ath10k_accumulate_per_peer_tx_stats(struct ath10k *ar,
 		STATS_OP_FMT(RETRY).ht[1][ht_idx] += pstats->retry_pkts;
 	} else {
 		mcs = legacy_rate_idx;
-		if (mcs < 0)
-			return;
 
 		STATS_OP_FMT(SUCC).legacy[0][mcs] += pstats->succ_bytes;
 		STATS_OP_FMT(SUCC).legacy[1][mcs] += pstats->succ_pkts;
