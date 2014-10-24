From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 24 Oct 2014 08:15:34 +0000
Subject: [patch] ipw2x00: shift wrap bugs setting ->rt_tsf
Message-Id: <20141024081534.GA11140@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanislav Yakovlev <stas.yakovlev@gmail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The ->parent_tsf[] array holds u8 values.  It type promoted to int for
the shift operation so the "<< 24" shift operation can wrap.  The cast
needs to be done before the shift instead of after.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker work.  Untested.

diff --git a/drivers/net/wireless/ipw2x00/ipw2200.c b/drivers/net/wireless/ipw2x00/ipw2200.c
index edc3443..7e1f2af 100644
--- a/drivers/net/wireless/ipw2x00/ipw2200.c
+++ b/drivers/net/wireless/ipw2x00/ipw2200.c
@@ -7819,10 +7819,10 @@ static void ipw_handle_data_packet_monitor(struct ipw_priv *priv,
 
 	/* Zero the flags, we'll add to them as we go */
 	ipw_rt->rt_flags = 0;
-	ipw_rt->rt_tsf = (u64)(frame->parent_tsf[3] << 24 |
-			       frame->parent_tsf[2] << 16 |
-			       frame->parent_tsf[1] << 8  |
-			       frame->parent_tsf[0]);
+	ipw_rt->rt_tsf = (u64)frame->parent_tsf[3] << 24 |
+			      frame->parent_tsf[2] << 16 |
+			      frame->parent_tsf[1] << 8  |
+			      frame->parent_tsf[0];
 
 	/* Convert signal to DBM */
 	ipw_rt->rt_dbmsignal = antsignal;
@@ -8028,10 +8028,10 @@ static void ipw_handle_promiscuous_rx(struct ipw_priv *priv,
 
 	/* Zero the flags, we'll add to them as we go */
 	ipw_rt->rt_flags = 0;
-	ipw_rt->rt_tsf = (u64)(frame->parent_tsf[3] << 24 |
-			       frame->parent_tsf[2] << 16 |
-			       frame->parent_tsf[1] << 8  |
-			       frame->parent_tsf[0]);
+	ipw_rt->rt_tsf = (u64)frame->parent_tsf[3] << 24 |
+			      frame->parent_tsf[2] << 16 |
+			      frame->parent_tsf[1] << 8  |
+			      frame->parent_tsf[0];
 
 	/* Convert to DBM */
 	ipw_rt->rt_dbmsignal = signal;
