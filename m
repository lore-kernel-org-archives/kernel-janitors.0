From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Jun 2012 07:37:08 +0000
Subject: [patch 1/2] NFSv4.1: integer overflow in decode_cb_sequence_args()
Message-Id: <20120612073707.GA15060@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, Benny Halevy <bhalevy@panasas.com>, kernel-janitors@vger.kernel.org

This seems like it could overflow on 32 bits.  Use kmalloc_array() which
has overflow protection built in.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/nfs/callback_xdr.c b/fs/nfs/callback_xdr.c
index 95bfc24..27c2969 100644
--- a/fs/nfs/callback_xdr.c
+++ b/fs/nfs/callback_xdr.c
@@ -455,9 +455,9 @@ static __be32 decode_cb_sequence_args(struct svc_rqst *rqstp,
 	args->csa_nrclists = ntohl(*p++);
 	args->csa_rclists = NULL;
 	if (args->csa_nrclists) {
-		args->csa_rclists = kmalloc(args->csa_nrclists *
-					    sizeof(*args->csa_rclists),
-					    GFP_KERNEL);
+		args->csa_rclists = kmalloc_array(args->csa_nrclists,
+						  sizeof(*args->csa_rclists),
+						  GFP_KERNEL);
 		if (unlikely(args->csa_rclists = NULL))
 			goto out;
 
