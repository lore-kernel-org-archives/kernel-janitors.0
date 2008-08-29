From: Julien Brunel <brunel@diku.dk>
Date: Fri, 29 Aug 2008 09:08:32 +0000
Subject: [PATCH] fs/ubifs: Use an IS_ERR test rather than a NULL test
Message-Id: <200808291108.32958.brunel@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dedekind@infradead.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julien Brunel <brunel@diku.dk>

In case of error, the function kthread_create returns an ERR pointer,
but never returns a NULL pointer. So a NULL test that comes before an
IS_ERR test should be deleted.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@match_bad_null_test@
expression x, E;
statement S1,S2;
@@
x = kthread_create(...)
... when != x = E
* if (x = NULL) 
S1 else S2
// </smpl>

Signed-off-by:  Julien Brunel <brunel@diku.dk>
Signed-off-by:  Julia Lawall <julia@diku.dk>

---
 fs/ubifs/super.c |    4 ----
 1 file changed, 4 deletions(-)

diff -u -p a/fs/ubifs/super.c b/fs/ubifs/super.c
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1027,8 +1027,6 @@ static int mount_ubifs(struct ubifs_info
 		sprintf(c->bgt_name, BGT_NAME_PATTERN, c->vi.ubi_num,
 			c->vi.vol_id);
 		c->bgt = kthread_create(ubifs_bg_thread, c, c->bgt_name);
-		if (!c->bgt)
-			c->bgt = ERR_PTR(-EINVAL);
 		if (IS_ERR(c->bgt)) {
 			err = PTR_ERR(c->bgt);
 			c->bgt = NULL;
@@ -1340,8 +1338,6 @@ static int ubifs_remount_rw(struct ubifs
 
 	/* Create background thread */
 	c->bgt = kthread_create(ubifs_bg_thread, c, c->bgt_name);
-	if (!c->bgt)
-		c->bgt = ERR_PTR(-EINVAL);
 	if (IS_ERR(c->bgt)) {
 		err = PTR_ERR(c->bgt);
 		c->bgt = NULL;
