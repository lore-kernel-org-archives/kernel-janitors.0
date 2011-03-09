From: mcsim.planeta@gmail.com
Date: Wed, 09 Mar 2011 16:37:17 +0000
Subject: [PATCH] Replaces dprintk with pr_debug
Message-Id: <4d77ac3d.815bdf0a.1fb5.6f9c@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1299169617-27965-1-git-send-email-mcsim.planeta@gmail.com>
In-Reply-To: <1299169617-27965-1-git-send-email-mcsim.planeta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Maksym Planeta <mcsim.planeta@gmail.com>


Signed-off-by: Maksym Planeta <mcsim.planeta@gmail.com>
---
 net/llc/af_llc.c   |   22 ++++++++--------------
 net/llc/llc_c_ev.c |   14 ++++----------
 net/llc/llc_conn.c |    8 +-------
 3 files changed, 13 insertions(+), 31 deletions(-)

diff --git a/net/llc/af_llc.c b/net/llc/af_llc.c
index dfd3a64..088b471 100644
--- a/net/llc/af_llc.c
+++ b/net/llc/af_llc.c
@@ -42,12 +42,6 @@ static int llc_ui_wait_for_conn(struct sock *sk, long timeout);
 static int llc_ui_wait_for_disc(struct sock *sk, long timeout);
 static int llc_ui_wait_for_busy_core(struct sock *sk, long timeout);
 
-#if 0
-#define dprintk(args...) printk(KERN_DEBUG args)
-#else
-#define dprintk(args...)
-#endif
-
 /* Maybe we'll add some more in the future. */
 #define LLC_CMSG_PKTINFO	1
 
@@ -194,7 +188,7 @@ static int llc_ui_release(struct socket *sock)
 	sock_hold(sk);
 	lock_sock(sk);
 	llc = llc_sk(sk);
