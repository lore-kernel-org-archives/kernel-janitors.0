From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 31 Jul 2010 17:39:46 +0000
Subject: [PATCH 6/7] usb: iowarrior: fix misuse of return value of copy_to_user()
Message-Id: <1280597987-8565-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Oliver Neukum <oliver@neukum.org>, Mauro Carvalho Chehab <mchehab@redhat.com>, Daniel Mack <daniel@caiaq.de>, Kay Sievers <kay.sievers@vrfy.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

copy_to_user() returns number of not copied bytes, not error code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/usb/misc/iowarrior.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
index 2de49c8..bc88c79 100644
--- a/drivers/usb/misc/iowarrior.c
+++ b/drivers/usb/misc/iowarrior.c
@@ -542,7 +542,7 @@ static long iowarrior_ioctl(struct file *file, unsigned int cmd,
 			retval = io_res;
 		else {
 			io_res = copy_to_user(user_buffer, buffer, dev->report_size);
-			if (io_res < 0)
+			if (io_res)
 				retval = -EFAULT;
 		}
 		break;
@@ -574,7 +574,7 @@ static long iowarrior_ioctl(struct file *file, unsigned int cmd,
 			}
 			io_res = copy_to_user((struct iowarrior_info __user *)arg, &info,
 					 sizeof(struct iowarrior_info));
-			if (io_res < 0)
+			if (io_res)
 				retval = -EFAULT;
 			break;
 		}
-- 
1.7.0.4

