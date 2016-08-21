From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Aug 2016 14:06:22 +0000
Subject: [PATCH 7/7] USB-iowarrior: Apply another recommendation from "checkpatch.pl"
Message-Id: <c31a3089-c8c5-d271-d51e-b1babbe9b9aa@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5f6dd0dd-820e-c3d3-a88d-a16ad5e64aa8@users.sourceforge.net>
In-Reply-To: <5f6dd0dd-820e-c3d3-a88d-a16ad5e64aa8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Josh Boyer <jwboyer@fedoraproject.org>, Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Aug 2016 15:30:11 +0200

The script "checkpatch.pl" can point out that assignments should usually
not be performed within condition checks.
Thus move the assignments for two local variables to separate statements.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/misc/iowarrior.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
index 132c8cf..78b5d65 100644
--- a/drivers/usb/misc/iowarrior.c
+++ b/drivers/usb/misc/iowarrior.c
@@ -292,7 +292,8 @@ static ssize_t iowarrior_read(struct file *file, char __user *buffer,
 	/* repeat until no buffer overrun in callback handler occur */
 	do {
 		atomic_set(&dev->overflow_flag, 0);
-		if ((read_idx = read_index(dev)) = -1) {
+		read_idx = read_index(dev);
+		if (read_idx = -1) {
 			/* queue empty */
 			if (file->f_flags & O_NONBLOCK)
 				return -EAGAIN;
@@ -616,7 +617,8 @@ static int iowarrior_open(struct inode *inode, struct file *file)
 	}
 
 	/* setup interrupt handler for receiving values */
-	if ((retval = usb_submit_urb(dev->int_in_urb, GFP_KERNEL)) < 0) {
+	retval = usb_submit_urb(dev->int_in_urb, GFP_KERNEL);
+	if (retval < 0) {
 		dev_err(&interface->dev, "Error %d while submitting URB\n", retval);
 		retval = -EFAULT;
 		goto out;
-- 
2.9.3

