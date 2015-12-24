From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Dec 2015 07:23:03 +0000
Subject: [patch 1/2] ACPI / debugger: remove some unneeded conditions
Message-Id: <20151224072303.GA29642@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lv Zheng <lv.zheng@intel.com>
Cc: Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"count" is unsigned so checking for less than zero here causes a static
checker warning.  And really it's better to let the access_ok() check
fail if the user passes in a NULL "buf" pointer because -EFAULT is the
correct error code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/acpi/acpi_dbg.c b/drivers/acpi/acpi_dbg.c
index 381beb2..f2c92ab 100644
--- a/drivers/acpi/acpi_dbg.c
+++ b/drivers/acpi/acpi_dbg.c
@@ -610,8 +610,6 @@ static ssize_t acpi_aml_read(struct file *file, char __user *buf,
 	int ret = 0;
 	int size = 0;
 
-	if (!buf || count < 0)
-		return -EINVAL;
 	if (!count)
 		return 0;
 	if (!access_ok(VERIFY_WRITE, buf, count))
@@ -681,8 +679,6 @@ static ssize_t acpi_aml_write(struct file *file, const char __user *buf,
 	int ret = 0;
 	int size = 0;
 
-	if (!buf || count < 0)
-		return -EINVAL;
 	if (!count)
 		return 0;
 	if (!access_ok(VERIFY_READ, buf, count))
