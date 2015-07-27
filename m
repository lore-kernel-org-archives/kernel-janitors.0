From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Jul 2015 08:11:11 +0000
Subject: [patch] mac80211: remove always true condition
Message-Id: <20150727081111.GB2937@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The outside if statement checks that IEEE80211_TX_INTFL_MLME_CONN_TX is
set so this condition is always true.  Checking twice upsets the static
checkers.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/mac80211/status.c b/net/mac80211/status.c
index 45628f3..8ba5832 100644
--- a/net/mac80211/status.c
+++ b/net/mac80211/status.c
@@ -515,7 +515,7 @@ static void ieee80211_report_used_skb(struct ieee80211_local *local,
 
 		if (!sdata) {
 			skb->dev = NULL;
-		} else if (info->flags & IEEE80211_TX_INTFL_MLME_CONN_TX) {
+		} else {
 			unsigned int hdr_size  				ieee80211_hdrlen(hdr->frame_control);
 
@@ -529,9 +529,6 @@ static void ieee80211_report_used_skb(struct ieee80211_local *local,
 				ieee80211_mgd_conn_tx_status(sdata,
 							     hdr->frame_control,
 							     acked);
-		} else {
-			/* we assign ack frame ID for the others */
-			WARN_ON(1);
 		}
 
 		rcu_read_unlock();
