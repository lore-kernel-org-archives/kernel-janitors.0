From: Colin King <colin.king@canonical.com>
Date: Mon, 26 Jun 2017 09:10:03 +0000
Subject: [PATCH][-next] platform/chrome: make a couple of structures static
Message-Id: <20170626091003.9341-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Olof Johansson <olof@lixom.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The structures cros_ec_console_log_fops and cros_ec_lpc_pm_ops do
not need to be in global scope, so make them static.

Cleans up sparse warnings:
"symbol 'cros_ec_console_log_fops' was not declared. Should it be static?"
"symbol 'cros_ec_lpc_pm_ops' was not declared. Should it be static?"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/chrome/cros_ec_debugfs.c | 2 +-
 drivers/platform/chrome/cros_ec_lpc.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_debugfs.c b/drivers/platform/chrome/cros_ec_debugfs.c
index 4cc66f405760..c4717017f935 100644
--- a/drivers/platform/chrome/cros_ec_debugfs.c
+++ b/drivers/platform/chrome/cros_ec_debugfs.c
@@ -214,7 +214,7 @@ static int cros_ec_console_log_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
-const struct file_operations cros_ec_console_log_fops = {
+static const struct file_operations cros_ec_console_log_fops = {
 	.owner = THIS_MODULE,
 	.open = cros_ec_console_log_open,
 	.read = cros_ec_console_log_read,
diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chrome/cros_ec_lpc.c
index eeb187e558ce..3eb110bb4424 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -381,7 +381,7 @@ static int cros_ec_lpc_resume(struct device *dev)
 }
 #endif
 
-const struct dev_pm_ops cros_ec_lpc_pm_ops = {
+static const struct dev_pm_ops cros_ec_lpc_pm_ops = {
 	SET_LATE_SYSTEM_SLEEP_PM_OPS(cros_ec_lpc_suspend, cros_ec_lpc_resume)
 };
 
-- 
2.11.0

