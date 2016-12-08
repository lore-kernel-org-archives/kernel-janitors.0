From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Dec 2016 11:32:00 +0000
Subject: [patch] parisc: perf: return -EFAULT on error
Message-Id: <20161208113200.GC11382@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, kernel-janitors@vger.kernel.org

The copy_from_user() returns the number of bytes remaining to be copied
but we want to return -EFAULT if it's non-zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/parisc/kernel/perf.c b/arch/parisc/kernel/perf.c
index 518f4f5f1f43..76c96a53fc71 100644
--- a/arch/parisc/kernel/perf.c
+++ b/arch/parisc/kernel/perf.c
@@ -320,8 +320,8 @@ static ssize_t perf_write(struct file *file, const char __user *buf, size_t coun
 	if (count != sizeof(uint32_t))
 		return -EIO;
 
-	if ((err = copy_from_user(&image_type, buf, sizeof(uint32_t))) != 0) 
-		return err;
+	if (copy_from_user(&image_type, buf, sizeof(uint32_t)))
+		return -EFAULT;
 
 	/* Get the interface type and test type */
    	interface_type = (image_type >> 16) & 0xffff;
