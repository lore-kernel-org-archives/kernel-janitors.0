From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 12 Jul 2012 23:46:56 +0000
Subject: [nf-next:mmap-netlink 62/68] net/netlink/af_netlink.c:545:6: sparse: symbol 'netlink_ring_setup_skb'
Message-Id: <20120712234656.GC5608@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="gBBFr7Ir9EOA20Yy"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Patrick,

There are new sparse warnings show up in

tree:   git://150.214.188.80/nf-next mmap-netlink
head:   c7e7243d0b69e2323dde057c28f1102d00e5a3c6
commit: 23c9e8b9464cfbf148b3ba911f5a67b16bc94aa8 [62/68] netlink: add mmap'ed netlink helper functions

All sparse warnings:

  net/netlink/af_netlink.c:201:39: sparse: incorrect type in return expression (different modifiers)
  net/netlink/af_netlink.c:201:39:    expected struct page [pure] *
  net/netlink/af_netlink.c:201:39:    got struct page *
  net/netlink/af_netlink.c:203:24: sparse: incorrect type in return expression (different modifiers)
  net/netlink/af_netlink.c:203:24:    expected struct page [pure] *
  net/netlink/af_netlink.c:203:24:    got struct page *
  net/netlink/af_netlink.c:404:38: sparse: incorrect type in assignment (different modifiers)
  net/netlink/af_netlink.c:404:38:    expected struct page *page
  net/netlink/af_netlink.c:404:38:    got struct page [pure] *
+ net/netlink/af_netlink.c:545:6: sparse: symbol 'netlink_ring_setup_skb' was not declared. Should it be static?
  net/netlink/af_netlink.c:999:56: sparse: incorrect type in argument 1 (different address spaces)
  net/netlink/af_netlink.c:999:56:    expected void const *<noident>
  net/netlink/af_netlink.c:999:56:    got struct listeners [noderef] <asn:4>*listeners
  net/netlink/af_netlink.c:812:38: sparse: dereference of noderef expression
  net/netlink/af_netlink.c:422:13: warning: 'netlink_frame_flush_dcache' defined but not used [-Wunused-function]

vim +545 net/netlink/af_netlink.c
   542		return (struct nl_mmap_hdr *)(skb->head - NL_MMAP_HDRLEN);
   543	}
   544	
 > 545	void netlink_ring_setup_skb(struct sk_buff *skb, struct sock *sk,
   546				    struct netlink_ring *ring, struct nl_mmap_hdr *hdr)
   547	{
   548		unsigned int size;

Please consider folding the attached diff :-)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

--gBBFr7Ir9EOA20Yy
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-23c9e8b.diff"

diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index 801eeec..a64011d 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -542,7 +542,7 @@ static struct nl_mmap_hdr *netlink_mmap_hdr(struct sk_buff *skb)
 	return (struct nl_mmap_hdr *)(skb->head - NL_MMAP_HDRLEN);
 }
 
-void netlink_ring_setup_skb(struct sk_buff *skb, struct sock *sk,
+static void netlink_ring_setup_skb(struct sk_buff *skb, struct sock *sk,
 			    struct netlink_ring *ring, struct nl_mmap_hdr *hdr)
 {
 	unsigned int size;

--gBBFr7Ir9EOA20Yy--
