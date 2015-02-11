From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Feb 2015 10:22:40 +0000
Subject: [patch] pnfs/flexfiles: move kfree() after the deference
Message-Id: <20150211102240.GA18515@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@primarydata.com>
Cc: Anna Schumaker <anna.schumaker@netapp.com>, Tao Peng <bergwolf@primarydata.com>, Weston Andros Adamson <dros@primarydata.com>, Tom Haynes <loghyr@primarydata.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

We dereference "err" in the the debug printk so we have to move the
kfree() down a couple lines.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/nfs/flexfilelayout/flexfilelayoutdev.c b/fs/nfs/flexfilelayout/flexfilelayoutdev.c
index 3bbb16b..e2c01f2 100644
--- a/fs/nfs/flexfilelayout/flexfilelayoutdev.c
+++ b/fs/nfs/flexfilelayout/flexfilelayoutdev.c
@@ -515,10 +515,10 @@ int ff_layout_encode_ds_ioerr(struct nfs4_flexfile_layout *flo,
 		*p++ = cpu_to_be32(err->opnum);
 		*count += 1;
 		list_del(&err->list);
-		kfree(err);
 		dprintk("%s: offset %llu length %llu status %d op %d count %d\n",
 			__func__, err->offset, err->length, err->status,
 			err->opnum, *count);
+		kfree(err);
 	}
 
 	return 0;
