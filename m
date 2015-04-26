From: Firo Yang <firogm@gmail.com>
Date: Sun, 26 Apr 2015 10:46:06 +0000
Subject: [PATCH] ARM: meson: serial: convert iounmap to devm_iounmap
Message-Id: <1430045166-21701-1-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: kernel-janitors@vger.kernel.org, jslaby@suse.cz, linux-serial@vger.kernel.org, Firo Yang <firogm@gmail.com>

The function meson_uart_release_port() inappropriately try to
iounmap() a resource managed by devm_ioremap_nocache().
The function meson_uart_release_port() maybe called by uart_ioctl()
that means meson_uart_release_port() is not called from within a
probe or remove function, for safety, I convert iounmap() to
devm_iounmap().

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 drivers/tty/serial/meson_uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 67c0367..0fc83c9 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -370,7 +370,7 @@ static int meson_uart_verify_port(struct uart_port *port,
 static void meson_uart_release_port(struct uart_port *port)
 {
 	if (port->flags & UPF_IOREMAP) {
-		iounmap(port->membase);
+		devm_iounmap(port->dev, port->membase);
 		port->membase = NULL;
 	}
 }
-- 
2.1.0

