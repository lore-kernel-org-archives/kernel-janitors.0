From: Colin King <colin.king@canonical.com>
Date: Wed, 26 Feb 2020 23:43:20 +0000
Subject: [PATCH] NFS: check for allocation failure from mempool_alloc
Message-Id: <20200226234320.7722-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

It is possible for mempool_alloc to return null when using
the GFP_KERNEL flag, so return NULL and avoid a null pointer
dereference on the following memset of the null pointer.

Addresses-Coverity: ("Dereference null return")
Fixes: 2b17d725f9be ("NFS: Clean up writeback code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/nfs/write.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/nfs/write.c b/fs/nfs/write.c
index c478b772cc49..7ca036660dd1 100644
--- a/fs/nfs/write.c
+++ b/fs/nfs/write.c
@@ -106,6 +106,9 @@ static struct nfs_pgio_header *nfs_writehdr_alloc(void)
 {
 	struct nfs_pgio_header *p = mempool_alloc(nfs_wdata_mempool, GFP_KERNEL);
 
+	if (!p)
+		return NULL;
+
 	memset(p, 0, sizeof(*p));
 	p->rw_mode = FMODE_WRITE;
 	return p;
-- 
2.25.0
