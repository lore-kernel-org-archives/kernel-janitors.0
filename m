From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Feb 2012 07:28:04 +0000
Subject: [patch] svcrdma: silence a Sparse warning
Message-Id: <20120221072804.GA6896@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Trond Myklebust <Trond.Myklebust@netapp.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Sparse complains that the definition function definition and the
implementation aren't anotated the same way.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/include/linux/sunrpc/svc_rdma.h b/include/linux/sunrpc/svc_rdma.h
index d205e9f..0b8e3e6 100644
--- a/include/linux/sunrpc/svc_rdma.h
+++ b/include/linux/sunrpc/svc_rdma.h
@@ -190,7 +190,7 @@ extern int svc_rdma_xdr_encode_error(struct svcxprt_rdma *,
 extern void svc_rdma_xdr_encode_write_list(struct rpcrdma_msg *, int);
 extern void svc_rdma_xdr_encode_reply_array(struct rpcrdma_write_array *, int);
 extern void svc_rdma_xdr_encode_array_chunk(struct rpcrdma_write_array *, int,
-					    u32, u64, u32);
+					    __be32, __be64, u32);
 extern void svc_rdma_xdr_encode_reply_header(struct svcxprt_rdma *,
 					     struct rpcrdma_msg *,
 					     struct rpcrdma_msg *,
