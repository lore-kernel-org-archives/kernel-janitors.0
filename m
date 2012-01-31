From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 31 Jan 2012 08:45:15 +0000
Subject: [patch] Staging: wlan-ng: cap the ssid length
Message-Id: <20120131084515.GA22039@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We're getting the ssid length from the scan here.  Let's cap it before
doing the memcpy().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is a static analysis patch.  I don't have the hardware to test it.

diff --git a/drivers/staging/wlan-ng/prism2mgmt.c b/drivers/staging/wlan-ng/prism2mgmt.c
index 6675c82..c3bb05d 100644
--- a/drivers/staging/wlan-ng/prism2mgmt.c
+++ b/drivers/staging/wlan-ng/prism2mgmt.c
@@ -406,6 +406,7 @@ int prism2mgmt_scan_results(wlandevice_t *wlandev, void *msgp)
 	/* SSID */
 	req->ssid.status = P80211ENUM_msgitem_status_data_ok;
 	req->ssid.data.len = le16_to_cpu(item->ssid.len);
+	req->ssid.data.len = min_t(u16, req->ssid.data.len, WLAN_BSSID_LEN);
 	memcpy(req->ssid.data.data, item->ssid.data, req->ssid.data.len);
 
 	/* supported rates */
