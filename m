From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 10 Dec 2016 09:06:25 +0000
Subject: [patch v2] parisc: perf: return -EFAULT on error
Message-Id: <20161210090625.GA12892@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAOmT4fTi+7r=1OJsumVC_+ET-NXcGjsZ5+t5ppm0eZZ2VeuF-A@mail.gmail.com>
In-Reply-To: <CAOmT4fTi+7r=1OJsumVC_+ET-NXcGjsZ5+t5ppm0eZZ2VeuF-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, kernel-janitors@vger.kernel.org

The copy_from_user() returns the number of bytes remaining to be copied
but we want to return -EFAULT if it's non-zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Fix unused variable warning.  Thanks, Bojan.

diff --git a/arch/parisc/kernel/perf.c b/arch/parisc/kernel/perf.c
index 518f4f5f1f43..6eabce62463b 100644
--- a/arch/parisc/kernel/perf.c
+++ b/arch/parisc/kernel/perf.c
@@ -301,7 +301,6 @@ static ssize_t perf_read(struct file *file, char __user *buf, size_t cnt, loff_t
 static ssize_t perf_write(struct file *file, const char __user *buf, size_t count, 
 	loff_t *ppos)
 {
-	int err;
 	size_t image_size;
 	uint32_t image_type;
 	uint32_t interface_type;
@@ -320,8 +319,8 @@ static ssize_t perf_write(struct file *file, const char __user *buf, size_t coun
 	if (count != sizeof(uint32_t))
 		return -EIO;
 
-	if ((err = copy_from_user(&image_type, buf, sizeof(uint32_t))) != 0) 
-		return err;
+	if (copy_from_user(&image_type, buf, sizeof(uint32_t)))
+		return -EFAULT;
 
 	/* Get the interface type and test type */
    	interface_type = (image_type >> 16) & 0xffff;
