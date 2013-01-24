From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Jan 2013 06:40:00 +0000
Subject: [patch] cfg80211: off by one in ieee80211_bss()
Message-Id: <20130124064000.GB5611@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We do a:

	sprintf(buf, " Last beacon: %ums ago",
		elapsed_jiffies_msecs(bss->ts));

elapsed_jiffies_msecs() can return a 10 digit number so "buf" needs to
be 31 characters long.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index 01592d7..45f1618 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -1358,7 +1358,7 @@ ieee80211_bss(struct wiphy *wiphy, struct iw_request_info *info,
 						  &iwe, IW_EV_UINT_LEN);
 	}
 
-	buf = kmalloc(30, GFP_ATOMIC);
+	buf = kmalloc(31, GFP_ATOMIC);
 	if (buf) {
 		memset(&iwe, 0, sizeof(iwe));
 		iwe.cmd = IWEVCUSTOM;
