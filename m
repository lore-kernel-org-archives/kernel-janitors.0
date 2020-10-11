From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 11 Oct 2020 10:34:54 +0000
Subject: [PATCH 1/5] rxrpc: use semicolons rather than commas to separate statements
Message-Id: <1602412498-32025-2-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1602412498-32025-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1602412498-32025-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-afs@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Replace commas with semicolons.  Commas introduce unnecessary
variability in the code structure and are hard to see.  What is done
is essentially described by the following Coccinelle semantic patch
(http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 net/rxrpc/recvmsg.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rxrpc/recvmsg.c b/net/rxrpc/recvmsg.c
index c4684dde1f16..acc4660cfa5b 100644
--- a/net/rxrpc/recvmsg.c
+++ b/net/rxrpc/recvmsg.c
@@ -69,7 +69,7 @@ bool __rxrpc_set_call_completion(struct rxrpc_call *call,
 	if (call->state < RXRPC_CALL_COMPLETE) {
 		call->abort_code = abort_code;
 		call->error = error;
-		call->completion = compl,
+		call->completion = compl;
 		call->state = RXRPC_CALL_COMPLETE;
 		trace_rxrpc_call_complete(call);
 		wake_up(&call->waitq);
