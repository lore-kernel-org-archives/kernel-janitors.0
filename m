From: Colin King <colin.king@canonical.com>
Date: Wed, 28 Mar 2018 17:40:27 +0000
Subject: [PATCH][next] wil6210: fix potential null dereference of ndev before null check
Message-Id: <20180328174027.31551-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maya Erez <merez@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, wil6210@qti.qualcomm.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer ndev is being dereferenced before it is being null checked,
hence there is a potential null pointer deference. Fix this by only
dereferencing ndev after it has been null checked

Detected by CoverityScan, CID#1467010 ("Dereference before null check")

Fixes: e00243fab84b ("wil6210: infrastructure for multiple virtual interfaces")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/wil6210/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/wil6210/main.c b/drivers/net/wireless/ath/wil6210/main.c
index a4b413e8d55a..82aec6b06d09 100644
--- a/drivers/net/wireless/ath/wil6210/main.c
+++ b/drivers/net/wireless/ath/wil6210/main.c
@@ -391,7 +391,7 @@ static void wil_fw_error_worker(struct work_struct *work)
 	struct wil6210_priv *wil = container_of(work, struct wil6210_priv,
 						fw_error_worker);
 	struct net_device *ndev = wil->main_ndev;
-	struct wireless_dev *wdev = ndev->ieee80211_ptr;
+	struct wireless_dev *wdev;
 
 	wil_dbg_misc(wil, "fw error worker\n");
 
@@ -399,6 +399,7 @@ static void wil_fw_error_worker(struct work_struct *work)
 		wil_info(wil, "No recovery - interface is down\n");
 		return;
 	}
+	wdev = ndev->ieee80211_ptr;
 
 	/* increment @recovery_count if less then WIL6210_FW_RECOVERY_TO
 	 * passed since last recovery attempt
-- 
2.15.1

