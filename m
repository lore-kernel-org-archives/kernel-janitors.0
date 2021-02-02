From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 02 Feb 2021 13:10:41 +0000
Subject: [PATCH] ceph: fix an oops in error handling in ceph_netfs_issue_op
Message-Id: <20210202131041.43977-1-jlayton@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YBjne8A1gn0mvQtT@mwanda>
In-Reply-To: <YBjne8A1gn0mvQtT@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dhowells@redhat.com
Cc: dan.carpenter@oracle.com, idryomov@gmail.com, ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan reported a potential oops in the cleanup if ceph_osdc_new_request
returns an error. Eliminate the unneeded initialization of "req" and
then just set it to NULL in the case where it holds an ERR_PTR.

Also, drop the unneeded NULL check before calling
ceph_osdc_put_request.

Fixes: 1cf7fdf52d5a ("ceph: convert readpage to fscache read helper")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Suggested-by: Ilya Dryomov <idryomov@gmail.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/addr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 5eec6f66fe52..0dd64d31eff6 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -234,7 +234,7 @@ static void ceph_netfs_issue_op(struct netfs_read_subrequest *subreq)
 	struct inode *inode = rreq->mapping->host;
 	struct ceph_inode_info *ci = ceph_inode(inode);
 	struct ceph_fs_client *fsc = ceph_inode_to_client(inode);
-	struct ceph_osd_request *req = NULL;
+	struct ceph_osd_request *req;
 	struct ceph_vino vino = ceph_vino(inode);
 	struct iov_iter iter;
 	struct page **pages;
@@ -248,6 +248,7 @@ static void ceph_netfs_issue_op(struct netfs_read_subrequest *subreq)
 			NULL, ci->i_truncate_seq, ci->i_truncate_size, false);
 	if (IS_ERR(req)) {
 		err = PTR_ERR(req);
+		req = NULL;
 		goto out;
 	}
 
@@ -273,8 +274,7 @@ static void ceph_netfs_issue_op(struct netfs_read_subrequest *subreq)
 	if (err)
 		iput(inode);
 out:
-	if (req)
-		ceph_osdc_put_request(req);
+	ceph_osdc_put_request(req);
 	if (err)
 		netfs_subreq_terminated(subreq, err);
 	dout("%s: result %d\n", __func__, err);
-- 
2.29.2
