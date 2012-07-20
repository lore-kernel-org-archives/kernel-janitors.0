From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Jul 2012 07:06:34 +0000
Subject: [patch] tty: handle NULL parameters in free_tty_struct()
Message-Id: <20120720070634.GC11710@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We sometimes pass NULL pointers to free_tty_struct().  One example where
it can happen is in the error handling code in pty_common_install().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index ca7c25d..e49b839 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -181,6 +181,8 @@ struct tty_struct *alloc_tty_struct(void)
 
 void free_tty_struct(struct tty_struct *tty)
 {
+	if (!tty)
+		return;
 	if (tty->dev)
 		put_device(tty->dev);
 	kfree(tty->write_buf);
