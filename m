From: Julia Lawall <julia@diku.dk>
Date: Tue, 28 Jul 2009 15:54:58 +0000
Subject: [PATCH 6/9] fs/romfs: correct error-handling code
Message-Id: <Pine.LNX.4.64.0907281754250.28189@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

romfs_iget returns an ERR_PTR value in an error case instead of NULL.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@match exists@
expression x, E;
statement S1, S2;
@@

x = romfs_iget(...)
... when != x = E
(
*  if (x = NULL || ...) S1 else S2
|
*  if (x = NULL && ...) S1 else S2
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/romfs/super.c                    |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/romfs/super.c b/fs/romfs/super.c
index 4ab3c03..7f733fb 100644
--- a/fs/romfs/super.c
+++ b/fs/romfs/super.c
@@ -528,7 +528,7 @@ static int romfs_fill_super(struct super_block *sb, void *data, int silent)
 	pos = (ROMFH_SIZE + len + 1 + ROMFH_PAD) & ROMFH_MASK;
 
 	root = romfs_iget(sb, pos);
-	if (!root)
+	if (IS_ERR(root))
 		goto error;
 
 	sb->s_root = d_alloc_root(root);
