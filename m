From: Dan Carpenter <error27@gmail.com>
Date: Fri, 25 Feb 2011 10:25:29 +0000
Subject: [patch] ufs: truncated values handling 64 bit metadata
Message-Id: <20110225102529.GB1936@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Dushistov <dushistov@mail.ru>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Originally i_lastfrag was 32 bits but then we added support for handling
64 bit metadata and it became a 64 bit variable.  That was during 2007,
in 54fb996ac15c "[PATCH] ufs2 write: block allocation update".
Unfortunately these casts got left behind so the value got truncated to
32 bit again.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/ufs/balloc.c b/fs/ufs/balloc.c
index 46f7a80..100d2ee 100644
--- a/fs/ufs/balloc.c
+++ b/fs/ufs/balloc.c
@@ -424,7 +424,7 @@ u64 ufs_new_fragments(struct inode *inode, void *p, u64 fragment,
 			ufs_cpu_to_data_ptr(sb, p, result);
 			*err = 0;
 			UFS_I(inode)->i_lastfrag -				max_t(u32, UFS_I(inode)->i_lastfrag,
+				max_t(u64, UFS_I(inode)->i_lastfrag,
 				      fragment + count);
 			ufs_clear_frags(inode, result + oldcount,
 					newcount - oldcount, locked_page != NULL);
@@ -440,7 +440,7 @@ u64 ufs_new_fragments(struct inode *inode, void *p, u64 fragment,
 	result = ufs_add_fragments (inode, tmp, oldcount, newcount, err);
 	if (result) {
 		*err = 0;
-		UFS_I(inode)->i_lastfrag = max_t(u32, UFS_I(inode)->i_lastfrag, fragment + count);
+		UFS_I(inode)->i_lastfrag = max_t(u64, UFS_I(inode)->i_lastfrag, fragment + count);
 		ufs_clear_frags(inode, result + oldcount, newcount - oldcount,
 				locked_page != NULL);
 		unlock_super(sb);
@@ -479,7 +479,7 @@ u64 ufs_new_fragments(struct inode *inode, void *p, u64 fragment,
 				   uspi->s_sbbase + result, locked_page);
 		ufs_cpu_to_data_ptr(sb, p, result);
 		*err = 0;
-		UFS_I(inode)->i_lastfrag = max_t(u32, UFS_I(inode)->i_lastfrag, fragment + count);
+		UFS_I(inode)->i_lastfrag = max_t(u64, UFS_I(inode)->i_lastfrag, fragment + count);
 		unlock_super(sb);
 		if (newcount < request)
 			ufs_free_fragments (inode, result + newcount, request - newcount);
diff --git a/fs/ufs/truncate.c b/fs/ufs/truncate.c
index a58f915..9b2a193 100644
--- a/fs/ufs/truncate.c
+++ b/fs/ufs/truncate.c
@@ -85,7 +85,7 @@ static int ufs_trunc_direct(struct inode *inode)
 	retry = 0;
 	
 	frag1 = DIRECT_FRAGMENT;
-	frag4 = min_t(u32, UFS_NDIR_FRAGMENT, ufsi->i_lastfrag);
+	frag4 = min_t(u64, UFS_NDIR_FRAGMENT, ufsi->i_lastfrag);
 	frag2 = ((frag1 & uspi->s_fpbmask) ? ((frag1 | uspi->s_fpbmask) + 1) : frag1);
 	frag3 = frag4 & ~uspi->s_fpbmask;
 	block1 = block2 = 0;
