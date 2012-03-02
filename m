From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 02 Mar 2012 06:49:09 +0000
Subject: [patch] tty: cyclades: clean up a type issue
Message-Id: <20120302064908.GA24508@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Instead of casting value to unsigned long when we use it, we can just
declare it that way at the start.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/tty/cyclades.c b/drivers/tty/cyclades.c
index c9bf779..fbca4ee 100644
--- a/drivers/tty/cyclades.c
+++ b/drivers/tty/cyclades.c
@@ -2397,7 +2397,7 @@ check_and_exit:
  *	    transmit holding register is empty.  This functionality
  *	    allows an RS485 driver to be written in user space.
  */
-static int get_lsr_info(struct cyclades_port *info, unsigned int __user *value)
+static int get_lsr_info(struct cyclades_port *info, unsigned long __user *value)
 {
 	struct cyclades_card *card = info->card;
 	unsigned int result;
@@ -2413,7 +2413,7 @@ static int get_lsr_info(struct cyclades_port *info, unsigned int __user *value)
 		/* Not supported yet */
 		return -EINVAL;
 	}
-	return put_user(result, (unsigned long __user *)value);
+	return put_user(result, value);
 }
 
 static int cy_tiocmget(struct tty_struct *tty)
