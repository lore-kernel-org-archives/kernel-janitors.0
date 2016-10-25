From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Oct 2016 21:37:37 +0000
Subject: [patch v3] fuse: clean up fuse_lookup_name()
Message-Id: <20161025213737.GB30419@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

We check for !outarg->nodeid twice.  The first time we return success
and the next time (which is dead code) we return -EIO.  The correct
return is the current success return and we should delete the dead code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I sent this patch last year, but the first time I changed the function
to return -EIO, then in the second patch I messed up so that if
fuse_valid_type() was false then we still returned success.  But
hopefully version 3 is correct.

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index b3ebe512d64c..6277af3e9c45 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -321,13 +321,14 @@ int fuse_lookup_name(struct super_block *sb, u64 nodeid, const struct qstr *name
 
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
+
+	err = -EIO;
 	if (!fuse_valid_type(outarg->attr.mode))
 		goto out_put_forget;
 
