From: Dan Carpenter <dan.carpenter@oracle.com>, Marcus Wolf <linux@Wolf-Entwicklungen.
Date: Wed, 19 Jul 2017 09:51:40 +0000
Subject: [PATCH] staging: pi433: return -EFAULT if copy_to_user() fails
Message-Id: <20170719095140.djfsklaxaqmjpcwv@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

copy_to_user() to user returns the number of bytes that weren't copied,
but we should be returning -EFAULT to the user.

Fixes: 874bcba65f9a ("staging: pi433: New driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 1bc478a7f49e..d49c152d52f8 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -689,7 +689,7 @@ pi433_read(struct file *filp, char __user *buf, size_t size, loff_t *f_pos)
 	{
 		retval = copy_to_user(buf, device->rx_buffer, bytes_received);
 		if (retval)
-			return retval;
+			return -EFAULT;
 	}
 
 	return bytes_received;
