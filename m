From: Julia Lawall <julia@diku.dk>
Date: Fri, 06 Aug 2010 20:58:49 +0000
Subject: [PATCH] fs/ecryptfs/file.c: introduce missing free
Message-Id: <Pine.LNX.4.64.1008062258130.5466@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tyler Hicks <tyhicks@linux.vnet.ibm.com>, Dustin Kirkland <kirkland@canonical.com>, ecryptfs-devel@lists.launchpad.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The comments in the code indicate that file_info should be released if the
function fails.  This releasing is done at the label out_free, not out.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
statement S;
expression E;
identifier f,f1,l;
position p1,p2;
expression *ptr != NULL;
@@

x@p1 = kmem_cache_zalloc(...);
...
if (x = NULL) S
<... when != x
     when != if (...) { <+...x...+> }
(
x->f1 = E
|
 (x->f1 = NULL || ...)
|
 f(...,x->f1,...)
)
...>
(
 return <+...x...+>;
|
 return@p2 ...;
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

print "* file: %s kmem_cache_zalloc %s" % (p1[0].file,p1[0].line)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---
 fs/ecryptfs/file.c                  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ecryptfs/file.c b/fs/ecryptfs/file.c
index 6e4f84c..622c951 100644
--- a/fs/ecryptfs/file.c
+++ b/fs/ecryptfs/file.c
@@ -199,7 +199,7 @@ static int ecryptfs_open(struct inode *inode, struct file *file)
 			       "the persistent file for the dentry with name "
 			       "[%s]; rc = [%d]\n", __func__,
 			       ecryptfs_dentry->d_name.name, rc);
-			goto out;
+			goto out_free;
 		}
 	}
 	if ((ecryptfs_inode_to_private(inode)->lower_file->f_flags & O_RDONLY)
@@ -207,7 +207,7 @@ static int ecryptfs_open(struct inode *inode, struct file *file)
 		rc = -EPERM;
 		printk(KERN_WARNING "%s: Lower persistent file is RO; eCryptfs "
 		       "file must hence be opened RO\n", __func__);
-		goto out;
+		goto out_free;
 	}
 	ecryptfs_set_file_lower(
 		file, ecryptfs_inode_to_private(inode)->lower_file);
