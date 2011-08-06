From: Dan Carpenter <error27@gmail.com>
Date: Sat, 06 Aug 2011 14:31:26 +0000
Subject: [patch] USB: serial: remove duplicate returns
Message-Id: <20110806143126.GE10373@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This small untidiness with two returns in a row was copy and pasted
into mos7720.c and mos7840.c.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
index 40abedb..3524a10 100644
--- a/drivers/usb/serial/mos7720.c
+++ b/drivers/usb/serial/mos7720.c
@@ -2006,7 +2006,6 @@ static int mos7720_ioctl(struct tty_struct *tty,
 		dbg("%s (%d) TIOCSERGETLSR", __func__,  port->number);
 		return get_lsr_info(tty, mos7720_port,
 					(unsigned int __user *)arg);
-		return 0;
 
 	/* FIXME: These should be using the mode methods */
 	case TIOCMBIS:
diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index 7b50aa1..c72abd5 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -2263,7 +2263,6 @@ static int mos7840_ioctl(struct tty_struct *tty,
 	case TIOCSERGETLSR:
 		dbg("%s (%d) TIOCSERGETLSR", __func__, port->number);
 		return mos7840_get_lsr_info(tty, argp);
-		return 0;
 
 	case TIOCGSERIAL:
 		dbg("%s (%d) TIOCGSERIAL", __func__, port->number);
