From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Dec 2015 13:15:23 +0000
Subject: [patch] cw1200: remove some dead code
Message-Id: <20151204131523.GB12792@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solomon Peachy <pizza@shaftnet.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

If the mode is NL80211_IFTYPE_UNSPECIFIED then we return success at the
start of the function so this condition is never true.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/st/cw1200/sta.c b/drivers/net/wireless/st/cw1200/sta.c
index 95a7fdb..06321c7 100644
--- a/drivers/net/wireless/st/cw1200/sta.c
+++ b/drivers/net/wireless/st/cw1200/sta.c
@@ -873,12 +873,6 @@ int cw1200_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
 	else
 		val32 = 0; /* disabled */
 
-	if (priv->mode = NL80211_IFTYPE_UNSPECIFIED) {
-		/* device is down, can _not_ set threshold */
-		ret = -ENODEV;
-		goto out;
-	}
-
 	if (priv->rts_threshold = value)
 		goto out;
 
