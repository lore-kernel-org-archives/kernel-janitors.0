From: Mike Shuey <shuey@purdue.edu>
Date: Thu, 21 May 2015 19:50:45 +0000
Subject: [PATCH 09/13] staging: lustre: lnet: lnet: remove dead code, fix checkpatch.pl issue
Message-Id: <1432237849-53947-23-git-send-email-shuey@purdue.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
In-Reply-To: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oleg.drokin@intel.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, lustre-deve@lists.lustre.org, Mike Shuey <shuey@purdue.edu>

Some debug code was left in the tree, blocked by a #if 0.  Also kicked out
checkpatch.pl warnings.  Remove it.

Signed-off-by: Mike Shuey <shuey@purdue.edu>
---
 drivers/staging/lustre/lnet/lnet/lib-msg.c |   17 -----------------
 1 files changed, 0 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/lustre/lnet/lnet/lib-msg.c b/drivers/staging/lustre/lnet/lnet/lib-msg.c
index 65d7595..55e6638 100644
--- a/drivers/staging/lustre/lnet/lnet/lib-msg.c
+++ b/drivers/staging/lustre/lnet/lnet/lib-msg.c
@@ -444,23 +444,6 @@ lnet_finalize(lnet_ni_t *ni, lnet_msg_t *msg, int status)
 
 	if (msg = NULL)
 		return;
-#if 0
-	CDEBUG(D_WARNING, "%s msg->%s Flags:%s%s%s%s%s%s%s%s%s%s%s txp %s rxp %s\n",
-	       lnet_msgtyp2str(msg->msg_type), libcfs_id2str(msg->msg_target),
-	       msg->msg_target_is_router ? "t" : "",
-	       msg->msg_routing ? "X" : "",
-	       msg->msg_ack ? "A" : "",
-	       msg->msg_sending ? "S" : "",
-	       msg->msg_receiving ? "R" : "",
-	       msg->msg_delayed ? "d" : "",
-	       msg->msg_txcredit ? "C" : "",
-	       msg->msg_peertxcredit ? "c" : "",
-	       msg->msg_rtrcredit ? "F" : "",
-	       msg->msg_peerrtrcredit ? "f" : "",
-	       msg->msg_onactivelist ? "!" : "",
-	       msg->msg_txpeer = NULL ? "<none>" : libcfs_nid2str(msg->msg_txpeer->lp_nid),
-	       msg->msg_rxpeer = NULL ? "<none>" : libcfs_nid2str(msg->msg_rxpeer->lp_nid));
-#endif
 	msg->msg_ev.status = status;
 
 	if (msg->msg_md != NULL) {
-- 
1.7.1

