From: Colin King <colin.king@canonical.com>
Date: Fri, 01 Jun 2018 13:31:17 +0000
Subject: [PATCH] drivers/fmc: make struct fmc_dbgfs_sdb_dump static
Message-Id: <20180601133117.6511-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Rubini <rubini@gnudd.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The structure fmc_dbgfs_sdb_dump is local to the source and does not
need to be in global scope, so make it static.

Cleans up sparse warning:
drivers/fmc/fmc-debug.c:143:30: warning: symbol 'fmc_dbgfs_sdb_dump'
was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/fmc/fmc-debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fmc/fmc-debug.c b/drivers/fmc/fmc-debug.c
index 32930722770c..c96b928f0112 100644
--- a/drivers/fmc/fmc-debug.c
+++ b/drivers/fmc/fmc-debug.c
@@ -140,7 +140,7 @@ static int fmc_sdb_dump_open(struct inode *inode, struct file *file)
 }
 
 
-const struct file_operations fmc_dbgfs_sdb_dump = {
+static const struct file_operations fmc_dbgfs_sdb_dump = {
 	.owner = THIS_MODULE,
 	.open  = fmc_sdb_dump_open,
 	.read = seq_read,
-- 
2.17.0

