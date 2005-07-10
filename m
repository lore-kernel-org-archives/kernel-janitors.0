From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 10 Jul 2005 23:18:09 +0000
Subject: [KJ] [PATCH 02/20] Fix "nocast type" warnings
Message-Id: <200507102318.09805.victor@cetuc.puc-rio.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Description:
    Fix the sparse warning "implicit cast to nocast type"

File/Subsystem:security/selinux

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--

 include/linux/security.h |    8 +++++---
 security/selinux/hooks.c |    6 ++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

Index: linux-git/security/selinux/hooks.c
=================================--- linux-git.orig/security/selinux/hooks.c	2005-07-08 12:06:49.000000000 +0000
+++ linux-git/security/selinux/hooks.c	2005-07-10 22:43:08.000000000 +0000
@@ -262,7 +262,8 @@
 }
 
 #ifdef CONFIG_SECURITY_NETWORK
-static int sk_alloc_security(struct sock *sk, int family, int priority)
+static int sk_alloc_security(struct sock *sk, int family,
+			     unsigned int __nocast priority)
 {
 	struct sk_security_struct *ssec;
 
@@ -3414,7 +3415,8 @@
 	return err;
 }
 
-static int selinux_sk_alloc_security(struct sock *sk, int family, int priority)
+static int selinux_sk_alloc_security(struct sock *sk, int family,
+				     unsigned int __nocast priority)
 {
 	return sk_alloc_security(sk, family, priority);
 }
Index: linux-git/include/linux/security.h
=================================--- linux-git.orig/include/linux/security.h	2005-07-08 12:06:49.000000000 +0000
+++ linux-git/include/linux/security.h	2005-07-10 22:43:08.000000000 +0000
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
+				    unsigned int __nocast priority)
 {
 	return security_ops->sk_alloc_security(sk, family, priority);
 }
@@ -2844,7 +2845,8 @@
 	return -ENOPROTOOPT;
 }
 
-static inline int security_sk_alloc(struct sock *sk, int family, int priority)
+static inline int security_sk_alloc(struct sock *sk, int family,
+				    unsigned int __nocast priority)
 {
 	return 0;
 }

--

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
