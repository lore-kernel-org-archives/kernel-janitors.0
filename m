From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 25 Jun 2007 11:22:06 +0000
Subject: [KJ] why two different implementations for /dev/zero?
Message-Id: <Pine.LNX.4.64.0706250718430.4102@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  i just noticed, in drivers/char/mem.c, that there are two different
implementations for the device file /dev/zero:

...
#ifdef CONFIG_MMU
/*
 * For fun, we are using the MMU for this.
 */
static inline size_t read_zero_pagealigned(char __user * buf, size_t size)
...
#else /* CONFIG_MMU */
static ssize_t read_zero(struct file * file, char * buf,
                         size_t count, loff_t *ppos)
{
...
#endif

where the non-MMU version is noticeably simpler and would appear to
work just fine in both cases.  is there a compelling reason for the
more complex MMU version?  is it faster?

certainly, having that longer version just for the "fun" of it
wouldn't seem to be a good reason.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
