From: Colin King <colin.king@canonical.com>
Date: Tue, 30 Jun 2020 14:27:46 +0000
Subject: [PATCH][next] net/tls: fix sign extension issue when left shifting u16 value
Message-Id: <20200630142746.516188-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Pismenny <borisp@mellanox.com>, Aviad Yehezkel <aviadye@mellanox.com>, John Fastabend <john.fastabend@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>, Tariq Toukan <tariqt@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Left shifting the u16 value promotes it to a int and then it
gets sign extended to a u64.  If len << 16 is greater than 0x7fffffff
then the upper bits get set to 1 because of the implicit sign extension.
Fix this by casting len to u64 before shifting it.

Addresses-Coverity: ("integer handling issues")
Fixes: ed9b7646b06a ("net/tls: Add asynchronous resync")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 include/net/tls.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/tls.h b/include/net/tls.h
index c875c0a445a6..e5dac7e74e79 100644
--- a/include/net/tls.h
+++ b/include/net/tls.h
@@ -637,7 +637,7 @@ tls_offload_rx_resync_async_request_start(struct sock *sk, __be32 seq, u16 len)
 	struct tls_offload_context_rx *rx_ctx = tls_offload_ctx_rx(tls_ctx);
 
 	atomic64_set(&rx_ctx->resync_async->req, ((u64)ntohl(seq) << 32) |
-		     (len << 16) | RESYNC_REQ | RESYNC_REQ_ASYNC);
+		     ((u64)len << 16) | RESYNC_REQ | RESYNC_REQ_ASYNC);
 	rx_ctx->resync_async->loglen = 0;
 }
 
-- 
2.27.0
