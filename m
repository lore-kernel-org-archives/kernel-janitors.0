From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 03 Sep 2019 14:06:49 +0000
Subject: [PATCH] isofs: Delete unnecessary checks before brelse()
Message-Id: <0ab9272b-fce5-1fa3-6625-898afd1b9b8f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Deepa Dinamani <deepa.kernel@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeff Layton <jlayton@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Matthew Wilcox <willy@infradead.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 3 Sep 2019 15:51:17 +0200

The brelse() function tests whether its argument is NULL
and then returns immediately.
Thus the tests around the shown calls are not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/isofs/dir.c    | 3 +--
 fs/isofs/export.c | 3 +--
 fs/isofs/inode.c  | 9 +++------
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/fs/isofs/dir.c b/fs/isofs/dir.c
index f0fe641893a5..8e6a09de15b7 100644
--- a/fs/isofs/dir.c
+++ b/fs/isofs/dir.c
@@ -237,8 +237,7 @@ static int do_isofs_readdir(struct inode *inode, struct file *file,

 		continue;
 	}
-	if (bh)
-		brelse(bh);
+	brelse(bh);
 	return 0;
 }

diff --git a/fs/isofs/export.c b/fs/isofs/export.c
index 35768a63fb1d..11bf964f4886 100644
--- a/fs/isofs/export.c
+++ b/fs/isofs/export.c
@@ -102,8 +102,7 @@ static struct dentry *isofs_export_get_parent(struct dentry *child)
 	rv = d_obtain_alias(isofs_iget(child_inode->i_sb, parent_block,
 				     parent_offset));
  out:
-	if (bh)
-		brelse(bh);
+	brelse(bh);
 	return rv;
 }

diff --git a/fs/isofs/inode.c b/fs/isofs/inode.c
index 62c0462dc89f..05b6f6078d9b 100644
--- a/fs/isofs/inode.c
+++ b/fs/isofs/inode.c
@@ -1284,13 +1284,11 @@ static int isofs_read_level3_size(struct inode *inode)
 	} while (more_entries);
 out:
 	kfree(tmpde);
-	if (bh)
-		brelse(bh);
+	brelse(bh);
 	return 0;

 out_nomem:
-	if (bh)
-		brelse(bh);
+	brelse(bh);
 	return -ENOMEM;

 out_noread:
@@ -1491,8 +1489,7 @@ static int isofs_read_inode(struct inode *inode, int relocated)
 	ret = 0;
 out:
 	kfree(tmpde);
-	if (bh)
-		brelse(bh);
+	brelse(bh);
 	return ret;

 out_badread:
--
2.23.0
