From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 02 Aug 2018 03:36:39 +0000
Subject: [PATCH net-next] rxrpc: Remove set but not used variable 'nowj'
Message-Id: <1533180999-138562-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-afs@lists.infradead.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

net/rxrpc/proc.c: In function 'rxrpc_call_seq_show':
net/rxrpc/proc.c:66:29: warning:
 variable 'nowj' set but not used [-Wunused-but-set-variable]
  unsigned long timeout = 0, nowj;
                             ^

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/rxrpc/proc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/rxrpc/proc.c b/net/rxrpc/proc.c
index 163d05d..9805e3b 100644
--- a/net/rxrpc/proc.c
+++ b/net/rxrpc/proc.c
@@ -63,7 +63,7 @@ static int rxrpc_call_seq_show(struct seq_file *seq, void *v)
 	struct rxrpc_peer *peer;
 	struct rxrpc_call *call;
 	struct rxrpc_net *rxnet = rxrpc_net(seq_file_net(seq));
-	unsigned long timeout = 0, nowj;
+	unsigned long timeout = 0;
 	rxrpc_seq_t tx_hard_ack, rx_hard_ack;
 	char lbuff[50], rbuff[50];
 
@@ -97,7 +97,6 @@ static int rxrpc_call_seq_show(struct seq_file *seq, void *v)
 
 	if (call->state != RXRPC_CALL_SERVER_PREALLOC) {
 		timeout = READ_ONCE(call->expect_rx_by);
-		nowj = jiffies;
 		timeout -= jiffies;
 	}

