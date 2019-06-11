From: Mao Wenan <maowenan@huawei.com>
Date: Tue, 11 Jun 2019 01:32:13 +0000
Subject: [PATCH -next v2] packet: remove unused variable 'status' in __packet_lookup_frame_in_block
Message-Id: <20190611013213.142745-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAF=yD-+g1bSGOubFUE8veZNvGiPy1oYsf+dFDd=hqXYD+k4g_Q@mail.gmail.com>
In-Reply-To: <CAF=yD-+g1bSGOubFUE8veZNvGiPy1oYsf+dFDd=hqXYD+k4g_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net
Cc: willemdebruijn.kernel@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

The variable 'status' in  __packet_lookup_frame_in_block() is never used since
introduction in commit f6fb8f100b80 ("af-packet: TPACKET_V3 flexible buffer
implementation."), we can remove it.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 v2: don't change parameter from 0 to TP_STATUS_KERNEL when calls 
 prb_retire_current_block(). 
---
 net/packet/af_packet.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index a29d66da7394..7fa847dcea30 100644
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
2.20.1
