From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Apr 2016 06:40:17 +0000
Subject: re: staging: goldfish: Fix pointer cast for 32 bits
Message-Id: <20160413064017.GA8092@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Peter Senna Tschudin,

The patch 07d783fd830a: "staging: goldfish: Fix pointer cast for 32
bits" from May 19, 2015, leads to the following static checker
warning:

	drivers/tty/goldfish.c:83 goldfish_tty_interrupt()
	error: XXX uninitialized symbol 'buf'.

drivers/tty/goldfish.c
    69  static irqreturn_t goldfish_tty_interrupt(int irq, void *dev_id)
    70  {
    71          struct goldfish_tty *qtty = dev_id;
    72          void __iomem *base = qtty->base;
    73          unsigned long irq_flags;
    74          unsigned char *buf;
    75          u32 count;
    76  
    77          count = readl(base + GOLDFISH_TTY_BYTES_READY);
    78          if (count = 0)
    79                  return IRQ_NONE;
    80  
    81          count = tty_prepare_flip_string(&qtty->port, &buf, count);

If tty_prepare_flip_string() returns size zero because there is no space
then "buf" is uninitialized.

    82          spin_lock_irqsave(&qtty->lock, irq_flags);
    83          gf_write_ptr(buf, base + GOLDFISH_TTY_DATA_PTR,
    84                                  base + GOLDFISH_TTY_DATA_PTR_HIGH);
    85          writel(count, base + GOLDFISH_TTY_DATA_LEN);
    86          writel(GOLDFISH_TTY_CMD_READ_BUFFER, base + GOLDFISH_TTY_CMD);
    87          spin_unlock_irqrestore(&qtty->lock, irq_flags);
    88          tty_schedule_flip(&qtty->port);
    89          return IRQ_HANDLED;
    90  }


regards,
dan carpenter
