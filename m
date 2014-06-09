From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Jun 2014 15:11:21 +0000
Subject: [patch] serial: txx9: remove duplicate TXX9_SIFCR_TDIL_MASK define
Message-Id: <20140609151121.GF9600@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.cz>, linux-serial@vger.kernel.org, kernel-janitors@vger.kernel.org

The TXX9_SIFCR_TDIL_MASK define is cut and pasted twice so we can delete
the second instance.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/tty/serial/serial_txx9.c b/drivers/tty/serial/serial_txx9.c
index 60f49b9..9878bd3 100644
--- a/drivers/tty/serial/serial_txx9.c
+++ b/drivers/tty/serial/serial_txx9.c
@@ -142,7 +142,6 @@ struct uart_txx9_port {
 #define TXX9_SIFCR_RDIL_12	0x00000180
 #define TXX9_SIFCR_RDIL_MAX	0x00000180
 #define TXX9_SIFCR_TDIL_MASK	0x00000018
-#define TXX9_SIFCR_TDIL_MASK	0x00000018
 #define TXX9_SIFCR_TDIL_1	0x00000000
 #define TXX9_SIFCR_TDIL_4	0x00000001
 #define TXX9_SIFCR_TDIL_8	0x00000010
