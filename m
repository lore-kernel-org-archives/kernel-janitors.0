From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 May 2014 16:13:07 +0000
Subject: [patch] staging: dgnc: UART_IIR_XOFF code is buggy
Message-Id: <20140514161307.GE18082@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lidza Louina <lidza.louina@gmail.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org

The UART_IIR_XOFF was supposed to be a no-op but, because there was a
missing semi-colon, the if statement is not "Empty".  I have just deleted
this code because it was supposed to be a no-op anyway.  UART_IIR_XOFF
is a standard define and not something specific to this driver.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/dgnc/dgnc_cls.h b/drivers/staging/dgnc/dgnc_cls.h
index ffe8535..465d79a 100644
--- a/drivers/staging/dgnc/dgnc_cls.h
+++ b/drivers/staging/dgnc/dgnc_cls.h
@@ -61,7 +61,6 @@ struct cls_uart_struct {
 #define UART_16654_FCR_RXTRIGGER_56	0x80
 #define UART_16654_FCR_RXTRIGGER_60     0xC0
 
-#define UART_IIR_XOFF			0x10	/* Received Xoff signal/Special character */
 #define UART_IIR_CTSRTS			0x20	/* Received CTS/RTS change of state */
 #define UART_IIR_RDI_TIMEOUT		0x0C    /* Receiver data TIMEOUT */
 
diff --git a/drivers/staging/dgnc/dgnc_cls.c b/drivers/staging/dgnc/dgnc_cls.c
index 60d9b62..8e265c2 100644
--- a/drivers/staging/dgnc/dgnc_cls.c
+++ b/drivers/staging/dgnc/dgnc_cls.c
@@ -453,10 +453,6 @@ static inline void cls_parse_isr(struct dgnc_board *brd, uint port)
 			cls_copy_data_from_queue_to_uart(ch);
 		}
 
-		/* Received Xoff signal/Special character */
-		if (isr & UART_IIR_XOFF)
-			/* Empty */
-
 		/* CTS/RTS change of state */
 		if (isr & UART_IIR_CTSRTS) {
 			brd->intr_modem++;
