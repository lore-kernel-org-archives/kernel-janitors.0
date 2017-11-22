From: Colin King <colin.king@canonical.com>
Date: Wed, 22 Nov 2017 14:40:48 +0000
Subject: [PATCH] USB: gadget: legacy: remove redundant zero assignment to variable 'value'
Message-Id: <20171122144048.30828-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable value is being assigned to zero but that value is never being
read.  Either value is being reassigned in the following if condition, or
it is never read and the function returns. In both cases the assignment is
redundant and can be removed. Cleans up clang warning:

drivers/usb/gadget/legacy/inode.c:1473:4: warning: Value stored to 'value'
is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/legacy/inode.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index 9343ec436485..cb8e1761d405 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1470,7 +1470,6 @@ gadgetfs_setup (struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 			dev->setup_wLength = w_length;
 			dev->setup_out_ready = 0;
 			dev->setup_out_error = 0;
-			value = 0;
 
 			/* read DATA stage for OUT right away */
 			if (unlikely (!dev->setup_in && w_length)) {
-- 
2.14.1

