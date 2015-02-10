From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Feb 2015 08:03:22 +0000
Subject: [patch] pnfs: delete an unintended goto
Message-Id: <20150210080322.GA8762@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@primarydata.com>
Cc: Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

There was an extra goto here where it shouldn't be, because of a merge
error.

Fixes: e2c63e091e29 ('Merge branch 'flexfiles'')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/nfs/pnfs.c b/fs/nfs/pnfs.c
index 107b321..4f802b02 100644
--- a/fs/nfs/pnfs.c
+++ b/fs/nfs/pnfs.c
@@ -1078,7 +1078,6 @@ bool pnfs_roc(struct inode *ino)
 			goto out_noroc;
 	}
 
-		goto out_noroc;
 	pnfs_clear_retry_layoutget(lo);
 	list_for_each_entry_safe(lseg, tmp, &lo->plh_segs, pls_list)
 		if (test_bit(NFS_LSEG_ROC, &lseg->pls_flags)) {
