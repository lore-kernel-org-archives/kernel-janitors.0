From: Julia Lawall <julia@diku.dk>
Date: Sun, 28 Mar 2010 16:00:25 +0000
Subject: [PATCH] fs/btrfs: Correct use after free
Message-Id: <Pine.LNX.4.64.1003281800020.29824@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@oracle.com>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If the kfree is executed, the dereference of range afterwards will
represent a use after free.  Added goto out, as done in the other nearby
error handling code.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,e;
identifier f;
iterator I;
statement S;
@@

*kfree(x);
... when != &x
    when != x = e
    when != I(x,...) S
*x->f
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/btrfs/ioctl.c                    |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
index 2845c6c..dacbb52 100644
--- a/fs/btrfs/ioctl.c
+++ b/fs/btrfs/ioctl.c
@@ -1375,6 +1375,7 @@ static int btrfs_ioctl_defrag(struct file *file, void __user *argp)
 					   sizeof(*range))) {
 				ret = -EFAULT;
 				kfree(range);
+				goto out;
 			}
 			/* compression requires us to start the IO */
 			if ((range->flags & BTRFS_DEFRAG_RANGE_COMPRESS)) {
