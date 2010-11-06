From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sat, 06 Nov 2010 14:41:35 +0000
Subject: [PATCH] usb: misc: sisusbvga: fix information leak to userland
Message-Id: <1289054496-18323-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Thomas Winischhofer <thomas@winischhofer.net>, Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Structure sisusb_info is copied to userland with "sisusb_reserved" field
uninitialized.  It leads to leaking of contents of kernel stack memory.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/usb/misc/sisusbvga/sisusb.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
index 70d00e9..dd573ab 100644
--- a/drivers/usb/misc/sisusbvga/sisusb.c
+++ b/drivers/usb/misc/sisusbvga/sisusb.c
@@ -3008,6 +3008,7 @@ sisusb_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 #else
 			x.sisusb_conactive  = 0;
 #endif
+			memset(x.sisusb_reserved, 0, sizeof(x.sisusb_reserved));
 
 			if (copy_to_user((void __user *)arg, &x, sizeof(x)))
 				retval = -EFAULT;
-- 
1.7.0.4

