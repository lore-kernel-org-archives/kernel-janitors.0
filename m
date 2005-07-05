From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Tue, 05 Jul 2005 14:53:02 +0000
Subject: [KJ] [PATCH 2.6.13-rc1 14/17] fix sparse warnings [UPDATE 1/2]
Message-Id: <200507051453.02717.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507031904.44301.victor@cetuc.puc-rio.br>
In-Reply-To: <200507031904.44301.victor@cetuc.puc-rio.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 03/07/05 2005 14:00, Domen Puncer wrote:
> >  include/linux/security.h |    8 +++++---
> 
> How is this related to net/?
> 

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem: include/linux/security.h

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>



 include/linux/security.h |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

Index: linux-2.6-git/include/linux/security.h
=================================--- linux-2.6-git.orig/include/linux/security.h	2005-07-05 13:18:04.000000000 +0000
+++ linux-2.6-git/include/linux/security.h	2005-07-05 13:22:33.000000000 +0000
@@ -1240,7 +1240,7 @@
 	int (*socket_shutdown) (struct socket * sock, int how);
 	int (*socket_sock_rcv_skb) (struct sock * sk, struct sk_buff * skb);
 	int (*socket_getpeersec) (struct socket *sock, char __user *optval, int __user *optlen, unsigned len);
-	int (*sk_alloc_security) (struct sock *sk, int family, int priority);
+	int (*sk_alloc_security) (struct sock *sk, int family, unsigned int __nocast priority);
 	void (*sk_free_security) (struct sock *sk);
 #endif	/* CONFIG_SECURITY_NETWORK */
 };
@@ -2727,7 +2727,8 @@
 	return security_ops->socket_getpeersec(sock, optval, optlen, len);
 }
 
-static inline int security_sk_alloc(struct sock *sk, int family, int priority)
+static inline int security_sk_alloc(struct sock *sk, int family,
+                                    unsigned int __nocast priority)
 {
 	return security_ops->sk_alloc_security(sk, family, priority);
 }
@@ -2844,7 +2845,8 @@
 	return -ENOPROTOOPT;
 }
 
-static inline int security_sk_alloc(struct sock *sk, int family, int priority)
+static inline int security_sk_alloc(struct sock *sk, int family,
+                                    unsigned int __nocast priority)
 {
 	return 0;
 }

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
