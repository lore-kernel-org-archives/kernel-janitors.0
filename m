From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 09 Oct 2018 14:15:25 +0000
Subject: [PATCH v2] rxrpc: use correct kvec num while send response packet in rxrpc_reject_packets
Message-Id: <1539094525-174123-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539052273-34824-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539052273-34824-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, davem@davemloft.net
Cc: YueHaibing <yuehaibing@huawei.com>, linux-afs@lists.infradead.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

net/rxrpc/output.c: In function 'rxrpc_reject_packets':
net/rxrpc/output.c:527:11: warning:
 variable 'ioc' set but not used [-Wunused-but-set-variable]

'ioc' is the correct kvec num while send response packet.

Fixes: commit ece64fec164f ("rxrpc: Emit BUSY packets when supposed to rather than ABORTs")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 net/rxrpc/output.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/rxrpc/output.c b/net/rxrpc/output.c
index e8fb892..a141ee3 100644
--- a/net/rxrpc/output.c
+++ b/net/rxrpc/output.c
@@ -572,7 +572,8 @@ void rxrpc_reject_packets(struct rxrpc_local *local)
 			whdr.flags	^= RXRPC_CLIENT_INITIATED;
 			whdr.flags	&= RXRPC_CLIENT_INITIATED;
 
-			ret = kernel_sendmsg(local->socket, &msg, iov, 2, size);
+			ret = kernel_sendmsg(local->socket, &msg,
+					     iov, ioc, size);
 			if (ret < 0)
 				trace_rxrpc_tx_fail(local->debug_id, 0, ret,
 						    rxrpc_tx_point_reject);
