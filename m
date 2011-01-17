From: Vasiliy Kulikov <segoon@openwall.com>
Date: Mon, 17 Jan 2011 10:08:52 +0000
Subject: [PATCH] tty: serial: bfin_sport_uart: fix signedness error
Message-Id: <1295258933-31395-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org

sport->port.irq is unsigned, check for <0 doesn't make sense.
Explicitly cast it to int to check for error.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Cannot compile this driver, so it is not tested at all.

 drivers/tty/serial/bfin_sport_uart.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/tty/serial/bfin_sport_uart.c b/drivers/tty/serial/bfin_sport_uart.c
index e95c524..c3ec0a6 100644
--- a/drivers/tty/serial/bfin_sport_uart.c
+++ b/drivers/tty/serial/bfin_sport_uart.c
@@ -788,7 +788,7 @@ static int __devinit sport_uart_probe(struct platform_device *pdev)
 		sport->port.mapbase = res->start;
 
 		sport->port.irq = platform_get_irq(pdev, 0);
-		if (sport->port.irq < 0) {
+		if ((int)sport->port.irq < 0) {
 			dev_err(&pdev->dev, "No sport RX/TX IRQ specified\n");
 			ret = -ENOENT;
 			goto out_error_unmap;
-- 
1.7.0.4

