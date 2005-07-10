From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:19:45 +0000
Subject: [KJ] [PATCH 11/20] Fix "nocast type" warnings
Message-Id: <200507102319.45506.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:net/netlink/af_netlink.c

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 net/netlink/af_netlink.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

Index: linux-git/net/netlink/af_netlink.c
=================================--- linux-git.orig/net/netlink/af_netlink.c	2005-07-08 12:06:49.000000000 +0000
+++ linux-git/net/netlink/af_netlink.c	2005-07-10 22:43:11.000000000 +0000
@@ -648,7 +648,8 @@
 	sock_put(sk);
 }
 
-static inline struct sk_buff *netlink_trim(struct sk_buff *skb, int allocation)
+static inline struct sk_buff *netlink_trim(struct sk_buff *skb,
+					   unsigned int __nocast allocation)
 {
 	int delta;
 
@@ -717,7 +718,7 @@
 	int failure;
 	int congested;
 	int delivered;
-	int allocation;
+	unsigned int allocation;
 	struct sk_buff *skb, *skb2;
 };
 

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
