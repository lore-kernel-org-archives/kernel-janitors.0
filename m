From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 03 Sep 2019 14:20:43 +0000
Subject: [PATCH] ntfs: Delete unnecessary checks before brelse()
Message-Id: <9d047687-af84-4688-c025-13103cc22a52@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <43a59c6a-3635-1fab-1945-292d637663c9@web.de>
In-Reply-To: <43a59c6a-3635-1fab-1945-292d637663c9@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ntfs-dev@lists.sourceforge.net, Anton Altaparmakov <anton@tuxera.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 3 Sep 2019 16:18:07 +0200

The brelse() function tests whether its argument is NULL
and then returns immediately.
Thus the tests around the shown calls are not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ntfs/super.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
index 29621d40f448..f0ed1a3e5c7e 100644
--- a/fs/ntfs/super.c
+++ b/fs/ntfs/super.c
@@ -676,8 +676,7 @@ static struct buffer_head *read_ntfs_boot_sector(struct super_block *sb,
 	} else if (!silent)
 		ntfs_error(sb, read_err_str, "primary");
 	if (!(NTFS_SB(sb)->on_errors & ON_ERRORS_RECOVER)) {
-		if (bh_primary)
-			brelse(bh_primary);
+		brelse(bh_primary);
 		if (!silent)
 			ntfs_error(sb, "Mount option errors=recover not used. "
 					"Aborting without trying to recover.");
@@ -703,8 +702,7 @@ static struct buffer_head *read_ntfs_boot_sector(struct super_block *sb,
 	} else if (!silent)
 		ntfs_error(sb, read_err_str, "backup");
 	/* We failed. Cleanup and return. */
-	if (bh_primary)
-		brelse(bh_primary);
+	brelse(bh_primary);
 	return NULL;
 hotfix_primary_boot_sector:
 	if (bh_primary) {
--
2.23.0
