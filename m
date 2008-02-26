From: Julia Lawall <julia@diku.dk>
Date: Tue, 26 Feb 2008 20:46:19 +0000
Subject: [PATCH 9/9] fs/reiserfs/super.c: Correct use of.and &
Message-Id: <Pine.LNX.4.64.0802262145580.18200@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-dev@namesys.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In commit e6bafba5b4765a5a252f1b8d31cbf6d2459da337, a bug was fixed that
involved converting !x & y to !(x & y).  The code below shows the same
pattern, and thus should perhaps be fixed in the same way.

This is not tested and clearly changes the semantics, so it is only
something to consider.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@ expression E1,E2; @@
(
  !E1 & !E2
|
- !E1 & E2
+ !(E1 & E2)
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/fs/reiserfs/super.c b/fs/reiserfs/super.c
--- a/fs/reiserfs/super.c 2008-02-16 18:06:38.000000000 +0100
+++ b/fs/reiserfs/super.c 2008-02-26 08:17:07.000000000 +0100
@@ -2031,7 +2031,7 @@ static int reiserfs_quota_on(struct supe
 		return -EXDEV;
 	}
 	/* We must not pack tails for quota files on reiserfs for quota IO to work */
-	if (!REISERFS_I(nd.path.dentry->d_inode)->i_flags & i_nopack_mask) {
+	if (!(REISERFS_I(nd.path.dentry->d_inode)->i_flags & i_nopack_mask)) {
 		reiserfs_warning(sb,
 				 "reiserfs: Quota file must have tail packing disabled.");
 		path_put(&nd.path);
