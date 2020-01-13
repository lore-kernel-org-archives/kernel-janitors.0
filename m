From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Jan 2020 13:23:07 +0000
Subject: [PATCH] nfsd4: fix double free in nfsd4_do_async_copy()
Message-Id: <20200113132307.frp6ur5zhzolu5ys@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@fieldses.org>, Olga Kornievskaia <kolga@netapp.com>
Cc: Chuck Lever <chuck.lever@oracle.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

This frees "copy->nf_src" before and again after the goto.

Fixes: ce0887ac96d3 ("NFSD add nfs4 inter ssc to nfsd4_copy")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/nfsd/nfs4proc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/nfsd/nfs4proc.c b/fs/nfsd/nfs4proc.c
index 1e14b3ed5674..c90c24c35b2e 100644
--- a/fs/nfsd/nfs4proc.c
+++ b/fs/nfsd/nfs4proc.c
@@ -1469,7 +1469,6 @@ static int nfsd4_do_async_copy(void *data)
 		copy->nf_src->nf_file = nfs42_ssc_open(copy->ss_mnt, &copy->c_fh,
 					      &copy->stateid);
 		if (IS_ERR(copy->nf_src->nf_file)) {
-			kfree(copy->nf_src);
 			copy->nfserr = nfserr_offload_denied;
 			nfsd4_interssc_disconnect(copy->ss_mnt);
 			goto do_callback;
-- 
2.11.0
