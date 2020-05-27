From: Colin King <colin.king@canonical.com>
Date: Wed, 27 May 2020 12:56:11 +0000
Subject: [PATCH] NFS: remove redundant initialization of variable result
Message-Id: <20200527125611.174291-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable result is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/nfs/direct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/direct.c b/fs/nfs/direct.c
index a57e7c72c7f4..bb63e2b93ff7 100644
--- a/fs/nfs/direct.c
+++ b/fs/nfs/direct.c
@@ -446,7 +446,7 @@ ssize_t nfs_file_direct_read(struct kiocb *iocb, struct iov_iter *iter)
 	struct inode *inode = mapping->host;
 	struct nfs_direct_req *dreq;
 	struct nfs_lock_context *l_ctx;
-	ssize_t result = -EINVAL, requested;
+	ssize_t result, requested;
 	size_t count = iov_iter_count(iter);
 	nfs_add_stats(mapping->host, NFSIOS_DIRECTREADBYTES, count);
 
-- 
2.25.1
