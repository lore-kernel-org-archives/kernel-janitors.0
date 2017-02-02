From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Feb 2017 11:51:48 +0000
Subject: [PATCH] usb: misc: adutux: remove redundant error check on copy_to_user return code
Message-Id: <20170202115148.29149-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa-dev@sang-engineering.com>, Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The 2nd check for a non-zero return from copy_to_user is redundant as
it is has already been made a few lines earlier.  This check was made
redundant because of previous fix to the copy_to_user error return
check.

Detected by CoverityScan, CID#114347 ("Logically Dead Code")

Fixes: 1865a9c382ede ("USB: adutux: fix misuse of return value of copy_to_user()")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/misc/adutux.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
index 43a677f..c5fa584 100644
--- a/drivers/usb/misc/adutux.c
+++ b/drivers/usb/misc/adutux.c
@@ -389,10 +389,6 @@ static ssize_t adu_read(struct file *file, __user char *buffer, size_t count,
 			dev->secondary_head += (amount - i);
 			bytes_read += (amount - i);
 			bytes_to_read -= (amount - i);
-			if (i) {
-				retval = bytes_read ? bytes_read : -EFAULT;
-				goto exit;
-			}
 		} else {
 			/* we check the primary buffer */
 			spin_lock_irqsave (&dev->buflock, flags);
-- 
2.10.2

