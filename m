From: Colin King <colin.king@canonical.com>
Date: Fri, 05 Oct 2018 21:56:09 +0000
Subject: [PATCH][next] ath10k: fix out of bound read on array ath10k_rates
Message-Id: <20181005215609.13935-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sriram R <srirrama@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An out-of-bounds read on array ath10k_rates is occurring because
the maximum number of elements is currently based on the size of
the array and not the number of elements in the array. Fix this
by using ARRAY_SIZE instead of sizeof.

Detected by CoverityScan, CID#1473918 ("Out-of-bounds read")

Fixes: f279294e9ee2 ("ath10k: add support for configuring management packet rate")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3933dd96da55..3564676e74e3 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -164,7 +164,7 @@ static int ath10k_mac_get_rate_hw_value(int bitrate)
 	if (ath10k_mac_bitrate_is_cck(bitrate))
 		hw_value_prefix = WMI_RATE_PREAMBLE_CCK << 6;
 
-	for (i = 0; i < sizeof(ath10k_rates); i++) {
+	for (i = 0; i < ARRAY_SIZE(ath10k_rates); i++) {
 		if (ath10k_rates[i].bitrate = bitrate)
 			return hw_value_prefix | ath10k_rates[i].hw_value;
 	}
-- 
2.17.1
