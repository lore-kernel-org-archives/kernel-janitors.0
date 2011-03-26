From: Dan Carpenter <error27@gmail.com>
Date: Sat, 26 Mar 2011 01:47:35 +0000
Subject: [patch] HID: fix a tab problem
Message-Id: <20110326014735.GE2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There was an extra tab so the close curly brace didn't match up with
the right if statement.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index af0a7c1..5270031 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -509,7 +509,7 @@ static noinline int hiddev_ioctl_usage(struct hiddev *hiddev, unsigned int cmd,
 				 (uref_multi->num_values > HID_MAX_MULTI_USAGES ||
 				  uref->usage_index + uref_multi->num_values > field->report_count))
 				goto inval;
-			}
+		}
 
 		switch (cmd) {
 		case HIDIOCGUSAGE:
