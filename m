From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Nov 2019 23:31:20 +0000
Subject: [PATCH] fsi: fix bogos error returns from cfam_read and cfam_write
Message-Id: <20191122233120.110344-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>, Alistar Popple <alistair@popple.id.au>, Eddie James <eajames@linux.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-fsi@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where errors occur in functions cfam_read and cfam_write
the error return code in rc is not returned and a bogus non-error
count size is returned instead. Fix this by returning the correct
error code when an error occurs or the count size if the functions
worked correctly.

Addresses-Coverity: ("Unused value")
Fixes: d1dcd6782576 ("fsi: Add cfam char devices")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/fsi/fsi-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 8244da8a7241..c3885b138ead 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -718,7 +718,7 @@ static ssize_t cfam_read(struct file *filep, char __user *buf, size_t count,
 	rc = count;
  fail:
 	*offset = off;
-	return count;
+	return rc;
 }
 
 static ssize_t cfam_write(struct file *filep, const char __user *buf,
@@ -755,7 +755,7 @@ static ssize_t cfam_write(struct file *filep, const char __user *buf,
 	rc = count;
  fail:
 	*offset = off;
-	return count;
+	return rc;
 }
 
 static loff_t cfam_llseek(struct file *file, loff_t offset, int whence)
-- 
2.24.0
