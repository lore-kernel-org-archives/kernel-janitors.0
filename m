From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 19 May 2014 04:31:13 +0000
Subject: [PATCH 11/13] ufs: make return of 0 explicit
Message-Id: <1400473875-22228-12-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400473875-22228-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1400473875-22228-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Dushistov <dushistov@mail.ru>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete unnecessary local variable whose value is always 0 and that hides
the fact that the result is always 0.

A simplified version of the semantic patch that fixes this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
local idexpression ret;
expression e;
position p;
@@

-ret = 0;
... when != ret = e
return 
- ret
+ 0
  ;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/ufs/truncate.c |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/fs/ufs/truncate.c b/fs/ufs/truncate.c
index f04f89f..a17f0a9 100644
--- a/fs/ufs/truncate.c
+++ b/fs/ufs/truncate.c
@@ -72,7 +72,6 @@ static int ufs_trunc_direct(struct inode *inode)
 	u64 frag1, frag2, frag3, frag4, block1, block2;
 	unsigned frag_to_free, free_count;
 	unsigned i, tmp;
-	int retry;
 	
 	UFSD("ENTER: ino %lu\n", inode->i_ino);
 
@@ -81,7 +80,6 @@ static int ufs_trunc_direct(struct inode *inode)
 	
 	frag_to_free = 0;
 	free_count = 0;
-	retry = 0;
 	
 	frag1 = DIRECT_FRAGMENT;
 	frag4 = min_t(u64, UFS_NDIR_FRAGMENT, ufsi->i_lastfrag);
@@ -164,7 +162,7 @@ next1:
  next3:
 
 	UFSD("EXIT: ino %lu\n", inode->i_ino);
-	return retry;
+	return 0;
 }
 
 
@@ -176,7 +174,6 @@ static int ufs_trunc_indirect(struct inode *inode, u64 offset, void *p)
 	void *ind;
 	u64 tmp, indirect_block, i, frag_to_free;
 	unsigned free_count;
-	int retry;
 
 	UFSD("ENTER: ino %lu, offset %llu, p: %p\n",
 	     inode->i_ino, (unsigned long long)offset, p);
@@ -188,7 +185,6 @@ static int ufs_trunc_indirect(struct inode *inode, u64 offset, void *p)
 
 	frag_to_free = 0;
 	free_count = 0;
-	retry = 0;
 	
 	tmp = ufs_data_ptr_to_cpu(sb, p);
 	if (!tmp)
@@ -248,7 +244,7 @@ static int ufs_trunc_indirect(struct inode *inode, u64 offset, void *p)
 	
 	UFSD("EXIT: ino %lu\n", inode->i_ino);
 	
-	return retry;
+	return 0;
 }
 
 static int ufs_trunc_dindirect(struct inode *inode, u64 offset, void *p)

