From: Dan Carpenter <error27@gmail.com>
Date: Thu, 03 Jun 2010 10:04:37 +0000
Subject: [patch] Staging: batman-adv: return -EFAULT on copy_to_user errors
Message-Id: <20100603100437.GS5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

copy_to_user() returns the number of bites remaining but we want to
return a negative error code here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/batman-adv/device.c b/drivers/staging/batman-adv/device.c
index ad82ec4..c7f3978 100644
--- a/drivers/staging/batman-adv/device.c
+++ b/drivers/staging/batman-adv/device.c
@@ -196,7 +196,7 @@ ssize_t bat_device_read(struct file *file, char __user *buf, size_t count,
 	kfree(device_packet);
 
 	if (error)
-		return error;
+		return -EFAULT;
 
 	return sizeof(struct icmp_packet);
 }
