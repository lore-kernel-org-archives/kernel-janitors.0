From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Feb 2014 19:56:06 +0000
Subject: [patch 1/2] staging/bcm: two information leaks in ioctl
Message-Id: <20140217195606.GA32630@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There are a couple paths where we don't check how much data we copy back
to the user.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/bcm/Bcmchar.c b/drivers/staging/bcm/Bcmchar.c
index fdebc3bba0b5..6f1997dc44c8 100644
--- a/drivers/staging/bcm/Bcmchar.c
+++ b/drivers/staging/bcm/Bcmchar.c
@@ -590,6 +590,8 @@ static int bcm_char_ioctl_gpio_multi_request(void __user *argp, struct bcm_mini_
 
 	if (IoBuffer.InputLength > sizeof(gpio_multi_info))
 		return -EINVAL;
+	if (IoBuffer.OutputLength > sizeof(gpio_multi_info))
+		IoBuffer.OutputLength = sizeof(gpio_multi_info);
 
 	if (copy_from_user(&gpio_multi_info, IoBuffer.InputBuffer, IoBuffer.InputLength))
 		return -EFAULT;
@@ -680,6 +682,8 @@ static int bcm_char_ioctl_gpio_mode_request(void __user *argp, struct bcm_mini_a
 
 	if (IoBuffer.InputLength > sizeof(gpio_multi_mode))
 		return -EINVAL;
+	if (IoBuffer.OutputLength > sizeof(gpio_multi_mode))
+		IoBuffer.OutputLength = sizeof(gpio_multi_mode);
 
 	if (copy_from_user(&gpio_multi_mode, IoBuffer.InputBuffer, IoBuffer.InputLength))
 		return -EFAULT;
