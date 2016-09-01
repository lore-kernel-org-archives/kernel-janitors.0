From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 01 Sep 2016 17:51:29 +0000
Subject: [PATCH 0/9] constify uart_ops structures
Message-Id: <1472752298-981-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Constify uart_ops structures.

---

 drivers/tty/serial/altera_jtaguart.c |    2 +-
 drivers/tty/serial/altera_uart.c     |    2 +-
 drivers/tty/serial/arc_uart.c        |    2 +-
 drivers/tty/serial/atmel_serial.c    |    2 +-
 drivers/tty/serial/bcm63xx_uart.c    |    2 +-
 drivers/tty/serial/fsl_lpuart.c      |    4 ++--
 drivers/tty/serial/imx.c             |    2 +-
 drivers/tty/serial/jsm/jsm_tty.c     |    2 +-
 drivers/tty/serial/max3100.c         |    2 +-
 drivers/tty/serial/men_z135_uart.c   |    2 +-
 drivers/tty/serial/mxs-auart.c       |    2 +-
 drivers/tty/serial/pch_uart.c        |    2 +-
 drivers/tty/serial/sh-sci.c          |    2 +-
 drivers/tty/serial/st-asc.c          |    2 +-
 drivers/tty/serial/timbuart.c        |    2 +-
 drivers/tty/serial/uartlite.c        |    2 +-
 drivers/tty/serial/xilinx_uartps.c   |    2 +-
 17 files changed, 18 insertions(+), 18 deletions(-)
