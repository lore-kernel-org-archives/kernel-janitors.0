From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Jun 2016 11:17:02 +0000
Subject: [patch 2/2] staging: ks7010: remove bogus NULL checks
Message-Id: <20160614111702.GB25457@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

enc->rx_seq[] and enc->key[] are arrays, not pointers and they can't be
NULL.  Let's remove these NULL checks.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/ks7010/ks_wlan_net.c b/drivers/staging/ks7010/ks_wlan_net.c
index 8ef0f11..fc93028 100644
--- a/drivers/staging/ks7010/ks_wlan_net.c
+++ b/drivers/staging/ks7010/ks_wlan_net.c
@@ -1910,11 +1910,8 @@ static int ks_wlan_set_encode_ext(struct net_device *dev,
 			priv->wpa.txkey = index;
 			commit |= SME_WEP_INDEX;
 		} else if (enc->ext_flags & IW_ENCODE_EXT_RX_SEQ_VALID) {
-			if (enc->rx_seq)
-				memcpy(&priv->wpa.key[index].rx_seq[0],
-				       enc->rx_seq, IW_ENCODE_SEQ_MAX_SIZE);
-			else
-				return -EINVAL;
+			memcpy(&priv->wpa.key[index].rx_seq[0],
+			       enc->rx_seq, IW_ENCODE_SEQ_MAX_SIZE);
 		}
 
 		memcpy(&priv->wpa.key[index].addr.sa_data[0],
@@ -1935,7 +1932,7 @@ static int ks_wlan_set_encode_ext(struct net_device *dev,
 				priv->reg.privacy_invoked = 0x01;
 				commit |= SME_WEP_FLAG;
 			}
-			if (enc->key && enc->key_len) {
+			if (enc->key_len) {
 				memcpy(&priv->wpa.key[index].key_val[0],
 				       &enc->key[0], enc->key_len);
 				priv->wpa.key[index].key_len = enc->key_len;
@@ -1947,7 +1944,7 @@ static int ks_wlan_set_encode_ext(struct net_device *dev,
 				priv->reg.privacy_invoked = 0x01;
 				commit |= SME_WEP_FLAG;
 			}
-			if (enc->key && enc->key_len = 32) {
+			if (enc->key_len = 32) {
 				memcpy(&priv->wpa.key[index].key_val[0],
 				       &enc->key[0], enc->key_len - 16);
 				priv->wpa.key[index].key_len 