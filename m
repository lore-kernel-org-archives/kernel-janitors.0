From: Colin King <colin.king@canonical.com>
Date: Thu, 06 Aug 2020 11:33:26 +0000
Subject: [PATCH] wl1251, wlcore: fix spelling mistake "buld" -> "build"
Message-Id: <20200806113326.53779-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes in warning messages. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ti/wl1251/main.c | 2 +-
 drivers/net/wireless/ti/wlcore/cmd.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ti/wl1251/main.c b/drivers/net/wireless/ti/wl1251/main.c
index 480a8d084878..136a0d3b23c9 100644
--- a/drivers/net/wireless/ti/wl1251/main.c
+++ b/drivers/net/wireless/ti/wl1251/main.c
@@ -558,7 +558,7 @@ static int wl1251_build_null_data(struct wl1251 *wl)
 out:
 	dev_kfree_skb(skb);
 	if (ret)
-		wl1251_warning("cmd buld null data failed: %d", ret);
+		wl1251_warning("cmd build null data failed: %d", ret);
 
 	return ret;
 }
diff --git a/drivers/net/wireless/ti/wlcore/cmd.c b/drivers/net/wireless/ti/wlcore/cmd.c
index 6ef8fc9ae627..93424a1dffc9 100644
--- a/drivers/net/wireless/ti/wlcore/cmd.c
+++ b/drivers/net/wireless/ti/wlcore/cmd.c
@@ -1080,7 +1080,7 @@ int wl12xx_cmd_build_null_data(struct wl1271 *wl, struct wl12xx_vif *wlvif)
 out:
 	dev_kfree_skb(skb);
 	if (ret)
-		wl1271_warning("cmd buld null data failed %d", ret);
+		wl1271_warning("cmd build null data failed %d", ret);
 
 	return ret;
 
-- 
2.27.0
