From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 05 Dec 2018 07:59:03 +0000
Subject: [PATCH] wil6210: remove set but not used variable 'wdev'
Message-Id: <1543996743-137124-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536669139-14848-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536669139-14848-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maya Erez <merez@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, wil6210@qti.qualcomm.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/ath/wil6210/main.c: In function '_wil6210_disconnect':
drivers/net/wireless/ath/wil6210/main.c:407:23: warning:
 variable 'wdev' set but not used [-Wunused-but-set-variable]

It never used since commit ("e1b43407c034 wil6210: refactor disconnect flow")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/ath/wil6210/main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/wil6210/main.c b/drivers/net/wireless/ath/wil6210/main.c
index ba6a2ee..5b7de00 100644
--- a/drivers/net/wireless/ath/wil6210/main.c
+++ b/drivers/net/wireless/ath/wil6210/main.c
@@ -404,7 +404,6 @@ static void _wil6210_disconnect(struct wil6210_vif *vif, const u8 *bssid,
 {
 	struct wil6210_priv *wil;
 	struct net_device *ndev;
-	struct wireless_dev *wdev;
 	int cid = -ENOENT;
 
 	if (unlikely(!vif))
@@ -412,7 +411,6 @@ static void _wil6210_disconnect(struct wil6210_vif *vif, const u8 *bssid,
 
 	wil = vif_to_wil(vif);
 	ndev = vif_to_ndev(vif);
-	wdev = vif_to_wdev(vif);
 
 	might_sleep();
 	wil_info(wil, "disconnect bssid=%pM, reason=%d\n", bssid, reason_code);
