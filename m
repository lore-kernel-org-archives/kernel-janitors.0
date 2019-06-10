From: Mao Wenan <maowenan@huawei.com>
Date: Mon, 10 Jun 2019 11:58:31 +0000
Subject: [PATCH -next] packet: remove unused variable 'status' in __packet_lookup_frame_in_block
Message-Id: <20190610115831.175710-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

The variable 'status' in  __packet_lookup_frame_in_block() is never used since
introduction in commit f6fb8f100b80 ("af-packet: TPACKET_V3 flexible buffer
implementation."), we can remove it.
And when __packet_lookup_frame_in_block() calls prb_retire_current_block(), 
it can pass macro TP_STATUS_KERNEL instead of 0.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 net/packet/af_packet.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index a29d66d..fb1a79c 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -1003,7 +1003,6 @@ static void prb_fill_curr_block(char *curr,
 /* Assumes caller has the sk->rx_queue.lock */
 static void *__packet_lookup_frame_in_block(struct packet_sock *po,
 					    struct sk_buff *skb,
-						int status,
 					    unsigned int len
 					    )
 {
@@ -1046,7 +1045,7 @@ static void *__packet_lookup_frame_in_block(struct packet_sock *po,
 	}
 
 	/* Ok, close the current block */
-	prb_retire_current_block(pkc, po, 0);
+	prb_retire_current_block(pkc, po, TP_STATUS_KERNEL);
 
 	/* Now, try to dispatch the next block */
 	curr = (char *)prb_dispatch_next_block(pkc, po);
@@ -1075,7 +1074,7 @@ static void *packet_current_rx_frame(struct packet_sock *po,
 					po->rx_ring.head, status);
 		return curr;
 	case TPACKET_V3:
-		return __packet_lookup_frame_in_block(po, skb, status, len);
+		return __packet_lookup_frame_in_block(po, skb, len);
 	default:
 		WARN(1, "TPACKET version not supported\n");
 		BUG();
-- 
2.7.4
