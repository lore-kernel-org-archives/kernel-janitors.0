From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 26 Sep 2018 12:10:48 +0000
Subject: [PATCH net-next] net/tls: Make function get_rec() static
Message-Id: <1537963848-166323-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Pismenny <borisp@mellanox.com>, Aviad Yehezkel <aviadye@mellanox.com>, Dave Watson <davejwatson@fb.com>, Vakul Garg <vakul.garg@nxp.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

net/tls/tls_sw.c:655:16: warning:
 symbol 'get_rec' was not declared. Should it be static?

Fixes: a42055e8d2c3 ("net/tls: Add support for async encryption of records for performance")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/tls/tls_sw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index bcb24c4..207e3ca 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -652,7 +652,7 @@ static int memcopy_from_iter(struct sock *sk, struct iov_iter *from,
 	return rc;
 }
 
-struct tls_rec *get_rec(struct sock *sk)
+static struct tls_rec *get_rec(struct sock *sk)
 {
 	struct tls_context *tls_ctx = tls_get_ctx(sk);
 	struct tls_sw_context_tx *ctx = tls_sw_ctx_tx(tls_ctx);
