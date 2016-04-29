From: Jarno Rajahalme <jarno@ovn.org>
Date: Fri, 29 Apr 2016 21:17:29 +0000
Subject: [PATCH net 2/3] udp_offload: Set encapsulation before inner completes.
Message-Id: <1461964650-4779-2-git-send-email-jarno@ovn.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

UDP tunnel segmentation code relies on the inner offsets being set for
an UDP tunnel GSO packet.  The inner *_complete() functions will set
the inner offsets only if the encapsulation is set before calling
them, but udp_gro_complete() set it only after the inner *_complete()
functions were done.

Also, remove the setting of the inner_mac_header in udp_gro_complete()
as it was wrongly set to the beginning of the UDP tunnel header rather
than the inner MAC header.

Signed-off-by: Jarno Rajahalme <jarno@ovn.org>
---
 net/ipv4/udp_offload.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/udp_offload.c b/net/ipv4/udp_offload.c
index 0ed2daf..e330c0e 100644
--- a/net/ipv4/udp_offload.c
+++ b/net/ipv4/udp_offload.c
@@ -399,6 +399,11 @@ int udp_gro_complete(struct sk_buff *skb, int nhoff)
 
 	uh->len = newlen;
 
+	/* Set encapsulation before calling into inner gro_complete() functions
+	 * to make them set up the inner offsets.
+	 */
+	skb->encapsulation = 1;
+
 	rcu_read_lock();
 
 	uo_priv = rcu_dereference(udp_offload_base);
@@ -421,9 +426,6 @@ int udp_gro_complete(struct sk_buff *skb, int nhoff)
 	if (skb->remcsum_offload)
 		skb_shinfo(skb)->gso_type |= SKB_GSO_TUNNEL_REMCSUM;
 
-	skb->encapsulation = 1;
-	skb_set_inner_mac_header(skb, nhoff + sizeof(struct udphdr));
-
 	return err;
 }
 
-- 
2.7.4

