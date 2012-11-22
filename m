From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Thu, 22 Nov 2012 19:58:34 +0000
Subject: [PATCH 1/2] staging: dgrp: dgrp_tty.c: Remove the TIOCSSOFTCAR ioctl handler from dgrp driver
Message-Id: <1353613595-8505-2-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1353613595-8505-1-git-send-email-gmate.amit@gmail.com>
In-Reply-To: <1353613595-8505-1-git-send-email-gmate.amit@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com, alan@lxorguk.ukuu.org.uk, wfp5p@virginia.edu, geert@linux-m68k.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove the TIOCSSOFTCAR ioctl handler from dgrp driver and let the core tty
layer to take care of this ioctl instead.

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 drivers/staging/dgrp/dgrp_tty.c |    7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/dgrp/dgrp_tty.c b/drivers/staging/dgrp/dgrp_tty.c
index e125b03..b46f56f 100644
--- a/drivers/staging/dgrp/dgrp_tty.c
+++ b/drivers/staging/dgrp/dgrp_tty.c
@@ -2623,13 +2623,6 @@ static int dgrp_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 		put_user(C_CLOCAL(tty) ? 1 : 0, (unsigned long __user *) arg);
 		return 0;
 
-	case TIOCSSOFTCAR:
-		get_user(arg, (unsigned long __user *) arg);
-		tty->termios.c_cflag -			((tty->termios.c_cflag & ~CLOCAL) |
-			 (arg ? CLOCAL : 0));
-		return 0;
-
 	case TIOCMGET:
 		rc = access_ok(VERIFY_WRITE, (void __user *) arg,
 				 sizeof(unsigned int));
-- 
1.7.9.5

