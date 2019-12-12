From: Colin King <colin.king@canonical.com>
Date: Thu, 12 Dec 2019 18:32:28 +0000
Subject: [PATCH][next] ath11k: fix memory leak on reg_info
Message-Id: <20191212183228.105993-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, Ganesh Sesetti <gseset@codeaurora.org>, Karthikeyan Periyasamy <periyasa@codeaurora.org>, John Crispin <john@phrozen.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently a return path is leaking the previously allocate reg_info. Fix
this by exiting via the return path mem_free.  Since the return value ret
is defaulted to 0, there is no need to re-assign ret to the 0 before
the goto.

Addresses-Coverity: ("Resource leak")
Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index b05642617b78..acb1c03d4f70 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -4522,7 +4522,7 @@ static int ath11k_reg_chan_list_event(struct ath11k_base *ab, struct sk_buff *sk
 	if (ab->default_regd[pdev_idx] && !ab->new_regd[pdev_idx] &&
 	    !memcmp((char *)ab->default_regd[pdev_idx]->alpha2,
 		    (char *)reg_info->alpha2, 2))
-		return 0;
+		goto mem_free;
 
 	/* Intersect new rules with default regd if a new country setting was
 	 * requested, i.e a default regd was already set during initialization
-- 
2.24.0
