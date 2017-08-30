From: Colin King <colin.king@canonical.com>
Date: Wed, 30 Aug 2017 17:42:55 +0000
Subject: [PATCH] drivers/fmc: make structure fmc_dbgfs_sdb_dump static and include fmc-private.h
Message-Id: <20170830174255.6844-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Rubini <rubini@gnudd.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The structure fmc_dbgfs_sdb_dump is local to the source and does not
need to be in global scope, so make it static.  Also, fmc-private.h
should be included to fix up two sparse warnings on fmc_debug_init
and fmc_debug_exit.

Cleans up sparse warnings:
symbol 'fmc_dbgfs_sdb_dump' was not declared. Should it be static?
symbol 'fmc_debug_init' was not declared. Should it be static?
symbol 'fmc_debug_exit' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/fmc/fmc-debug.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/fmc/fmc-debug.c b/drivers/fmc/fmc-debug.c
index 32930722770c..06c43c1e8899 100644
--- a/drivers/fmc/fmc-debug.c
+++ b/drivers/fmc/fmc-debug.c
@@ -17,6 +17,8 @@
 #include <linux/sdb.h>
 #include <linux/fmc-sdb.h>
 
+#include "fmc-private.h"
+
 #define FMC_DBG_SDB_DUMP "dump_sdb"
 
 static char *__strip_trailing_space(char *buf, char *str, int len)
@@ -140,7 +142,7 @@ static int fmc_sdb_dump_open(struct inode *inode, struct file *file)
 }
 
 
-const struct file_operations fmc_dbgfs_sdb_dump = {
+static const struct file_operations fmc_dbgfs_sdb_dump = {
 	.owner = THIS_MODULE,
 	.open  = fmc_sdb_dump_open,
 	.read = seq_read,
-- 
2.14.1

