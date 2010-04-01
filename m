From: Dan Carpenter <error27@gmail.com>
Date: Thu, 01 Apr 2010 15:51:43 +0000
Subject: [patch] mxser: spin_lock() => spin_lock_irq()
Message-Id: <20100401155143.GC5265@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Slaby <jirislaby@gmail.com>
Cc: Alan Cox <alan@linux.intel.com>, Greg Kroah-Hartman <gregkh@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Alexey Dobriyan <adobriyan@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This should be spin_lock_irq() to match the spin_unlock_irq().
Originally it was a lock_kernel() but we switched everything to
spin_lock_irq() last November.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/char/mxser.c b/drivers/char/mxser.c
index e0c5d2a..ecb2d8b 100644
--- a/drivers/char/mxser.c
+++ b/drivers/char/mxser.c
@@ -1768,7 +1768,7 @@ static int mxser_ioctl(struct tty_struct *tty, struct file *file,
 		int len, lsr;
 
 		len = mxser_chars_in_buffer(tty);
-		spin_lock(&info->slock);
+		spin_lock_irq(&info->slock);
 		lsr = inb(info->ioaddr + UART_LSR) & UART_LSR_THRE;
 		spin_unlock_irq(&info->slock);
 		len += (lsr ? 0 : 1);
