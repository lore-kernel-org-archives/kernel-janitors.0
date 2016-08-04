From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Aug 2016 05:34:03 +0000
Subject: [patch] tty: amiserial.c: remove a double irq restore
Message-Id: <20160804053403.GL775@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We already called "local_irq_restore(flags);" so this isn't needed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/tty/amiserial.c b/drivers/tty/amiserial.c
index 208f573..2f33cf1 100644
--- a/drivers/tty/amiserial.c
+++ b/drivers/tty/amiserial.c
@@ -880,7 +880,6 @@ static int rs_write(struct tty_struct * tty, const unsigned char *buf, int count
 		/* set a pending Tx Interrupt, transmitter should restart now */
 		custom.intreq = IF_SETCLR | IF_TBE;
 		mb();
-		local_irq_restore(flags);
 	}
 	return ret;
 }
