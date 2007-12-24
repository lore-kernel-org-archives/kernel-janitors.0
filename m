From: Julia Lawall <julia@diku.dk>
Date: Mon, 24 Dec 2007 14:51:00 +0000
Subject: [PATCH 37/38] net/sctp: Use time_before, time_before_eq, etc.
Message-Id: <Pine.LNX.4.64.0712241550340.23999@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vladislav.yasevich@hp.com, sri@us.ibm.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The functions time_before, time_before_eq, time_after, and time_after_eq
are more robust for comparing jiffies against other values.

A simplified version of the semantic patch making this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@ change_compare_np @
expression E;
@@

(
- jiffies <= E
+ time_before_eq(jiffies,E)
|
- jiffies >= E
+ time_after_eq(jiffies,E)
|
- jiffies < E
+ time_before(jiffies,E)
|
- jiffies > E
+ time_after(jiffies,E)
)

@ include depends on change_compare_np @
@@

#include <linux/jiffies.h>

@ no_include depends on !include && change_compare_np @
@@

  #include <linux/...>
+ #include <linux/jiffies.h>
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -r -u -p a/net/sctp/outqueue.c b/net/sctp/outqueue.c
--- a/net/sctp/outqueue.c	2007-11-15 15:09:38.000000000 +0100
+++ b/net/sctp/outqueue.c	2007-12-23 20:46:36.000000000 +0100
@@ -50,6 +50,7 @@
 #include <linux/list.h>   /* For struct list_head */
 #include <linux/socket.h>
 #include <linux/ip.h>
+#include <linux/jiffies.h>
 #include <net/sock.h>	  /* For skb_set_owner_w */
 
 #include <net/sctp/sctp.h>
@@ -425,7 +426,8 @@ void sctp_retransmit_mark(struct sctp_ou
 			 * retransmitting due to T3 timeout.
 			 */
 			if (reason = SCTP_RTXR_T3_RTX &&
-			    (jiffies - chunk->sent_at) < transport->last_rto)
+			    time_before(jiffies,
+					chunk->sent_at + transport->last_rto))
 				continue;
 
 			/* RFC 2960 6.2.1 Processing a Received SACK
diff -r -u -p a/net/sctp/transport.c b/net/sctp/transport.c
--- a/net/sctp/transport.c	2007-11-15 15:09:39.000000000 +0100
+++ b/net/sctp/transport.c	2007-12-23 20:46:58.000000000 +0100
@@ -50,6 +50,7 @@
 
 #include <linux/types.h>
 #include <linux/random.h>
+#include <linux/jiffies.h>
 #include <net/sctp/sctp.h>
 #include <net/sctp/sm.h>
 
@@ -525,8 +526,9 @@ void sctp_transport_lower_cwnd(struct sc
 		 * congestion indications more than once every window of
 		 * data (or more loosely more than once every round-trip time).
 		 */
-		if ((jiffies - transport->last_time_ecne_reduced) >
-		    transport->rtt) {
+		if (time_after(jiffies,
+			       transport->last_time_ecne_reduced +
+			       transport->rtt)) {
 			transport->ssthresh = max(transport->cwnd/2,
 						  4*transport->asoc->pathmtu);
 			transport->cwnd = transport->ssthresh;
@@ -543,7 +545,8 @@ void sctp_transport_lower_cwnd(struct sc
 		 * to be done every RTO interval, we do it every hearbeat
 		 * interval.
 		 */
-		if ((jiffies - transport->last_time_used) > transport->rto)
+		if (time_after(jiffies,
+			       transport->last_time_used + transport->rto))
 			transport->cwnd = max(transport->cwnd/2,
 						 4*transport->asoc->pathmtu);
 		break;
