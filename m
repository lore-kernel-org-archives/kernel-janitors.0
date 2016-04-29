From: Jarno Rajahalme <jarno@ovn.org>
Date: Fri, 29 Apr 2016 21:17:30 +0000
Subject: [PATCH net 3/3] ip_tunnel_core: Scrub skb encap when decapsulating.
Message-Id: <1461964650-4779-3-git-send-email-jarno@ovn.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Later processing of the skb may get confused if the skb looks like it
has encapsulation after the tunnel headers have been pulled away.  As
an example the decapsulated GSO packet could be segmented if
transmitted to a virtio_net device since the device would not have the
tunnel GSO feature.  Furthermore, the segmentation may fail if the
segmentation code sees the skb as having encapsulation even after
decapsulation.

Signed-off-by: Jarno Rajahalme <jarno@ovn.org>
---
 include/linux/skbuff.h    | 4 ++++
 net/ipv4/ip_tunnel_core.c | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 15d0df9..93e08ab 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -484,6 +484,10 @@ enum {
 	SKB_GSO_TUNNEL_REMCSUM = 1 << 12,
 };
 
+#define SKB_GSO_ENCAP_MASK (SKB_GSO_GRE | SKB_GSO_GRE_CSUM | SKB_GSO_IPIP | \
+			    SKB_GSO_SIT | SKB_GSO_UDP_TUNNEL | \
+			    SKB_GSO_UDP_TUNNEL_CSUM | SKB_GSO_TUNNEL_REMCSUM)
+
 #if BITS_PER_LONG > 32
 #define NET_SKBUFF_DATA_USES_OFFSET 1
 #endif
diff --git a/net/ipv4/ip_tunnel_core.c b/net/ipv4/ip_tunnel_core.c
index 6165f30..2f6da7f 100644
--- a/net/ipv4/ip_tunnel_core.c
+++ b/net/ipv4/ip_tunnel_core.c
@@ -94,6 +94,15 @@ int iptunnel_pull_header(struct sk_buff *skb, int hdr_len, __be16 inner_proto,
 
 	skb_pull_rcsum(skb, hdr_len);
 
+	/* Remove tunnel encapsulation. */
+	skb->encapsulation = 0;
+	skb->inner_protocol = 0;
+	skb->inner_mac_header = 0;
+	skb->inner_network_header = 0;
+	skb->inner_transport_header = 0;
+	if (skb_is_gso(skb))
+		skb_shinfo(skb)->gso_type &= ~SKB_GSO_ENCAP_MASK;
+
 	if (inner_proto = htons(ETH_P_TEB)) {
 		struct ethhdr *eh;
 
-- 
2.7.4

