From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 09 Oct 2018 02:31:13 +0000
Subject: [PATCH net-next] rxrpc: Remove set but not used variable 'ioc'
Message-Id: <1539052273-34824-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1533180999-138562-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1533180999-138562-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, davem@davemloft.net
Cc: YueHaibing <yuehaibing@huawei.com>, linux-afs@lists.infradead.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

net/rxrpc/output.c: In function 'rxrpc_reject_packets':
net/rxrpc/output.c:527:11: warning:
 variable 'ioc' set but not used [-Wunused-but-set-variable]

It never used since introduction in
commit ece64fec164f ("rxrpc: Emit BUSY packets when supposed to rather than ABORTs")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 net/rxrpc/output.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/rxrpc/output.c b/net/rxrpc/output.c
index e8fb892..f3ed16a 100644
--- a/net/rxrpc/output.c
+++ b/net/rxrpc/output.c
@@ -524,7 +524,7 @@ void rxrpc_reject_packets(struct rxrpc_local *local)
 	struct kvec iov[2];
 	size_t size;
 	__be32 code;
-	int ret, ioc;
+	int ret;
 
 	_enter("%d", local->debug_id);
 
@@ -548,13 +548,11 @@ void rxrpc_reject_packets(struct rxrpc_local *local)
 		case RXRPC_SKB_MARK_REJECT_BUSY:
 			whdr.type = RXRPC_PACKET_TYPE_BUSY;
 			size = sizeof(whdr);
-			ioc = 1;
 			break;
 		case RXRPC_SKB_MARK_REJECT_ABORT:
 			whdr.type = RXRPC_PACKET_TYPE_ABORT;
 			code = htonl(skb->priority);
 			size = sizeof(whdr) + sizeof(code);
-			ioc = 2;
 			break;
 		default:
 			rxrpc_free_skb(skb, rxrpc_skb_rx_freed);
