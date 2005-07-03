From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 03 Jul 2005 19:04:44 +0000
Subject: [KJ] [PATCH 2.6.13-rc1 14/17] fix sparse warnings (__nocast type)
Message-Id: <200507031904.44301.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_MbDyCdNhvATOnmM"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_MbDyCdNhvATOnmM
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Description:
	Fix the sparse warning "implicit cast to nocast type"
 
File/Subsystem: net/core

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>
 

--Boundary-00=_MbDyCdNhvATOnmM
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="net_core.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="net_core.patch"

 include/linux/security.h |    8 +++++---
 include/linux/skbuff.h   |   29 ++++++++++++++++++-----------
 include/net/sock.h       |   16 ++++++++++------
 net/core/dev.c           |    2 +-
 net/core/skbuff.c        |   17 ++++++++++-------
 net/core/sock.c          |   11 +++++++----
 6 files changed, 51 insertions(+), 32 deletions(-)

Index: linux-2.6-git/net/core/skbuff.c
===================================================================
--- linux-2.6-git.orig/net/core/skbuff.c	2005-07-03 16:44:23.000000000 +0000
+++ linux-2.6-git/net/core/skbuff.c	2005-07-03 17:12:52.000000000 +0000
@@ -129,7 +129,7 @@
  *	Buffers may only be allocated from interrupts using a @gfp_mask of
  *	%GFP_ATOMIC.
  */
