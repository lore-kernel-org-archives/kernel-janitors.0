From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Aug 2015 21:06:44 +0000
Subject: [patch v2] fuse: remove dead code in fuse_lookup_name()
Message-Id: <20150812210644.GA8068@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We check "outarg->nodeid" twice in a row and it causes a static checker
warning.  We should return success if "outarg->nodeid" is zero so the
first check is correct and the second one should be deleted.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: The first version of this patch introduced a bug into working code.
    (returning error instead of success).  Sorry.  :(

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 5e2e087..56a3463 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -306,11 +306,10 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, struct qstr *name,
 
 	fuse_lookup_init(fc, &args, nodeid, name, outarg);
 	err = fuse_simple_request(fc, &args);
-	/* Zero nodeid is same as -ENOENT, but with valid timeout */
-	if (err || !outarg->nodeid)
+	if (err)
 		goto out_put_forget;
 
-	err = -EIO;
+	/* Zero nodeid is same as -ENOENT, but with valid timeout */
 	if (!outarg->nodeid)
 		goto out_put_forget;
 	if (!fuse_valid_type(outarg->attr.mode))
