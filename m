From: Colin King <colin.king@canonical.com>
Date: Tue, 06 Oct 2020 17:42:25 +0000
Subject: [PATCH][next] ath11k: fix memory leak of 'combinations'
Message-Id: <20201006174225.545919-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the error return path when 'limits' fails to allocate
does not free the memory allocated for 'combinations'. Fix this
by adding a kfree before returning.

Addresses-Coverity: ("Resource leak")
Fixes: 2626c269702e ("ath11k: add interface_modes to hw_params")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 3f63a7bd6b59..7f8dd47d2333 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6041,8 +6041,10 @@ static int ath11k_mac_setup_iface_combinations(struct ath11k *ar)
 	n_limits = 2;
 
 	limits = kcalloc(n_limits, sizeof(*limits), GFP_KERNEL);
-	if (!limits)
+	if (!limits) {
+		kfree(combinations);
 		return -ENOMEM;
+	}
 
 	limits[0].max = 1;
 	limits[0].types |= BIT(NL80211_IFTYPE_STATION);
-- 
2.27.0
