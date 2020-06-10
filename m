From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Jun 2020 17:22:13 +0000
Subject: [PATCH v2] exfat: add missing brelse() calls on error paths
Message-Id: <20200610172213.GA90634@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <6939014a-adbf-f970-2541-df16d35de7e5@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Namjae Jeon <namjae.jeon@samsung.com>, Sungjong Seo <sj1557.seo@samsung.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Tetsuhiro Kohada <kohada.t2@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>

If the second exfat_get_dentry() call fails then we need to release
"old_bh" before returning.  There is a similar bug in exfat_move_file().

Fixes: 5f2aa075070c ("exfat: add inode operations")
Reported-by: Markus Elfring <Markus.Elfring@web.de>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: fix exfat_move_file() as well.  Also add a Fixes tag.

 fs/exfat/namei.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index 5b0f35329d63e..edd8023865a0e 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -1077,10 +1077,14 @@ static int exfat_rename_file(struct inode *inode, struct exfat_chain *p_dir,
 
 		epold = exfat_get_dentry(sb, p_dir, oldentry + 1, &old_bh,
 			&sector_old);
+		if (!epold)
+			return -EIO;
 		epnew = exfat_get_dentry(sb, p_dir, newentry + 1, &new_bh,
 			&sector_new);
-		if (!epold || !epnew)
+		if (!epnew) {
+			brelse(old_bh);
 			return -EIO;
+		}
 
 		memcpy(epnew, epold, DENTRY_SIZE);
 		exfat_update_bh(sb, new_bh, sync);
@@ -1161,10 +1165,14 @@ static int exfat_move_file(struct inode *inode, struct exfat_chain *p_olddir,
 
 	epmov = exfat_get_dentry(sb, p_olddir, oldentry + 1, &mov_bh,
 		&sector_mov);
+	if (!epmov)
+		return -EIO;
 	epnew = exfat_get_dentry(sb, p_newdir, newentry + 1, &new_bh,
 		&sector_new);
-	if (!epmov || !epnew)
+	if (!epnew) {
+		brelse(mov_bh);
 		return -EIO;
+	}
 
 	memcpy(epnew, epmov, DENTRY_SIZE);
 	exfat_update_bh(sb, new_bh, IS_DIRSYNC(inode));
-- 
2.26.2
