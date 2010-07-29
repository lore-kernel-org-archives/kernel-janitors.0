From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 29 Jul 2010 15:54:44 +0000
Subject: [PATCH] cpqarray: check put_user() result
Message-Id: <1280418885-5630-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Chirag Kantharia <chirag.kantharia@hp.com>, Jens Axboe <jaxboe@fusionio.com>, Andrew Morton <akpm@linux-foundation.org>, Alexey Dobriyan <adobriyan@gmail.com>, Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>, iss_storagedev@hp.com, linux-kernel@vger.kernel.org

put_user() may fail, if so return -EFAULT.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/block/cpqarray.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/block/cpqarray.c b/drivers/block/cpqarray.c
index 9473215..d53b029 100644
--- a/drivers/block/cpqarray.c
+++ b/drivers/block/cpqarray.c
@@ -1179,7 +1179,8 @@ out_passthru:
 		return error;
 	case IDAGETCTLRSIG:
 		if (!arg) return -EINVAL;
-		put_user(host->ctlr_sig, (int __user *)arg);
+		if (put_user(host->ctlr_sig, (int __user *)arg))
+			return -EFAULT;
 		return 0;
 	case IDAREVALIDATEVOLS:
 		if (MINOR(bdev->bd_dev) != 0)
@@ -1187,7 +1188,8 @@ out_passthru:
 		return revalidate_allvol(host);
 	case IDADRIVERVERSION:
 		if (!arg) return -EINVAL;
-		put_user(DRIVER_VERSION, (unsigned long __user *)arg);
+		if (put_user(DRIVER_VERSION, (unsigned long __user *)arg))
+			return -EFAULT;
 		return 0;
 	case IDAGETPCIINFO:
 	{
-- 
1.7.0.4

