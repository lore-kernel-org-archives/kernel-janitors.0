From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Jun 2012 07:37:39 +0000
Subject: [patch 2/2] NFS: add an endian notation for sparse
Message-Id: <20120612073737.GB15060@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

This is supposed to be a __be32 value.  Sparse complains a lot:

fs/nfs/callback_xdr.c:699:30: warning: incorrect type in initializer (different base types)
fs/nfs/callback_xdr.c:699:30:    expected unsigned int [unsigned] status
fs/nfs/callback_xdr.c:699:30:    got restricted __be32 const [usertype] csr_status
fs/nfs/callback_xdr.c:715:9: warning: cast to restricted __be32
fs/nfs/callback_xdr.c:716:16: warning: incorrect type in return expression (different base types)
fs/nfs/callback_xdr.c:716:16:    expected restricted __be32
fs/nfs/callback_xdr.c:716:16:    got unsigned int [unsigned] status

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/nfs/callback_xdr.c b/fs/nfs/callback_xdr.c
index 27c2969..e64b01d 100644
--- a/fs/nfs/callback_xdr.c
+++ b/fs/nfs/callback_xdr.c
@@ -696,7 +696,7 @@ static __be32 encode_cb_sequence_res(struct svc_rqst *rqstp,
 				       const struct cb_sequenceres *res)
 {
 	__be32 *p;
-	unsigned status = res->csr_status;
+	__be32 status = res->csr_status;
 
 	if (unlikely(status != 0))
 		goto out;
