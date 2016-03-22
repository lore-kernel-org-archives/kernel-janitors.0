From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Mar 2016 11:38:49 +0000
Subject: [patch] dax: silence an uninitialized variable warning
Message-Id: <20160322113848.GA4519@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>
Cc: Matthew Wilcox <willy@linux.intel.com>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

I'm not positive, but it looks like it might be possible to reach the
end of this function and return an uninitialized value for "rc".  Anyway
it causes a static checker warning and let's silence it.

The warning was introduced in commit b2e0d1625e19 ('dax: fix lifetime of
in-kernel dax mappings with dax_map_atomic()').

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/dax.c b/fs/dax.c
index 90322eb..3744e14 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -155,7 +155,8 @@ static ssize_t dax_io(struct inode *inode, struct iov_iter *iter,
 	loff_t pos = start, max = start, bh_max = start;
 	bool hole = false, need_wmb = false;
 	struct block_device *bdev = NULL;
-	int rw = iov_iter_rw(iter), rc;
+	int rc = 0;
+	int rw = iov_iter_rw(iter);
 	long map_len = 0;
 	struct blk_dax_ctl dax = {
 		.addr = (void __pmem *) ERR_PTR(-EIO),
