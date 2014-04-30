From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Apr 2014 10:06:03 +0000
Subject: [patch] staging: rtl8192u: cleanup a switch statement
Message-Id: <20140430100603.GB20713@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The white space was all wrong here.  The case statements were indented
too far.  The if else blocks weren't indented at all.  There was a break
statement aligned with the else block and it confused my static checker
because "were curly braces intended" so that the break statement was
only on the else side?  Also I removed some commented out code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
index 2131912..9caf6fd 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
@@ -1903,20 +1903,17 @@ static void ieee80211_process_action(struct ieee80211_device *ieee,
 	}
 	tmp = *act;
 	act ++;
-	switch (tmp)
-	{
-		case ACT_CAT_BA:
-			if (*act = ACT_ADDBAREQ)
+	switch (tmp) {
+	case ACT_CAT_BA:
+		if (*act = ACT_ADDBAREQ)
 			ieee80211_rx_ADDBAReq(ieee, skb);
-			else if (*act = ACT_ADDBARSP)
+		else if (*act = ACT_ADDBARSP)
 			ieee80211_rx_ADDBARsp(ieee, skb);
-			else if (*act = ACT_DELBA)
+		else if (*act = ACT_DELBA)
 			ieee80211_rx_DELBA(ieee, skb);
-			break;
-		default:
-//			if (net_ratelimit())
-//			IEEE80211_DEBUG(IEEE80211_DL_BA, "unknown action frame(%d)\n", tmp);
-			break;
+		break;
+	default:
+		break;
 	}
 	return;
 
