From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 08 Nov 2018 02:04:57 +0000
Subject: [PATCH net-next] SUNRPC: drop pointless static qualifier in xdr_get_next_encode_buffer()
Message-Id: <1541642697-33860-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, "J. Bruce Fields" <bfields@fieldses.org>, David Miller <davem@davemloft.net>, Jeff Layton <jlayton@kernel.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There is no need to have the '__be32 *p' variable static since new value
always be assigned before use it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 net/sunrpc/xdr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sunrpc/xdr.c b/net/sunrpc/xdr.c
index 2bbb8d3..d80b156 100644
--- a/net/sunrpc/xdr.c
+++ b/net/sunrpc/xdr.c
@@ -546,7 +546,7 @@ void xdr_commit_encode(struct xdr_stream *xdr)
 static __be32 *xdr_get_next_encode_buffer(struct xdr_stream *xdr,
 		size_t nbytes)
 {
-	static __be32 *p;
+	__be32 *p;
 	int space_left;
 	int frag1bytes, frag2bytes;
