From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 08 Aug 2015 13:01:34 +0000
Subject: [patch] fuse: fix an error code in fuse_lookup_name()
Message-Id: <20150808130134.GA8034@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is a static checker fix because we check "outarg->nodeid" here and
then again a in the next if statement.  The difference is that for this
first one we don't set the error code.

Fixes: c180eebe1390 ('fuse: add fuse_lookup_name() helper')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 5e2e087..225fc703 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -306,8 +306,7 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, struct qstr *name,
 
 	fuse_lookup_init(fc, &args, nodeid, name, outarg);
 	err = fuse_simple_request(fc, &args);
-	/* Zero nodeid is same as -ENOENT, but with valid timeout */
-	if (err || !outarg->nodeid)
+	if (err)
 		goto out_put_forget;
 
 	err = -EIO;
