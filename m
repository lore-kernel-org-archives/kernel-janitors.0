From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Feb 2012 06:35:55 +0000
Subject: [patch 1/4] rndis_wlan: integer overflows in rndis_wlan_do_link_up_work()
Message-Id: <20120229063555.GC18031@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jussi Kivilinna <jussi.kivilinna@mbnet.fi>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

If "offset" is negative then we can get past this check:
	if (offset > CONTROL_BUFFER_SIZE)
Or if we pick a very high "req_ie_len" then we can get around the check:
	if (offset + req_ie_len > CONTROL_BUFFER_SIZE)

I made "resp_ie_len" and "req_ie_len" unsigned.  I don't know if it was
intentional that they were signed in the original.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/rndis_wlan.c b/drivers/net/wireless/rndis_wlan.c
index a330c69..6d8a986 100644
--- a/drivers/net/wireless/rndis_wlan.c
+++ b/drivers/net/wireless/rndis_wlan.c
@@ -2755,9 +2755,10 @@ static void rndis_wlan_do_link_up_work(struct usbnet *usbdev)
 	struct rndis_wlan_private *priv = get_rndis_wlan_priv(usbdev);
 	struct ndis_80211_assoc_info *info = NULL;
 	u8 bssid[ETH_ALEN];
-	int resp_ie_len, req_ie_len;
+	unsigned int resp_ie_len, req_ie_len;
+	unsigned int offset;
 	u8 *req_ie, *resp_ie;
-	int ret, offset;
+	int ret;
 	bool roamed = false;
 	bool match_bss;
 
@@ -2785,6 +2786,8 @@ static void rndis_wlan_do_link_up_work(struct usbnet *usbdev)
 		ret = get_association_info(usbdev, info, CONTROL_BUFFER_SIZE);
 		if (!ret) {
 			req_ie_len = le32_to_cpu(info->req_ie_length);
+			if (req_ie_len > CONTROL_BUFFER_SIZE)
+				req_ie_len = CONTROL_BUFFER_SIZE;
 			if (req_ie_len > 0) {
 				offset = le32_to_cpu(info->offset_req_ies);
 
@@ -2799,6 +2802,8 @@ static void rndis_wlan_do_link_up_work(struct usbnet *usbdev)
 			}
 
 			resp_ie_len = le32_to_cpu(info->resp_ie_length);
+			if (resp_ie_len > CONTROL_BUFFER_SIZE)
+				resp_ie_len = CONTROL_BUFFER_SIZE;
 			if (resp_ie_len > 0) {
 				offset = le32_to_cpu(info->offset_resp_ies);
 
