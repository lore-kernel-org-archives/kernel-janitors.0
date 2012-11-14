From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Wed, 14 Nov 2012 11:49:37 +0000
Subject: [PATCH v2] staging: dgrp: dgrp_tty.c: return an -EFAULT if put_user fails
Message-Id: <1352893057-27226-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alan@lxorguk.ukuu.org.uk
Cc: gregkh@linuxfoundation.org, wfp5p@virginia.edu, geert@linux-m68k.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Inspect the return value of put_user() and return -EFAULT on error.

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 drivers/staging/dgrp/dgrp_tty.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/dgrp/dgrp_tty.c b/drivers/staging/dgrp/dgrp_tty.c
index e125b03..cebd3a1 100644
--- a/drivers/staging/dgrp/dgrp_tty.c
+++ b/drivers/staging/dgrp/dgrp_tty.c
@@ -2265,9 +2265,7 @@ static int get_modem_info(struct ch_struct *ch, unsigned int *value)
 		| ((mlast & DM_RI)  ? TIOCM_RNG : 0)
 		| ((mlast & DM_DSR) ? TIOCM_DSR : 0)
 		| ((mlast & DM_CTS) ? TIOCM_CTS : 0);
-	put_user(mlast, (unsigned int __user *) value);
-
-	return 0;
+	return put_user(mlast, (unsigned int __user *) value);
 }
 
 /*
@@ -2620,7 +2618,8 @@ static int dgrp_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 			       sizeof(long));
 		if (rc = 0)
 			return -EFAULT;
-		put_user(C_CLOCAL(tty) ? 1 : 0, (unsigned long __user *) arg);
+		if (put_user(C_CLOCAL(tty) ? 1 : 0, (unsigned long __user *) arg))
+			return -EFAULT;
 		return 0;
 
 	case TIOCSSOFTCAR:
@@ -2854,7 +2853,8 @@ static int dgrp_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 		rc = access_ok(VERIFY_WRITE, (void __user *) arg, sizeof(int));
 		if (rc = 0)
 			return -EFAULT;
-		put_user(ch->ch_custom_speed, (unsigned int __user *) arg);
+		if (put_user(ch->ch_custom_speed, (unsigned int __user *) arg))
+			return -EFAULT;
 		break;
 
 	case DIGI_SETCUSTOMBAUD:
-- 
1.7.9.5

