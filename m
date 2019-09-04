From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Sep 2019 10:02:39 +0000
Subject: [PATCH] f2fs: signedness bug in f2fs_fname_setup_ci_filename()
Message-Id: <20190904100239.GC7007@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Cc: kernel-janitors@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

The error handling doesn't work because "cf_name->len" is unsigned.

Fixes: fbce5d4ab3ab ("f2fs: optimize case-insensitive lookups")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/f2fs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 9de688a4e115..c83b666f9d7e 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -157,7 +157,7 @@ void f2fs_fname_setup_ci_filename(struct inode *dir,
 	cf_name->len = utf8_casefold(sbi->s_encoding,
 					iname, cf_name->name,
 					F2FS_NAME_LEN);
-	if (cf_name->len <= 0) {
+	if ((int)cf_name->len <= 0) {
 		kvfree(cf_name->name);
 		cf_name->name = NULL;
 	}
-- 
2.20.1
