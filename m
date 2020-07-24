From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Jul 2020 10:44:41 +0000
Subject: [PATCH] NFS: remove redundant initialization of variable result
Message-Id: <20200724104441.13532-1-colin.king@canonical.com>
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
index 1b79dd5cf661..2d30a4da49fa 100644
--- a/fs/nfs/direct.c
+++ b/fs/nfs/direct.c
@@ -896,7 +896,7 @@ static ssize_t nfs_direct_write_schedule_iovec(struct nfs_direct_req *dreq,
  */
 ssize_t nfs_file_direct_write(struct kiocb *iocb, struct iov_iter *iter)
 {
-	ssize_t result = -EINVAL, requested;
+	ssize_t result, requested;
 	size_t count;
 	struct file *file = iocb->ki_filp;
 	struct address_space *mapping = file->f_mapping;
-- 
2.27.0