-	dprintk("%s: closing local(%02X) remote(%02X)\n", __func__,
+	pr_debug("%s: closing local(%02X) remote(%02X)\n", __func__,
 		llc->laddr.lsap, llc->daddr.lsap);
 	if (!llc_send_disc(sk))
 		llc_ui_wait_for_disc(sk, sk->sk_rcvtimeo);
@@ -309,7 +303,7 @@ static int llc_ui_bind(struct socket *sock, struct sockaddr *uaddr, int addrlen)
 	struct llc_sap *sap;
 	int rc = -EINVAL;
 
-	dprintk("%s: binding %02X\n", __func__, addr->sllc_sap);
+	pr_debug("%s: binding %02X\n", __func__, addr->sllc_sap);
 	if (unlikely(!sock_flag(sk, SOCK_ZAPPED) || addrlen != sizeof(*addr)))
 		goto out;
 	rc = -EAFNOSUPPORT;
@@ -464,7 +458,7 @@ static int llc_ui_connect(struct socket *sock, struct sockaddr *uaddr,
 	rc = llc_establish_connection(sk, llc->dev->dev_addr,
 				      addr->sllc_mac, addr->sllc_sap);
 	if (rc) {
-		dprintk("%s: llc_ui_send_conn failed :-(\n", __func__);
+		pr_debug("%s: llc_ui_send_conn failed :-(\n", __func__);
 		sock->state  = SS_UNCONNECTED;
 		sk->sk_state = TCP_CLOSE;
 		goto out;
@@ -650,7 +644,7 @@ static int llc_ui_accept(struct socket *sock, struct socket *newsock, int flags)
 	struct sk_buff *skb;
 	int rc = -EOPNOTSUPP;
 
-	dprintk("%s: accepting on %02X\n", __func__,
+	pr_debug("%s: accepting on %02X\n", __func__,
 		llc_sk(sk)->laddr.lsap);
 	lock_sock(sk);
 	if (unlikely(sk->sk_type != SOCK_STREAM))
@@ -665,7 +659,7 @@ static int llc_ui_accept(struct socket *sock, struct socket *newsock, int flags)
 		if (rc)
 			goto out;
 	}
-	dprintk("%s: got a new connection on %02X\n", __func__,
+	pr_debug("%s: got a new connection on %02X\n", __func__,
 		llc_sk(sk)->laddr.lsap);
 	skb = skb_dequeue(&sk->sk_receive_queue);
 	rc = -EINVAL;
@@ -686,7 +680,7 @@ static int llc_ui_accept(struct socket *sock, struct socket *newsock, int flags)
 	/* put original socket back into a clean listen state. */
 	sk->sk_state = TCP_LISTEN;
 	sk->sk_ack_backlog--;
-	dprintk("%s: ok success on %02X, client on %02X\n", __func__,
+	pr_debug("%s: ok success on %02X, client on %02X\n", __func__,
 		llc_sk(sk)->addr.sllc_sap, newllc->daddr.lsap);
 frees:
 	kfree_skb(skb);
@@ -881,7 +875,7 @@ static int llc_ui_sendmsg(struct kiocb *iocb, struct socket *sock,
 	size_t size = 0;
 	int rc = -EINVAL, copied = 0, hdrlen;
 
-	dprintk("%s: sending from %02X to %02X\n", __func__,
+	pr_debug("%s: sending from %02X to %02X\n", __func__,
 		llc->laddr.lsap, llc->daddr.lsap);
 	lock_sock(sk);
 	if (addr) {
@@ -938,7 +932,7 @@ out:
 	if (rc) {
 		kfree_skb(skb);
 release:
-		dprintk("%s: failed sending from %02X to %02X: %d\n",
+		pr_debug("%s: failed sending from %02X to %02X: %d\n",
 			__func__, llc->laddr.lsap, llc->daddr.lsap, rc);
 	}
 	release_sock(sk);
diff --git a/net/llc/llc_c_ev.c b/net/llc/llc_c_ev.c
index 523fdd1..2e3d224 100644
--- a/net/llc/llc_c_ev.c
+++ b/net/llc/llc_c_ev.c
@@ -41,12 +41,6 @@
 #include <net/llc_c_ev.h>
 #include <net/llc_pdu.h>
 
-#if 1
-#define dprintk(args...) printk(KERN_DEBUG args)
-#else
-#define dprintk(args...)
-#endif
-
 /**
  *	llc_util_ns_inside_rx_window - check if sequence number is in rx window
  *	@ns: sequence number of received pdu.
@@ -227,7 +221,7 @@ int llc_conn_ev_rx_i_cmd_pbit_set_x_inval_ns(struct sock *sk,
 		ns != vr &&
 		 llc_util_ns_inside_rx_window(ns, vr, llc_sk(sk)->rw) ? 0 : 1;
 	if (!rc)
-		dprintk("%s: matched, state=%d, ns=%d, vr=%d\n",
+		pr_debug("%s: matched, state=%d, ns=%d, vr=%d\n",
 			__func__, llc_sk(sk)->state, ns, vr);
 	return rc;
 }
@@ -305,7 +299,7 @@ int llc_conn_ev_rx_i_rsp_fbit_set_x_inval_ns(struct sock *sk,
 		ns != vr &&
 		 llc_util_ns_inside_rx_window(ns, vr, llc_sk(sk)->rw) ? 0 : 1;
 	if (!rc)
-		dprintk("%s: matched, state=%d, ns=%d, vr=%d\n",
+		pr_debug("%s: matched, state=%d, ns=%d, vr=%d\n",
 			__func__, llc_sk(sk)->state, ns, vr);
 	return rc;
 }
@@ -510,7 +504,7 @@ int llc_conn_ev_rx_zzz_cmd_pbit_set_x_inval_nr(struct sock *sk,
 	if (LLC_PDU_IS_CMD(pdu) &&
 	    (LLC_PDU_TYPE_IS_I(pdu) || LLC_PDU_TYPE_IS_S(pdu)) &&
 	    nr != vs && llc_util_nr_inside_tx_window(sk, nr)) {
-		dprintk("%s: matched, state=%d, vs=%d, nr=%d\n",
+		pr_debug("%s: matched, state=%d, vs=%d, nr=%d\n",
 			__func__, llc_sk(sk)->state, vs, nr);
 		rc = 0;
 	}
@@ -529,7 +523,7 @@ int llc_conn_ev_rx_zzz_rsp_fbit_set_x_inval_nr(struct sock *sk,
 	    (LLC_PDU_TYPE_IS_I(pdu) || LLC_PDU_TYPE_IS_S(pdu)) &&
 	    nr != vs && llc_util_nr_inside_tx_window(sk, nr)) {
 		rc = 0;
-		dprintk("%s: matched, state=%d, vs=%d, nr=%d\n",
+		pr_debug("%s: matched, state=%d, vs=%d, nr=%d\n",
 			__func__, llc_sk(sk)->state, vs, nr);
 	}
 	return rc;
diff --git a/net/llc/llc_conn.c b/net/llc/llc_conn.c
index ba137a6..bba05b8 100644
--- a/net/llc/llc_conn.c
+++ b/net/llc/llc_conn.c
@@ -23,12 +23,6 @@
 #include <net/llc_c_st.h>
 #include <net/llc_pdu.h>
 
-#if 0
-#define dprintk(args...) printk(KERN_DEBUG args)
-#else
-#define dprintk(args...)
-#endif
-
 static int llc_find_offset(int state, int ev_type);
 static void llc_conn_send_pdus(struct sock *sk);
 static int llc_conn_service(struct sock *sk, struct sk_buff *skb);
@@ -826,7 +820,7 @@ void llc_conn_handler(struct llc_sap *sap, struct sk_buff *skb)
 	if (!sock_owned_by_user(sk))
 		llc_conn_rcv(sk, skb);
 	else {
-		dprintk("%s: adding to backlog...\n", __func__);
+		pr_debug("%s: adding to backlog...\n", __func__);
 		llc_set_backlog_type(skb, LLC_PACKET);
 		if (sk_add_backlog(sk, skb))
 			goto drop_unlock;
-- 
1.7.2.3

