From: Colin King <colin.king@canonical.com>
Date: Mon, 18 Mar 2019 10:57:49 +0000
Subject: [PATCH] staging: ks7010: remove redundant auth_type check
Message-Id: <20190318105749.20098-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180711105911.30887-1-colin.king@canonical.com>
In-Reply-To: <20180711105911.30887-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Quytelda Kahja <quytelda@tamalin.org>, Jeremy Sowden <jeremy@azazel.net>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The range check on auth_type is redundant as there is a prior
check on the auth_type values and the only way the block is entered
is if auth_type is one of TYPE_PMK1, TYPE_GMK1 and TYPE_GMK1. Hence
the auth_type check can be removed.

Detected by static analysis with cppcheck.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/ks7010/ks_hostif.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
index 06ebea0be118..31a536791d5c 100644
--- a/drivers/staging/ks7010/ks_hostif.c
+++ b/drivers/staging/ks7010/ks_hostif.c
@@ -362,6 +362,8 @@ int hostif_data_indication_wpa(struct ks_wlan_private *priv,
 	     (auth_type = TYPE_GMK2 &&
 	      priv->wpa.group_suite = IW_AUTH_CIPHER_TKIP)) &&
 	    key->key_len) {
+		int ret;
+
 		netdev_dbg(priv->net_dev, "TKIP: protocol=%04X: size=%u\n",
 			   eth_proto, priv->rx_size);
 		/* MIC save */
@@ -369,15 +371,11 @@ int hostif_data_indication_wpa(struct ks_wlan_private *priv,
 		       (priv->rxp) + ((priv->rx_size) - sizeof(recv_mic)),
 		       sizeof(recv_mic));
 		priv->rx_size = priv->rx_size - sizeof(recv_mic);
-		if (auth_type > 0 && auth_type < 4) {	/* auth_type check */
-			int ret;
-
-			ret = michael_mic(key->rx_mic_key,
-					  priv->rxp, priv->rx_size,
-					  0, mic);
-			if (ret < 0)
-				return ret;
-		}
+
+		ret = michael_mic(key->rx_mic_key, priv->rxp, priv->rx_size,
+				  0, mic);
+		if (ret < 0)
+			return ret;
 		if (memcmp(mic, recv_mic, sizeof(mic)) != 0) {
 			now = jiffies;
 			mic_failure = &priv->wpa.mic_failure;
-- 
2.20.1
