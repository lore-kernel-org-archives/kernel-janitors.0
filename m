From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Thu, 22 Nov 2012 19:58:35 +0000
Subject: [PATCH 2/2] staging: dgrp: dgrp_tty.c: Audit the return values of get/put_user()
Message-Id: <1353613595-8505-3-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1353613595-8505-1-git-send-email-gmate.amit@gmail.com>
In-Reply-To: <1353613595-8505-1-git-send-email-gmate.amit@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com, alan@lxorguk.ukuu.org.uk, wfp5p@virginia.edu, geert@linux-m68k.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

fix for missing audits for return values of get_user() and put_user().
Inspecting the return values of get/put_user() would make the access_ok()
redundant, hence removing calls to access_ok() in such scenarios.

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 drivers/staging/dgrp/dgrp_tty.c |   22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/dgrp/dgrp_tty.c b/drivers/staging/dgrp/dgrp_tty.c
index b46f56f..f4fdadc 100644
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
@@ -2285,7 +2283,8 @@ static int set_modem_info(struct ch_struct *ch, unsigned int command,
 	if (error = 0)
 		return -EFAULT;
 
-	get_user(arg, (unsigned int __user *) value);
+	if (get_user(arg, (unsigned int __user *) value))
+		return -EFAULT;
 	mval |= ((arg & TIOCM_RTS) ? DM_RTS : 0)
 		| ((arg & TIOCM_DTR) ? DM_DTR : 0);
 
@@ -2616,12 +2615,8 @@ static int dgrp_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 		return 0;
 
 	case TIOCGSOFTCAR:
-		rc = access_ok(VERIFY_WRITE, (void __user *) arg,
-			       sizeof(long));
-		if (rc = 0)
-			return -EFAULT;
-		put_user(C_CLOCAL(tty) ? 1 : 0, (unsigned long __user *) arg);
-		return 0;
+		return put_user(C_CLOCAL(tty) ? 1 : 0,
+				(unsigned long __user *) arg);
 
 	case TIOCMGET:
 		rc = access_ok(VERIFY_WRITE, (void __user *) arg,
@@ -2844,17 +2839,16 @@ static int dgrp_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 		break;
 
 	case DIGI_GETCUSTOMBAUD:
-		rc = access_ok(VERIFY_WRITE, (void __user *) arg, sizeof(int));
-		if (rc = 0)
+		if (put_user(ch->ch_custom_speed, (unsigned int __user *) arg))
 			return -EFAULT;
-		put_user(ch->ch_custom_speed, (unsigned int __user *) arg);
 		break;
 
 	case DIGI_SETCUSTOMBAUD:
 	{
 		int new_rate;
 
-		get_user(new_rate, (unsigned int __user *) arg);
+		if (get_user(new_rate, (unsigned int __user *) arg))
+			return -EFAULT;
 		dgrp_set_custom_speed(ch, new_rate);
 
 		break;
-- 
1.7.9.5

