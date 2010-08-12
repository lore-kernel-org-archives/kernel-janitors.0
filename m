From: Dan Carpenter <error27@gmail.com>
Date: Thu, 12 Aug 2010 07:51:41 +0000
Subject: [patch 1/2] ip2: remove unneeded NULL check
Message-Id: <20100812075141.GL645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael H. Warfield" <mhw@wittsend.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Rakib Mullick <rakib.mullick@gmail.com>, linux-kernel@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>, kernel-janitors@vger.kernel.org

We don't pass NULL tty pointers to the close function, and anyway we
already dereferenced it at this point.  This check can be removed.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/char/ip2/ip2main.c b/drivers/char/ip2/ip2main.c
index 07f3ea3..8fa041e 100644
--- a/drivers/char/ip2/ip2main.c
+++ b/drivers/char/ip2/ip2main.c
@@ -1650,7 +1650,7 @@ ip2_close( PTTY tty, struct file *pFile )
 	/* disable DSS reporting */
 	i2QueueCommands(PTYPE_INLINE, pCh, 100, 4,
 				CMD_DCD_NREP, CMD_CTS_NREP, CMD_DSR_NREP, CMD_RI_NREP);
-	if ( !tty || (tty->termios->c_cflag & HUPCL) ) {
+	if (tty->termios->c_cflag & HUPCL) {
 		i2QueueCommands(PTYPE_INLINE, pCh, 100, 2, CMD_RTSDN, CMD_DTRDN);
 		pCh->dataSetOut &= ~(I2_DTR | I2_RTS);
 		i2QueueCommands( PTYPE_INLINE, pCh, 100, 1, CMD_PAUSE(25));
