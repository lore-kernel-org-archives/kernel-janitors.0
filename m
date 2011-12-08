From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Dec 2011 06:49:03 +0000
Subject: [patch] mac80211: unlock on error path in ieee80211_ibss_join()
Message-Id: <20111208064903.GA16735@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Simon <an.alexsimon@googlemail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We recently introduced a new return here but it needs an unlock first.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/mac80211/ibss.c b/net/mac80211/ibss.c
index 3f830ac..0fc9752 100644
--- a/net/mac80211/ibss.c
+++ b/net/mac80211/ibss.c
@@ -993,8 +993,10 @@ int ieee80211_ibss_join(struct ieee80211_sub_if_data *sdata,
 	if (params->channel_fixed) {
 		sdata->local->oper_channel = params->channel;
 		if (!ieee80211_set_channel_type(sdata->local, sdata,
-					       params->channel_type))
+					       params->channel_type)) {
+			mutex_unlock(&sdata->u.ibss.mtx);
 			return -EINVAL;
+		}
 	}
 
 	if (params->ie) {
