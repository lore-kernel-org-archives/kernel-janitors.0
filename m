From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jan 2012 06:47:22 +0000
Subject: [patch] svcrdma: endian bug in send_write_chunks()
Message-Id: <20120112064722.GB2408@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, "David S. Miller" <davem@davemloft.net>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Sparse complains because arg_ch->rs_length is declared as network
endian but we're treating it as CPU endian.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/sunrpc/xprtrdma/svc_rdma_sendto.c b/net/sunrpc/xprtrdma/svc_rdma_sendto.c
index 249a835..30fda86 100644
--- a/net/sunrpc/xprtrdma/svc_rdma_sendto.c
+++ b/net/sunrpc/xprtrdma/svc_rdma_sendto.c
@@ -409,7 +409,7 @@ static int send_write_chunks(struct svcxprt_rdma *xprt,
 		u64 rs_offset;
 
 		arg_ch = &arg_ary->wc_array[chunk_no].wc_target;
-		write_len = min(xfer_len, arg_ch->rs_length);
+		write_len = min(xfer_len, ntohl(arg_ch->rs_length));
 
 		/* Prepare the response chunk given the length actually
 		 * written */
@@ -481,7 +481,7 @@ static int send_reply_chunks(struct svcxprt_rdma *xprt,
 	     chunk_no++) {
 		u64 rs_offset;
 		ch = &arg_ary->wc_array[chunk_no].wc_target;
-		write_len = min(xfer_len, ch->rs_length);
+		write_len = min(xfer_len, ntohl(ch->rs_length));
 
 		/* Prepare the reply chunk given the length actually
 		 * written */
