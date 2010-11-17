From: Dan Carpenter <error27@gmail.com>
Date: Wed, 17 Nov 2010 06:55:05 +0000
Subject: [patch] Staging: ft1000-usb: copying to wrong location
Message-Id: <20101117065505.GG31724@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

We made "dpram_data" a pointer ealier but missed one place which needs
to be changed.  It causes a compile error with
CONFIG_DEBUG_STRICT_USER_COPY_CHECKS=y

In function ‘copy_from_user’,
    inlined from ‘ft1000_ChIoctl’ at
	drivers/staging/ft1000/ft1000-usb/ft1000_chdev.c:701:
	arch/x86/include/asm/uaccess_32.h:212: 	error: call to
	‘copy_from_user_overflow’ declared with attribute error:
	copy_from_user() buffer size is not provably correct
make[4]: *** [drivers/staging/ft1000/ft1000-usb/ft1000_chdev.o] Error 1

Also I initialized "dpram_data" to NULL.  That silences a compiler
warning from where we pass uninitialized data to the kfree(dpram_data);

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/ft1000/ft1000-usb/ft1000_chdev.c b/drivers/staging/ft1000/ft1000-usb/ft1000_chdev.c
index 20d5098..d546750 100644
--- a/drivers/staging/ft1000/ft1000-usb/ft1000_chdev.c
+++ b/drivers/staging/ft1000/ft1000-usb/ft1000_chdev.c
@@ -650,7 +650,7 @@ static long ft1000_ChIoctl (struct file *File, unsigned int Command,
         break;
     case IOCTL_SET_DPRAM_CMD:
         {
-            IOCTL_DPRAM_BLK *dpram_data;
+            IOCTL_DPRAM_BLK *dpram_data = NULL;
             //IOCTL_DPRAM_COMMAND dpram_command;
             USHORT qtype;
             USHORT msgsz;
@@ -698,7 +698,7 @@ static long ft1000_ChIoctl (struct file *File, unsigned int Command,
 			break;
 
                 //if ( copy_from_user(&(dpram_command.dpram_blk), (PIOCTL_DPRAM_BLK)Argument, msgsz+2) ) {
-                if ( copy_from_user(&dpram_data, argp, msgsz+2) ) {
+                if (copy_from_user(dpram_data, argp, msgsz + 2)) {
                     DEBUG("FT1000:ft1000_ChIoctl: copy fault occurred\n");
                     result = -EFAULT;
                 }
