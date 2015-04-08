From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Apr 2015 11:19:00 +0000
Subject: [patch] staging: rtl8712: freeing an ERR_PTR
Message-Id: <20150408111900.GA27747@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If memdup_user() fails then "pparmbuf" is an error pointer and we can't
pass it to kfree().  I changed the "goto _r871x_mp_ioctl_hdl_exit" to a
direct return.

I changed the earlier goto to a direct return as well for consistency
and removed the "pparmbuf = NULL" initializer since it's no longer
needed.

Fixes: 45de432775d6 ('Staging: rtl8712: Use memdup_user() instead of copy_from_user()')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The memdup_user() patch was never sent to the list so Greg gets ten
lashes with a wet noodle for missing this bug.

Also this is a typical one err bug except for the worse than usual label
name.  Using "one err" style error handling was supposed to prevent bugs
from being introduced in the future but instead it caused a future bug.

diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
index 42fba3f..cb0b63877 100644
--- a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
+++ b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
@@ -1900,23 +1900,20 @@ static int r871x_mp_ioctl_hdl(struct net_device *dev,
 	struct mp_ioctl_handler *phandler;
 	struct mp_ioctl_param *poidparam;
 	unsigned long BytesRead, BytesWritten, BytesNeeded;
-	u8 *pparmbuf = NULL, bset;
+	u8 *pparmbuf, bset;
 	u16 len;
 	uint status;
 	int ret = 0;
 
-	if ((!p->length) || (!p->pointer)) {
-		ret = -EINVAL;
-		goto _r871x_mp_ioctl_hdl_exit;
-	}
+	if ((!p->length) || (!p->pointer))
+		return -EINVAL;
+
 	bset = (u8)(p->flags & 0xFFFF);
 	len = p->length;
-	pparmbuf = NULL;
 	pparmbuf = memdup_user(p->pointer, len);
-	if (IS_ERR(pparmbuf)) {
-		ret = PTR_ERR(pparmbuf);
-		goto _r871x_mp_ioctl_hdl_exit;
-	}
+	if (IS_ERR(pparmbuf))
+		return PTR_ERR(pparmbuf);
+
 	poidparam = (struct mp_ioctl_param *)pparmbuf;
 	if (poidparam->subcode >= MAX_MP_IOCTL_SUBCODE) {
 		ret = -EINVAL;
