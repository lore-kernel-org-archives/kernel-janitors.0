From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Aug 2016 18:43:39 +0000
Subject: [patch] ath9k: indent an if statement
Message-Id: <20160803184339.GB775@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Benjamin Berg <benjamin.berg@open-mesh.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, ath9k-devel@venema.h4ckr.net, kernel-janitors@vger.kernel.org

It looks like this code is correct, but it just needs to be indented a
bit.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/ath/ath9k/main.c b/drivers/net/wireless/ath/ath9k/main.c
index a394622..eb00724 100644
--- a/drivers/net/wireless/ath/ath9k/main.c
+++ b/drivers/net/wireless/ath/ath9k/main.c
@@ -919,7 +919,7 @@ static void ath9k_vif_iter_set_beacon(struct ath9k_vif_iter_data *iter_data,
 	} else {
 		if (iter_data->primary_beacon_vif->type != NL80211_IFTYPE_AP &&
 		    vif->type = NL80211_IFTYPE_AP)
-		iter_data->primary_beacon_vif = vif;
+			iter_data->primary_beacon_vif = vif;
 	}
 
 	iter_data->beacons = true;
