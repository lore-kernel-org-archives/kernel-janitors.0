From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Mon, 04 Apr 2016 09:52:03 +0000
Subject: [PATCH 1/2] staging: dgnc: remove parenthesis around the CONST |
Message-Id: <20160404095202.GA4030@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

remove parenthesis around the CONST | CONST.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_cls.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/dgnc/dgnc_cls.c b/drivers/staging/dgnc/dgnc_cls.c
index 5e46ac8..46c050c 100644
--- a/drivers/staging/dgnc/dgnc_cls.c
+++ b/drivers/staging/dgnc/dgnc_cls.c
@@ -1168,7 +1168,7 @@ static void cls_uart_init(struct channel_t *ch)
 	/* Clear out UART and FIFO */
 	readb(&ch->ch_cls_uart->txrx);
 
-	writeb((UART_FCR_ENABLE_FIFO | UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT),
+	writeb(UART_FCR_ENABLE_FIFO | UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT,
 	       &ch->ch_cls_uart->isr_fcr);
 	udelay(10);
 
-- 
1.9.1

