From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Nov 2011 14:09:32 +0000
Subject: [patch] ath6kl: unlock if ath6kl_cfg80211_connect() fails
Message-Id: <20111118140932.GB9685@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@qca.qualcomm.com>, Kevin Fang <kevin.fang@qca.qualcomm.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

There is an unlock missing on this error path.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/ath/ath6kl/cfg80211.c b/drivers/net/wireless/ath/ath6kl/cfg80211.c
index 0252604..5bb4060 100644
--- a/drivers/net/wireless/ath/ath6kl/cfg80211.c
+++ b/drivers/net/wireless/ath/ath6kl/cfg80211.c
@@ -427,8 +427,10 @@ static int ath6kl_cfg80211_connect(struct wiphy *wiphy, struct net_device *dev,
 
 	if (sme->ie && (sme->ie_len > 0)) {
 		status = ath6kl_set_assoc_req_ies(vif, sme->ie, sme->ie_len);
-		if (status)
+		if (status) {
+			up(&ar->sem);
 			return status;
+		}
 	}
 
 	if (test_bit(CONNECTED, &vif->flags) &&
