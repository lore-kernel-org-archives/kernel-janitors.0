From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 May 2018 08:48:37 +0000
Subject: [PATCH] cfg80211: Use correct GFP_ mask in cfg80211_del_sta_sinfo()
Message-Id: <20180516084836.GB23043@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>, Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that we should use the passed in "gfp" instead of hard
coding GFP_KERNEL.  I looked at some of the callers and this would
probably be a bug for rtw_cfg80211_indicate_sta_disassoc() which uses
GFP_ATOMIC and a NULL "sinfo".

Fixes: 52539ca89f36 ("cfg80211: Expose TXQ stats and parameters to userspace")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index afbe5105bf7f..3eb645b81777 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -14644,7 +14644,7 @@ void cfg80211_del_sta_sinfo(struct net_device *dev, const u8 *mac_addr,
 	struct station_info *empty_sinfo = NULL;
 
 	if (!sinfo) {
-		empty_sinfo = kzalloc(sizeof(*empty_sinfo), GFP_KERNEL);
+		empty_sinfo = kzalloc(sizeof(*empty_sinfo), gfp);
 		if (!empty_sinfo)
 			return;
 		sinfo = empty_sinfo;
