From: Ben Werbowyj <ben.werbowyj@gmail.com>
Date: Sat, 23 Jul 2016 04:11:29 +0000
Subject: [PATCH 2/2] drivers: w1: insert blank line after declaration
Message-Id: <1469247089-8093-3-git-send-email-ben.werbowyj@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Coding style correction as indentified by the checkpatch.pl script.
Blank line added after variable declaration.

Signed-off-by: Ben Werbowyj <ben.werbowyj@gmail.com>
---
 drivers/w1/slaves/w1_ds2406.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/w1/slaves/w1_ds2406.c b/drivers/w1/slaves/w1_ds2406.c
index d37a6e6..ee41007 100644
--- a/drivers/w1/slaves/w1_ds2406.c
+++ b/drivers/w1/slaves/w1_ds2406.c
@@ -139,6 +139,7 @@ static int w1_f12_add_slave(struct w1_slave *sl)
 static void w1_f12_remove_slave(struct w1_slave *sl)
 {
 	int i;
+
 	for (i = NB_SYSFS_BIN_FILES - 1; i >= 0; --i)
 		sysfs_remove_bin_file(&sl->dev.kobj,
 			&(w1_f12_sysfs_bin_files[i]));
-- 
2.1.4

