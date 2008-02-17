From: Julia Lawall <julia@diku.dk>
Date: Sun, 17 Feb 2008 17:56:52 +0000
Subject: [PATCH 5/7] net/rxrpc: Use BUG_ON
Message-Id: <Pine.LNX.4.64.0802171856240.28055@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dhowells@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

if (...) BUG(); should be replaced with BUG_ON(...) when the test has no
side-effects to allow a definition of BUG_ON that drops the code completely.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@ disable unlikely @ expression E,f; @@

(
  if (<... f(...) ...>) { BUG(); }
|
- if (unlikely(E)) { BUG(); }
+ BUG_ON(E);
)

@@ expression E,f; @@

(
  if (<... f(...) ...>) { BUG(); }
|
- if (E) { BUG(); }
+ BUG_ON(E);
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/net/rxrpc/ar-accept.c b/net/rxrpc/ar-accept.c
--- a/net/rxrpc/ar-accept.c 2007-06-02 22:32:46.000000000 +0200
+++ b/net/rxrpc/ar-accept.c 2008-02-17 16:42:48.000000000 +0100
@@ -156,8 +156,7 @@ static int rxrpc_accept_incoming_call(st
 						  false);
 			spin_unlock(&call->lock);
 			notification = NULL;
-			if (ret < 0)
-				BUG();
+			BUG_ON(ret < 0);
 		}
 		spin_unlock(&call->conn->state_lock);
 
diff -u -p a/net/rxrpc/ar-ack.c b/net/rxrpc/ar-ack.c
--- a/net/rxrpc/ar-ack.c 2007-06-02 22:32:46.000000000 +0200
+++ b/net/rxrpc/ar-ack.c 2008-02-17 16:42:54.000000000 +0100
@@ -814,8 +814,7 @@ static int rxrpc_post_message(struct rxr
 		spin_lock_bh(&call->lock);
 		ret = rxrpc_queue_rcv_skb(call, skb, true, fatal);
 		spin_unlock_bh(&call->lock);
-		if (ret < 0)
-			BUG();
+		BUG_ON(ret < 0);
 	}
 
 	return 0;
