From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 31 Oct 2019 06:47:41 +0000
Subject: [PATCH] vsock: Simplify '__vsock_release()'
Message-Id: <20191031064741.4567-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, sunilmut@microsoft.com, willemb@google.com, sgarzare@redhat.com, stefanha@redhat.com, ytht.net@gmail.com, arnd@arndb.de, tglx@linutronix.de, decui@microsoft.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Use '__skb_queue_purge()' instead of re-implementing it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 net/vmw_vsock/af_vsock.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 2ab43b2bba31..2983dc92ca63 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -641,7 +641,6 @@ EXPORT_SYMBOL_GPL(__vsock_create);
 static void __vsock_release(struct sock *sk, int level)
 {
 	if (sk) {
-		struct sk_buff *skb;
 		struct sock *pending;
 		struct vsock_sock *vsk;
 
@@ -662,8 +661,7 @@ static void __vsock_release(struct sock *sk, int level)
 		sock_orphan(sk);
 		sk->sk_shutdown = SHUTDOWN_MASK;
 
-		while ((skb = skb_dequeue(&sk->sk_receive_queue)))
-			kfree_skb(skb);
+		skb_queue_purge(&sk->sk_receive_queue);
 
 		/* Clean up any sockets that never were accepted. */
 		while ((pending = vsock_dequeue_accept(sk)) != NULL) {
-- 
2.20.1
