From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Jan 2021 15:01:13 +0000
Subject: [PATCH] staging: gasket: Fix sizeof() in gasket_handle_ioctl()
Message-Id: <YAroue0qiuf35rkS@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Springer <rspringer@google.com>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Joseph <jnjoseph@google.com>, Simon Que <sque@chromium.org>, Richard Yeh <rcy@google.com>, Todd Poynor <toddpoynor@google.com>

The "gasket_dev->num_page_tables" variable is an int but this is copying
sizeof(u64).  On 32 bit systems this would end up disclosing a kernel
pointer to user space, but on 64 bit it copies zeroes from a struct
hole.

Fixes: 9a69f5087ccc ("drivers/staging: Gasket driver framework + Apex driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is an API change.  Please review this carefully!  Another potential
fix would be to make ->num_page_tables a long instead of an int.

 drivers/staging/gasket/gasket_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gasket/gasket_ioctl.c b/drivers/staging/gasket/gasket_ioctl.c
index e3047d36d8db..c4abac35c1ca 100644
--- a/drivers/staging/gasket/gasket_ioctl.c
+++ b/drivers/staging/gasket/gasket_ioctl.c
@@ -318,7 +318,7 @@ long gasket_handle_ioctl(struct file *filp, uint cmd, void __user *argp)
 	case GASKET_IOCTL_NUMBER_PAGE_TABLES:
 		trace_gasket_ioctl_integer_data(gasket_dev->num_page_tables);
 		if (copy_to_user(argp, &gasket_dev->num_page_tables,
-				 sizeof(uint64_t)))
+				 sizeof(gasket_dev->num_page_tables)))
 			retval = -EFAULT;
 		else
 			retval = 0;
-- 
2.29.2
