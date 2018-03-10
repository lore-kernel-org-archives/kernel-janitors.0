From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Mar 2018 21:32:43 +0000
Subject: [PATCH 2/3] wlcore: Return directly after a failed kzalloc() in wl1271_acx_sta_rate_policies()
Message-Id: <8ef461f4-5103-9181-b68d-e31720206ee3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b5db0825-394a-1d6d-351a-43be14e4c6b4@users.sourceforge.net>
In-Reply-To: <b5db0825-394a-1d6d-351a-43be14e4c6b4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Mar 2018 22:00:31 +0100

Return directly after a call of the function "kzalloc" failed
at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/wireless/ti/wlcore/acx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ti/wlcore/acx.c b/drivers/net/wireless/ti/wlcore/acx.c
index 6991fee8fe61..1cc5bba670e1 100644
--- a/drivers/net/wireless/ti/wlcore/acx.c
+++ b/drivers/net/wireless/ti/wlcore/acx.c
@@ -743,11 +743,8 @@ int wl1271_acx_sta_rate_policies(struct wl1271 *wl, struct wl12xx_vif *wlvif)
 	wl1271_debug(DEBUG_ACX, "acx rate policies");
 
 	acx = kzalloc(sizeof(*acx), GFP_KERNEL);
-
-	if (!acx) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!acx)
+		return -ENOMEM;
 
 	wl1271_debug(DEBUG_ACX, "basic_rate: 0x%x, full_rate: 0x%x",
 		wlvif->basic_rate, wlvif->rate_set);
-- 
2.16.2

