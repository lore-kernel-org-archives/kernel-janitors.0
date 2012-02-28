From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Feb 2012 08:21:46 +0000
Subject: [patch] Staging: wlan-ng: still setting wrong data
Message-Id: <20120228082146.GA31511@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In commit 1ca1a92cc6 "Staging: wlan-ng: memsetting the wrong amount of
data" I changed the code so we didn't memset() past the end of the
msg1.bssid.data[] array.  Walter Harms noticed that it was weird that
we were setting the len to 6 when there were 7 elements in the array.
Pavel Roskin pointed out that the intent of the code was actually to
memset() msg1.bssid.data.data[] which is a 6 character array.

Reported-by: Walter Harms <wharms@bfs.de>
Reported-by: Pavel Roskin <proski@gnu.org>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I don't have a way to test this, but it does make more sense than the
original.

diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
index d518b31..4cd3ba5 100644
--- a/drivers/staging/wlan-ng/cfg80211.c
+++ b/drivers/staging/wlan-ng/cfg80211.c
@@ -356,7 +356,7 @@ int prism2_scan(struct wiphy *wiphy, struct net_device *dev,
 	msg1.msgcode = DIDmsg_dot11req_scan;
 	msg1.bsstype.data = P80211ENUM_bsstype_any;
 
-	memset(&msg1.bssid.data, 0xFF, sizeof(msg1.bssid.data));
+	memset(&msg1.bssid.data.data, 0xFF, sizeof(msg1.bssid.data.data));
 	msg1.bssid.data.len = 6;
 
 	if (request->n_ssids > 0) {
