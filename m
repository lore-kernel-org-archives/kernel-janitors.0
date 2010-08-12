From: Dan Carpenter <error27@gmail.com>
Date: Thu, 12 Aug 2010 07:50:09 +0000
Subject: [patch] mfd: snprintf() returns largish values
Message-Id: <20100812075009.GK645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Feng Tang <feng.tang@intel.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

snprintf() returns the number of bytes which would have been written so
it can be larger than the size of the buffer.  In this case it's fine,
but people copy and paste this code so I've fixed it.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/serial/mfd.c b/drivers/serial/mfd.c
index bc9af50..5aa25e5 100644
--- a/drivers/serial/mfd.c
+++ b/drivers/serial/mfd.c
@@ -171,6 +171,9 @@ static ssize_t port_show_regs(struct file *file, char __user *user_buf,
 	len += snprintf(buf + len, HSU_REGS_BUFSIZE - len,
 			"DIV: \t\t0x%08x\n", serial_in(up, UART_DIV));
 
+	if (len > HSU_REGS_BUFSIZE)
+		len = HSU_REGS_BUFSIZE;
+
 	ret =  simple_read_from_buffer(user_buf, count, ppos, buf, len);
 	kfree(buf);
 	return ret;
@@ -218,6 +221,9 @@ static ssize_t dma_show_regs(struct file *file, char __user *user_buf,
 	len += snprintf(buf + len, HSU_REGS_BUFSIZE - len,
 			"D0TSR: \t\t0x%08x\n", chan_readl(chan, HSU_CH_D3TSR));
 
+	if (len > HSU_REGS_BUFSIZE)
+		len = HSU_REGS_BUFSIZE;
+
 	ret =  simple_read_from_buffer(user_buf, count, ppos, buf, len);
 	kfree(buf);
 	return ret;
