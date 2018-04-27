From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 27 Apr 2018 11:21:30 +0000
Subject: [PATCH] rsi: fix a bug in rsi_hal_key_config()
Message-Id: <20180427112130.GA27655@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Prameela Rani Garnepudi <prameela.j04cs@gmail.com>
Cc: Amitkumar Karwar <amit.karwar@redpinesignals.com>, Karun Eagalapati <karun256@gmail.com>, Siva Rebbagondla <siva.rebbagondla@redpinesignals.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that the end of this function is dead code.  I'm pretty
sure that this return needs to be changed to only return on error.

Fixes: 4fd6c4762f37 ("rsi: roaming enhancements")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/rsi/rsi_91x_mac80211.c b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
index 766d874cc6e2..80e7f4f4f188 100644
--- a/drivers/net/wireless/rsi/rsi_91x_mac80211.c
+++ b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
@@ -911,14 +911,14 @@ static int rsi_hal_key_config(struct ieee80211_hw *hw,
 		}
 	}
 
-	return rsi_hal_load_key(adapter->priv,
-				key->key,
-				key->keylen,
-				key_type,
-				key->keyidx,
-				key->cipher,
-				sta_id,
-				vif);
+	status = rsi_hal_load_key(adapter->priv,
+				  key->key,
+				  key->keylen,
+				  key_type,
+				  key->keyidx,
+				  key->cipher,
+				  sta_id,
+				  vif);
 	if (status)
 		return status;
 
