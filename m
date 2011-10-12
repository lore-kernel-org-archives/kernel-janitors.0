From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2011 08:10:37 +0000
Subject: [patch] iwmc3200wifi: add a range check to iwm_cfg80211_get_key()
Message-Id: <20111012081036.GA32384@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <samuel.ortiz@intel.com>
Cc: Intel Linux Wireless <ilw@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that "key_index" is capped at 5 in nl80211_get_key()
but iwm->keys[] only has 4 elements.  I don't know if this is really
needed, but the other ->get_key() implementations seemed to check
for overflows so I've added a check here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/iwmc3200wifi/cfg80211.c b/drivers/net/wireless/iwmc3200wifi/cfg80211.c
index ed57e44..c42be81 100644
--- a/drivers/net/wireless/iwmc3200wifi/cfg80211.c
+++ b/drivers/net/wireless/iwmc3200wifi/cfg80211.c
@@ -187,13 +187,17 @@ static int iwm_cfg80211_get_key(struct wiphy *wiphy, struct net_device *ndev,
 						 struct key_params*))
 {
 	struct iwm_priv *iwm = ndev_to_iwm(ndev);
-	struct iwm_key *key = &iwm->keys[key_index];
+	struct iwm_key *key;
 	struct key_params params;
 
 	IWM_DBG_WEXT(iwm, DBG, "Getting key %d\n", key_index);
 
+	if (key_index >= IWM_NUM_KEYS)
+		return -ENOENT;
+
 	memset(&params, 0, sizeof(params));
 
+	key = &iwm->keys[key_index];
 	params.cipher = key->cipher;
 	params.key_len = key->key_len;
 	params.seq_len = key->seq_len;
