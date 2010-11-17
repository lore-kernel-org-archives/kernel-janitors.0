From: Dan Carpenter <error27@gmail.com>
Date: Wed, 17 Nov 2010 08:54:35 +0000
Subject: [patch] Staging: ft1000-usb: freeing uninitialized pointer
Message-Id: <20101117085435.GI31724@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

GCC complains that if (info->CardReady) is false we kfree() an
uninitialized pointer.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/ft1000/ft1000-usb/ft1000_chdev.c b/drivers/staging/ft1000/ft1000-usb/ft1000_chdev.c
index 7b496332..76cee9e 100644
--- a/drivers/staging/ft1000/ft1000-usb/ft1000_chdev.c
+++ b/drivers/staging/ft1000/ft1000-usb/ft1000_chdev.c
@@ -650,7 +650,7 @@ static long ft1000_ChIoctl (struct file *File, unsigned int Command,
         break;
     case IOCTL_SET_DPRAM_CMD:
         {
-            IOCTL_DPRAM_BLK *dpram_data;
+            IOCTL_DPRAM_BLK *dpram_data = NULL;
             //IOCTL_DPRAM_COMMAND dpram_command;
             u16 qtype;
             u16 msgsz;
