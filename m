From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Feb 2021 05:47:39 +0000
Subject: [PATCH] ceph: Fix an Oops in error handling
Message-Id: <YBjne8A1gn0mvQtT@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Layton <jlayton@kernel.org>
Cc: Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "req" pointer is an error pointer and not NULL so this check needs
to be fixed.

Fixes: 1cf7fdf52d5a ("ceph: convert readpage to fscache read helper")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/ceph/addr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 5eec6f66fe52..fb0238a4d34f 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -273,7 +273,7 @@ static void ceph_netfs_issue_op(struct netfs_read_subrequest *subreq)
 	if (err)
 		iput(inode);
 out:
-	if (req)
+	if (!IS_ERR_OR_NULL(req))
 		ceph_osdc_put_request(req);
 	if (err)
 		netfs_subreq_terminated(subreq, err);
-- 
2.29.2
