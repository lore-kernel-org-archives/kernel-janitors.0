From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 03 Mar 2005 18:50:28 +0000
Subject: [KJ] [PATCH] char/tty_io: replace schedule_timeout() with
Message-Id: <20050303185028.GK11600@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83899703256891534=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============83899703256891534==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep_interruptible() instead of schedule_timeout() in
send_break() to guarantee the task delays as expected. Change
@duration's units to milliseconds, and modify arguments in callers
appropriately. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-kj-v/drivers/char/tty_io.c	2005-03-01 23:38:10.000000000 -0800
+++ 2.6.11-kj/drivers/char/tty_io.c	2005-03-02 14:42:04.000000000 -0800
@@ -2171,12 +2171,11 @@ static int tiocsetd(struct tty_struct *t
 	return tty_set_ldisc(tty, ldisc);
 }
 
-static int send_break(struct tty_struct *tty, int duration)
+static int send_break(struct tty_struct *tty, unsigned int duration)
 {
 	tty->driver->break_ctl(tty, -1);
 	if (!signal_pending(current)) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(duration);
+		msleep_interruptible(duration);
 	}
 	tty->driver->break_ctl(tty, 0);
 	if (signal_pending(current))
@@ -2357,10 +2356,10 @@ int tty_ioctl(struct inode * inode, stru
 			 * all by anyone?
 			 */
 			if (!arg)
-				return send_break(tty, HZ/4);
+				return send_break(tty, 250);
 			return 0;
 		case TCSBRKP:	/* support for POSIX tcsendbreak() */	
-			return send_break(tty, arg ? arg*(HZ/10) : HZ/4);
+			return send_break(tty, arg ? arg*100 : 250);
 
 		case TIOCMGET:
 			return tty_tiocmget(tty, file, p);

--===============83899703256891534==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83899703256891534==--
