From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Sun, 03 Jul 2005 19:05:24 +0000
Subject: [KJ] [PATCH 2.6.13-rc1 15/17] fix sparse warnings (__nocast type)
Message-Id: <200507031905.24587.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_0bDyCP2XoMP9K6w"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_0bDyCP2XoMP9K6w
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Description:
	Fix the sparse warning "implicit cast to nocast type"
 
File/Subsystem: net/ipv4

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>
 

--Boundary-00=_0bDyCP2XoMP9K6w
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="net_ipv4.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="net_ipv4.patch"

 include/net/sock.h    |    2 +-
 include/net/tcp.h     |    3 ++-
 net/ipv4/tcp_output.c |    2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

Index: linux-2.6-git/net/ipv4/tcp_output.c
===================================================================
--- linux-2.6-git.orig/net/ipv4/tcp_output.c	2005-07-03 18:01:03.000000000 +0000
+++ linux-2.6-git/net/ipv4/tcp_output.c	2005-07-03 18:02:46.000000000 +0000
@@ -1285,7 +1285,7 @@
  * was unread data in the receive queue.  This behavior is recommended
  * by draft-ietf-tcpimpl-prob-03.txt section 3.10.  -DaveM
  */
-void tcp_send_active_reset(struct sock *sk, int priority)
+void tcp_send_active_reset(struct sock *sk, unsigned int __nocast priority)
 {
 	struct tcp_sock *tp = tcp_sk(sk);
 	struct sk_buff *skb;
Index: linux-2.6-git/include/net/tcp.h
===================================================================
--- linux-2.6-git.orig/include/net/tcp.h	2005-07-01 17:48:52.000000000 +0000
+++ linux-2.6-git/include/net/tcp.h	2005-07-03 18:08:36.000000000 +0000
@@ -853,7 +853,8 @@
 extern void tcp_send_partial(struct sock *);
 extern int  tcp_write_wakeup(struct sock *);
 extern void tcp_send_fin(struct sock *sk);
-extern void tcp_send_active_reset(struct sock *sk, int priority);
+extern void tcp_send_active_reset(struct sock *sk,
+                                  unsigned int __nocast priority);
 extern int  tcp_send_synack(struct sock *);
 extern void tcp_push_one(struct sock *, unsigned mss_now);
 extern void tcp_send_ack(struct sock *sk);
Index: linux-2.6-git/include/net/sock.h
===================================================================
--- linux-2.6-git.orig/include/net/sock.h	2005-07-03 18:19:02.000000000 +0000
+++ linux-2.6-git/include/net/sock.h	2005-07-03 18:19:58.000000000 +0000
@@ -1189,7 +1189,7 @@
 	return atomic_read(&sk->sk_wmem_alloc) < (sk->sk_sndbuf / 2);
 }
 
-static inline int gfp_any(void)
+static inline unsigned int __nocast gfp_any(void)
 {
 	return in_softirq() ? GFP_ATOMIC : GFP_KERNEL;
 }

--Boundary-00=_0bDyCP2XoMP9K6w
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_0bDyCP2XoMP9K6w--
