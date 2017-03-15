From: Colin King <colin.king@canonical.com>
Date: Wed, 15 Mar 2017 16:36:41 +0000
Subject: [PATCH] ath10k: remove redundant check of len with buf_len
Message-Id: <20170315163641.17052-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check of len > buf_len is redundant as len is initialized
to 0 and buf_len to 4096, so this comparison is always false.
Remove it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath10k/debug.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index fb0ade3..b499a09 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -249,9 +249,6 @@ static ssize_t ath10k_read_wmi_services(struct file *file,
 
 	mutex_lock(&ar->conf_mutex);
 
-	if (len > buf_len)
-		len = buf_len;
-
 	spin_lock_bh(&ar->data_lock);
 	for (i = 0; i < WMI_SERVICE_MAX; i++) {
 		enabled = test_bit(i, ar->wmi.svc_map);
-- 
2.10.2

