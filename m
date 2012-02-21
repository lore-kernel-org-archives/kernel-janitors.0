From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Feb 2012 14:18:38 +0000
Subject: [patch] Staging: wlan-ng: memsetting the wrong amount of data
Message-Id: <20120221141838.GA7998@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

p80211item_pstr6_t is the size of "msg1.bssid" (16 bytes) but
msg1.bssid.data is type p80211pstr6_t and it is smaller (7 bytes).  We
had just set that memory to zeroes earlier and now we're writing over it
with 0xff because we're writing past the end of the struct.

I don't know if this actually causes a problem.  It may be that we
initialize the extra 0xff bytes correctly later.  But the current code
is obviously wrong and we should fix it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
index fb466f4..d518b31 100644
--- a/drivers/staging/wlan-ng/cfg80211.c
+++ b/drivers/staging/wlan-ng/cfg80211.c
@@ -356,7 +356,7 @@ int prism2_scan(struct wiphy *wiphy, struct net_device *dev,
 	msg1.msgcode = DIDmsg_dot11req_scan;
 	msg1.bsstype.data = P80211ENUM_bsstype_any;
 
-	memset(&(msg1.bssid.data), 0xFF, sizeof(p80211item_pstr6_t));
+	memset(&msg1.bssid.data, 0xFF, sizeof(msg1.bssid.data));
 	msg1.bssid.data.len = 6;
 
 	if (request->n_ssids > 0) {
