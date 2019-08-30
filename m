From: Colin King <colin.king@canonical.com>
Date: Fri, 30 Aug 2019 18:46:44 +0000
Subject: [PATCH] staging: exfat: fix uninitialized variable ret
Message-Id: <20190830184644.15590-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis Kletnieks <valdis.kletnieks@vt.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently there are error return paths in ffsReadFile that
exit via lable err_out that return and uninitialized error
return in variable ret. Fix this by initializing ret to zero.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: c48c9f7ff32b ("staging: exfat: add exfat filesystem code to staging")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/exfat/exfat_super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 5b3c4dfe0ecc..6939aa4f25ee 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -771,7 +771,7 @@ static int ffsReadFile(struct inode *inode, struct file_id_t *fid, void *buffer,
 {
 	s32 offset, sec_offset, clu_offset;
 	u32 clu;
-	int ret;
+	int ret = 0;
 	sector_t LogSector;
 	u64 oneblkread, read_bytes;
 	struct buffer_head *tmp_bh = NULL;
-- 
2.20.1
