From: Colin King <colin.king@canonical.com>
Date: Thu, 12 Dec 2019 19:10:44 +0000
Subject: [PATCH][next] ath11k: fix uninitialized variable radioup
Message-Id: <20191212191044.107544-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, Ganesh Sesetti <gseset@codeaurora.org>, Karthikeyan Periyasamy <periyasa@codeaurora.org>, John Crispin <john@phrozen.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable radioup is not uninitalized so it may contain a garbage
value and hence the detection of a radio that is not up is buggy.
Fix this by initializing it to zero.

Addresses-Coverity: ("Uninitalized scalar variable")
Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath11k/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/debug.c b/drivers/net/wireless/ath/ath11k/debug.c
index c27fffd13a5d..34b960453edc 100644
--- a/drivers/net/wireless/ath/ath11k/debug.c
+++ b/drivers/net/wireless/ath/ath11k/debug.c
@@ -541,7 +541,7 @@ static ssize_t ath11k_write_simulate_fw_crash(struct file *file,
 	struct ath11k *ar = ab->pdevs[0].ar;
 	char buf[32] = {0};
 	ssize_t rc;
-	int i, ret, radioup;
+	int i, ret, radioup = 0;
 
 	for (i = 0; i < ab->num_radios; i++) {
 		pdev = &ab->pdevs[i];
-- 
2.24.0
