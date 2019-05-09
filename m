From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 May 2019 10:11:25 +0000
Subject: [PATCH] ceph: Silence a checker warning on the error path
Message-Id: <20190509101125.GC7024@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The problem is that if ceph_mdsc_build_path() fails then we set "path"
to NULL and the "pathlen" variable is uninitialized.  The we call
ceph_mdsc_free_path(path, pathlen) to clean up.  Since "path" is NULL,
the function is a no-op but Smatch and UBSan still complain that
"pathlen" is uninitialized.

This patch doesn't change run time, it just silence the warnings.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/ceph/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ceph/debugfs.c b/fs/ceph/debugfs.c
index b3fc5fe26a1a..a14d64664878 100644
--- a/fs/ceph/debugfs.c
+++ b/fs/ceph/debugfs.c
@@ -52,7 +52,7 @@ static int mdsc_show(struct seq_file *s, void *p)
 	struct ceph_mds_client *mdsc = fsc->mdsc;
 	struct ceph_mds_request *req;
 	struct rb_node *rp;
-	int pathlen;
+	int pathlen = 0;
 	u64 pathbase;
 	char *path;
 
-- 
2.18.0
