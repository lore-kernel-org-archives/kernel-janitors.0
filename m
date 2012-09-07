From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Sep 2012 06:46:14 +0000
Subject: [patch] serial: clear entire struct in uart_get_info()
Message-Id: <20120907064613.GA12028@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-serial@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a typo here, sizeof(retinfo) should be sizeof(*retinfo) to
clear the struct.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Only needed in linux-next.

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 137b25c..19993d8 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -640,7 +640,7 @@ static void uart_get_info(struct tty_port *port,
 {
 	struct uart_port *uport = state->uart_port;
 
-	memset(retinfo, 0, sizeof(retinfo));
+	memset(retinfo, 0, sizeof(*retinfo));
 
 	retinfo->type	    = uport->type;
 	retinfo->line	    = uport->line;
