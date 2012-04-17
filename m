From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Apr 2012 20:37:31 +0000
Subject: [patch v2] Staging: rtl8192u: fix some memory corruption
Message-Id: <20120417203553.GA18206@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

When we received a command we incremented a stat counter depending on
the type of message.  The problem is there were 8 types of commands but
there were only 4 counters allocated so it corrupted memory past the
end of the rxcmdpkt[] array.

The fix is just to remove the counters because they aren't used.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
ACKed-by: Larry Finger <Larry.Finger@lwfinger.net>
---
v2:  fixed typo in commit message:  recieved => received

diff --git a/drivers/staging/rtl8192u/r8192U.h b/drivers/staging/rtl8192u/r8192U.h
index 9b81f26..43d459d 100644
--- a/drivers/staging/rtl8192u/r8192U.h
+++ b/drivers/staging/rtl8192u/r8192U.h
@@ -610,7 +610,6 @@ typedef struct Stats
 //	unsigned long rxnopointer;
 	unsigned long rxok;
 	unsigned long rxframgment;
-	unsigned long rxcmdpkt[4];		//08/05/08 amy rx cmd element txfeedback/bcn report/cfg set/query
 	unsigned long rxurberr;
 	unsigned long rxstaterr;
 	unsigned long received_rate_histogram[4][32];	//0: Total, 1:OK, 2:CRC, 3:ICV, 2007 07 03 cosa
diff --git a/drivers/staging/rtl8192u/r819xU_cmdpkt.c b/drivers/staging/rtl8192u/r819xU_cmdpkt.c
index 0cb28c7..9348f42 100644
--- a/drivers/staging/rtl8192u/r819xU_cmdpkt.c
+++ b/drivers/staging/rtl8192u/r819xU_cmdpkt.c
@@ -697,7 +697,6 @@ cmpk_message_handle_rx(
 	struct ieee80211_rx_stats *pstats)
 {
 //	u32			debug_level = DBG_LOUD;
-	struct r8192_priv *priv = ieee80211_priv(dev);
 	int			total_length;
 	u8			cmd_length, exe_cnt = 0;
 	u8			element_id;
@@ -779,9 +778,6 @@ cmpk_message_handle_rx(
 		// 2007/01/22 MH Add to display tx statistic.
 		//cmpk_DisplayTxStatistic(pAdapter);
 
-		/* 2007/03/09 MH Collect sidderent cmd element pkt num. */
-		priv->stats.rxcmdpkt[element_id]++;
-
 		total_length -= cmd_length;
 		pcmd_buff    += cmd_length;
 	}	/* while (total_length > 0) */
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

