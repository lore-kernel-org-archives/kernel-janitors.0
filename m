From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 03 Sep 2019 19:30:31 +0000
Subject: [PATCH] ufs: Delete an unnecessary check before brelse()
Message-Id: <d57685d8-d0ce-4a53-177f-a98d116d2981@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Evgeniy Dushistov <dushistov@mail.ru>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 3 Sep 2019 21:27:55 +0200

The brelse() function tests whether its argument is NULL
and then returns immediately.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ufs/super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ufs/super.c b/fs/ufs/super.c
index 1da0be667409..20799faa307a 100644
--- a/fs/ufs/super.c
+++ b/fs/ufs/super.c
@@ -574,8 +574,7 @@ static int ufs_read_cylinder_structures(struct super_block *sb)
 	kfree (base);
 	if (sbi->s_ucg) {
 		for (i = 0; i < uspi->s_ncg; i++)
-			if (sbi->s_ucg[i])
-				brelse (sbi->s_ucg[i]);
+			brelse(sbi->s_ucg[i]);
 		kfree (sbi->s_ucg);
 		for (i = 0; i < UFS_MAX_GROUP_LOADED; i++)
 			kfree (sbi->s_ucpi[i]);
--
2.23.0
