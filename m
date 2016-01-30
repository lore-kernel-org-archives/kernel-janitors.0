From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 30 Jan 2016 14:34:55 +0000
Subject: [patch] USB: cxacru: fix an bounds check warning
Message-Id: <20160130143455.GA3462@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aaron Raimist <aaronraimist@riseup.net>, accessrunner-general@lists.sourceforge.net, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a privileged operation so it doesn't matter much.  We use "tmp"
as an offset into an array.  If it were invalid we could read out of
bounds and trigger an oops if the memory is not mapped.  Plus it makes
static checkers complain.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This changes the behavior a little bit because in the original we could
give slightly invalid "len" values and the function would still work...

Please review it extra carefully to make sure it doesn't break
userspace.

diff --git a/drivers/usb/atm/cxacru.c b/drivers/usb/atm/cxacru.c
index 1173f9c..0a866e9 100644
--- a/drivers/usb/atm/cxacru.c
+++ b/drivers/usb/atm/cxacru.c
@@ -476,6 +476,8 @@ static ssize_t cxacru_sysfs_store_adsl_config(struct device *dev,
 			return -EINVAL;
 		if (index < 0 || index > 0x7f)
 			return -EINVAL;
+		if (tmp < 0 || tmp > len - pos)
+			return -EINVAL;
 		pos += tmp;
 
 		/* skip trailing newline */
