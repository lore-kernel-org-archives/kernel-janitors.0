From: Julia Lawall <julia@diku.dk>
Date: Mon, 27 Jul 2009 16:15:05 +0000
Subject: [PATCH 9/12] fs/btrfs: Correct redundant test
Message-Id: <Pine.LNX.4.64.0907271814490.2682@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: chris.mason@oracle.com, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

dir has already been tested.  It seems that this test should be on the
recently returned value inode.

A simplified version of the semantic match that finds this problem is as
follows: (http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
expression E;
position p1,p2;
@@

if (x = NULL || ...) { ... when forall
   return ...; }
... when != \(x=E\|x--\|x++\|--x\|++x\|x-=E\|x+=E\|x|=E\|x&=E\|&x\)
(
*x = NULL
|
*x != NULL
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/btrfs/tree-log.c                 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/btrfs/tree-log.c b/fs/btrfs/tree-log.c
index c139222..d91b0de 100644
--- a/fs/btrfs/tree-log.c
+++ b/fs/btrfs/tree-log.c
@@ -797,7 +797,7 @@ static noinline int add_inode_ref(struct btrfs_trans_handle *trans,
 		return -ENOENT;
 
 	inode = read_one_inode(root, key->objectid);
-	BUG_ON(!dir);
+	BUG_ON(!inode);
 
 	ref_ptr = btrfs_item_ptr_offset(eb, slot);
 	ref_end = ref_ptr + btrfs_item_size_nr(eb, slot);
