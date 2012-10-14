From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 14 Oct 2012 02:47:02 +0000
Subject: drivers/tty/serial/8250/8250_hp300.c:174:2: error: 'uart' undeclared
Message-Id: <20121014024702.GA9487@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Alan,

FYI, kernel build failed on

commit: 2655a2c76f80d91da34faa8f4e114d1793435ed3  8250: use the 8250 register interface not the legacy one
config: m68k-allyesconfig # make ARCH=m68k allyesconfig
commit date: 3 months ago

And is still failing in upstream.

All error/warnings:

drivers/tty/serial/8250/8250_hp300.c: In function 'hpdca_init_one':
drivers/tty/serial/8250/8250_hp300.c:174:2: error: 'uart' undeclared (first use in this function)
drivers/tty/serial/8250/8250_hp300.c:174:2: note: each undeclared identifier is reported only once for each function it appears in

vim +174 drivers/tty/serial/8250/8250_hp300.c

^1da177e drivers/serial/8250_hp300.c          Linus Torvalds 2005-04-16  168  #ifdef CONFIG_SERIAL_8250_CONSOLE
^1da177e drivers/serial/8250_hp300.c          Linus Torvalds 2005-04-16  169  	if (hp300_uart_scode = d->scode) {
^1da177e drivers/serial/8250_hp300.c          Linus Torvalds 2005-04-16  170  		/* Already got it. */
^1da177e drivers/serial/8250_hp300.c          Linus Torvalds 2005-04-16  171  		return 0;
^1da177e drivers/serial/8250_hp300.c          Linus Torvalds 2005-04-16  172  	}
^1da177e drivers/serial/8250_hp300.c          Linus Torvalds 2005-04-16  173  #endif
2655a2c7 drivers/tty/serial/8250/8250_hp300.c Alan Cox       2012-07-12 @174  	memset(&uart, 0, sizeof(uart));
^1da177e drivers/serial/8250_hp300.c          Linus Torvalds 2005-04-16  175  
^1da177e drivers/serial/8250_hp300.c          Linus Torvalds 2005-04-16  176  	/* Memory mapped I/O */
2b49abac drivers/serial/8250_hp300.c          Russell King   2005-04-26  177  	port.iotype = UPIO_MEM;

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