-struct sk_buff *alloc_skb(unsigned int size, int gfp_mask)
+struct sk_buff *alloc_skb(unsigned int size, unsigned int __nocast gfp_mask)
 {
 	struct sk_buff *skb;
 	u8 *data;
@@ -182,7 +182,8 @@
  *	%GFP_ATOMIC.
  */
 struct sk_buff *alloc_skb_from_cache(kmem_cache_t *cp,
-				     unsigned int size, int gfp_mask)
+				     unsigned int size,
+                                     unsigned int __nocast gfp_mask)
 {
 	struct sk_buff *skb;
 	u8 *data;
@@ -322,7 +323,7 @@
  *	%GFP_ATOMIC.
  */
 
-struct sk_buff *skb_clone(struct sk_buff *skb, int gfp_mask)
+struct sk_buff *skb_clone(struct sk_buff *skb, unsigned int __nocast gfp_mask)
 {
 	struct sk_buff *n = kmem_cache_alloc(skbuff_head_cache, gfp_mask);
 
@@ -462,7 +463,7 @@
  *	header is going to be modified. Use pskb_copy() instead.
  */
 
-struct sk_buff *skb_copy(const struct sk_buff *skb, int gfp_mask)
+struct sk_buff *skb_copy(const struct sk_buff *skb, unsigned int __nocast gfp_mask)
 {
 	int headerlen = skb->data - skb->head;
 	/*
@@ -501,7 +502,7 @@
  *	The returned buffer has a reference count of 1.
  */
 
-struct sk_buff *pskb_copy(struct sk_buff *skb, int gfp_mask)
+struct sk_buff *pskb_copy(struct sk_buff *skb, unsigned int __nocast gfp_mask)
 {
 	/*
 	 *	Allocate the copy buffer
@@ -559,7 +560,8 @@
  *	reloaded after call to this function.
  */
 
-int pskb_expand_head(struct sk_buff *skb, int nhead, int ntail, int gfp_mask)
+int pskb_expand_head(struct sk_buff *skb, int nhead, int ntail,
+                     unsigned int __nocast gfp_mask)
 {
 	int i;
 	u8 *data;
@@ -649,7 +651,8 @@
  *	only by netfilter in the cases when checksum is recalculated? --ANK
  */
 struct sk_buff *skb_copy_expand(const struct sk_buff *skb,
-				int newheadroom, int newtailroom, int gfp_mask)
+				int newheadroom, int newtailroom,
+                                unsigned int __nocast gfp_mask)
 {
 	/*
 	 *	Allocate the copy buffer
Index: linux-2.6-git/include/linux/skbuff.h
===================================================================
--- linux-2.6-git.orig/include/linux/skbuff.h	2005-07-03 16:44:23.000000000 +0000
+++ linux-2.6-git/include/linux/skbuff.h	2005-07-03 18:00:39.000000000 +0000
@@ -301,20 +301,26 @@
 #include <asm/system.h>
 
 extern void	       __kfree_skb(struct sk_buff *skb);
-extern struct sk_buff *alloc_skb(unsigned int size, int priority);
+extern struct sk_buff *alloc_skb(unsigned int size,
+                                 unsigned int __nocast priority);
 extern struct sk_buff *alloc_skb_from_cache(kmem_cache_t *cp,
-					    unsigned int size, int priority);
+					    unsigned int size,
+                                            unsigned int __nocast priority);
 extern void	       kfree_skbmem(struct sk_buff *skb);
-extern struct sk_buff *skb_clone(struct sk_buff *skb, int priority);
-extern struct sk_buff *skb_copy(const struct sk_buff *skb, int priority);
-extern struct sk_buff *pskb_copy(struct sk_buff *skb, int gfp_mask);
+extern struct sk_buff *skb_clone(struct sk_buff *skb,
+                                 unsigned int __nocast priority);
+extern struct sk_buff *skb_copy(const struct sk_buff *skb,
+                                unsigned int __nocast priority);
+extern struct sk_buff *pskb_copy(struct sk_buff *skb,
+                                 unsigned int __nocast gfp_mask);
 extern int	       pskb_expand_head(struct sk_buff *skb,
-					int nhead, int ntail, int gfp_mask);
+					int nhead, int ntail,
+                                        unsigned int __nocast gfp_mask);
 extern struct sk_buff *skb_realloc_headroom(struct sk_buff *skb,
 					    unsigned int headroom);
 extern struct sk_buff *skb_copy_expand(const struct sk_buff *skb,
 				       int newheadroom, int newtailroom,
-				       int priority);
+                                       unsigned int __nocast priority);
 extern struct sk_buff *		skb_pad(struct sk_buff *skb, int pad);
 #define dev_kfree_skb(a)	kfree_skb(a)
 extern void	      skb_over_panic(struct sk_buff *skb, int len,
@@ -465,7 +471,8 @@
  *
  *	NULL is returned on a memory allocation failure.
  */
-static inline struct sk_buff *skb_share_check(struct sk_buff *skb, int pri)
+static inline struct sk_buff *skb_share_check(struct sk_buff *skb,
+                                              unsigned int __nocast pri)
 {
 	might_sleep_if(pri & __GFP_WAIT);
 	if (skb_shared(skb)) {
@@ -1002,7 +1009,7 @@
  *	%NULL is returned in there is no free memory.
  */
 static inline struct sk_buff *__dev_alloc_skb(unsigned int length,
-					      int gfp_mask)
+					      unsigned int __nocast gfp_mask)
 {
 	struct sk_buff *skb = alloc_skb(length + 16, gfp_mask);
 	if (likely(skb))
@@ -1115,8 +1122,8 @@
  *	If there is no free memory -ENOMEM is returned, otherwise zero
  *	is returned and the old skb data released.
  */
-extern int __skb_linearize(struct sk_buff *skb, int gfp);
-static inline int skb_linearize(struct sk_buff *skb, int gfp)
+extern int __skb_linearize(struct sk_buff *skb, unsigned int __nocast gfp);
+static inline int skb_linearize(struct sk_buff *skb, unsigned int __nocast gfp)
 {
 	return __skb_linearize(skb, gfp);
 }
Index: linux-2.6-git/net/core/dev.c
===================================================================
--- linux-2.6-git.orig/net/core/dev.c	2005-07-01 17:48:54.000000000 +0000
+++ linux-2.6-git/net/core/dev.c	2005-07-03 17:11:06.000000000 +0000
@@ -1127,7 +1127,7 @@
 extern void skb_release_data(struct sk_buff *);
 
 /* Keep head the same: replace data */
-int __skb_linearize(struct sk_buff *skb, int gfp_mask)
+int __skb_linearize(struct sk_buff *skb, unsigned int __nocast gfp_mask)
 {
 	unsigned int size;
 	u8 *data;
Index: linux-2.6-git/net/core/sock.c
===================================================================
--- linux-2.6-git.orig/net/core/sock.c	2005-07-01 17:48:54.000000000 +0000
+++ linux-2.6-git/net/core/sock.c	2005-07-03 17:48:28.000000000 +0000
@@ -622,7 +622,8 @@
  *	@prot: struct proto associated with this new sock instance
  *	@zero_it: if we should zero the newly allocated sock
  */
-struct sock *sk_alloc(int family, int priority, struct proto *prot, int zero_it)
+struct sock *sk_alloc(int family, unsigned int __nocast priority,
+                      struct proto *prot, int zero_it)
 {
 	struct sock *sk = NULL;
 	kmem_cache_t *slab = prot->slab;
@@ -750,7 +751,8 @@
 /*
  * Allocate a skb from the socket's send buffer.
  */
-struct sk_buff *sock_wmalloc(struct sock *sk, unsigned long size, int force, int priority)
+struct sk_buff *sock_wmalloc(struct sock *sk, unsigned long size, int force,
+                             unsigned int __nocast priority)
 {
 	if (force || atomic_read(&sk->sk_wmem_alloc) < sk->sk_sndbuf) {
 		struct sk_buff * skb = alloc_skb(size, priority);
@@ -765,7 +767,8 @@
 /*
  * Allocate a skb from the socket's receive buffer.
  */ 
-struct sk_buff *sock_rmalloc(struct sock *sk, unsigned long size, int force, int priority)
+struct sk_buff *sock_rmalloc(struct sock *sk, unsigned long size, int force,
+                             unsigned int __nocast priority)
 {
 	if (force || atomic_read(&sk->sk_rmem_alloc) < sk->sk_rcvbuf) {
 		struct sk_buff *skb = alloc_skb(size, priority);
@@ -780,7 +783,7 @@
 /* 
  * Allocate a memory block from the socket's option memory buffer.
  */ 
-void *sock_kmalloc(struct sock *sk, int size, int priority)
+void *sock_kmalloc(struct sock *sk, int size, unsigned int __nocast priority)
 {
 	if ((unsigned)size <= sysctl_optmem_max &&
 	    atomic_read(&sk->sk_omem_alloc) + size < sysctl_optmem_max) {
Index: linux-2.6-git/include/net/sock.h
===================================================================
--- linux-2.6-git.orig/include/net/sock.h	2005-07-01 17:48:52.000000000 +0000
+++ linux-2.6-git/include/net/sock.h	2005-07-03 18:02:41.000000000 +0000
@@ -684,16 +684,17 @@
 #define bh_lock_sock(__sk)	spin_lock(&((__sk)->sk_lock.slock))
 #define bh_unlock_sock(__sk)	spin_unlock(&((__sk)->sk_lock.slock))
 
-extern struct sock		*sk_alloc(int family, int priority,
+extern struct sock		*sk_alloc(int family,
+                                          unsigned int __nocast priority,
 					  struct proto *prot, int zero_it);
 extern void			sk_free(struct sock *sk);
 
 extern struct sk_buff		*sock_wmalloc(struct sock *sk,
 					      unsigned long size, int force,
-					      int priority);
+					      unsigned int __nocast priority);
 extern struct sk_buff		*sock_rmalloc(struct sock *sk,
 					      unsigned long size, int force,
-					      int priority);
+					      unsigned int __nocast priority);
 extern void			sock_wfree(struct sk_buff *skb);
 extern void			sock_rfree(struct sk_buff *skb);
 
@@ -708,7 +709,8 @@
 						     unsigned long size,
 						     int noblock,
 						     int *errcode);
-extern void *sock_kmalloc(struct sock *sk, int size, int priority);
+extern void *sock_kmalloc(struct sock *sk, int size,
+                          unsigned int __nocast priority);
 extern void sock_kfree_s(struct sock *sk, void *mem, int size);
 extern void sk_send_sigurg(struct sock *sk);
 
@@ -1132,7 +1134,8 @@
 }
 
 static inline struct sk_buff *sk_stream_alloc_pskb(struct sock *sk,
-						   int size, int mem, int gfp)
+						   int size, int mem,
+                                                   unsigned int __nocast gfp)
 {
 	struct sk_buff *skb = alloc_skb(size + sk->sk_prot->max_header, gfp);
 
@@ -1152,7 +1155,8 @@
 }
 
 static inline struct sk_buff *sk_stream_alloc_skb(struct sock *sk,
-						  int size, int gfp)
+						  int size,
+                                                  unsigned int __nocast gfp)
 {
 	return sk_stream_alloc_pskb(sk, size, 0, gfp);
 }
Index: linux-2.6-git/include/linux/security.h
===================================================================
--- linux-2.6-git.orig/include/linux/security.h	2005-07-03 17:48:09.000000000 +0000
+++ linux-2.6-git/include/linux/security.h	2005-07-03 17:57:41.000000000 +0000
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

--Boundary-00=_MbDyCdNhvATOnmM
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_MbDyCdNhvATOnmM--
