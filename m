From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 28 Apr 2020 07:19:32 +0000
Subject: [PATCH -next] NFSv4: Use GFP_ATOMIC under spin lock in _pnfs_grab_empty_layout()
Message-Id: <20200428071932.69976-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

A spin lock is taken here so we should use GFP_ATOMIC.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 fs/nfs/pnfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/pnfs.c b/fs/nfs/pnfs.c
index dd2e14f5875d..d84c1b7b71d2 100644
--- a/fs/nfs/pnfs.c
+++ b/fs/nfs/pnfs.c
@@ -2170,7 +2170,7 @@ _pnfs_grab_empty_layout(struct inode *ino, struct nfs_open_context *ctx)
 	struct pnfs_layout_hdr *lo;
 
 	spin_lock(&ino->i_lock);
-	lo = pnfs_find_alloc_layout(ino, ctx, GFP_KERNEL);
+	lo = pnfs_find_alloc_layout(ino, ctx, GFP_ATOMIC);
 	if (!lo)
 		goto out_unlock;
 	if (!test_bit(NFS_LAYOUT_INVALID_STID, &lo->plh_flags))
