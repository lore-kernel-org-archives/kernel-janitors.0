From: Tobias Klauser <tklauser@distanz.ch>
Date: Tue, 11 May 2010 07:10:23 +0000
Subject: [PATCH] serial: bfin_sport_uart: Use resource size to fix off-by-one error
Message-Id: <1273561823-4495-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vapier@gentoo.org, gregkh@suse.de, linux-serial@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Tobias Klauser <tklauser@distanz.ch>

Use the resource_size function instead of manually calculating the
resource size. This actually fixes an off-by-one error.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/serial/bfin_sport_uart.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/serial/bfin_sport_uart.c b/drivers/serial/bfin_sport_uart.c
index 66cda22..e57fb3d 100644
--- a/drivers/serial/bfin_sport_uart.c
+++ b/drivers/serial/bfin_sport_uart.c
@@ -774,8 +774,7 @@ static int __devinit sport_uart_probe(struct platform_device *pdev)
 			goto out_error_free_peripherals;
 		}
 
-		sport->port.membase = ioremap(res->start,
-			res->end - res->start);
+		sport->port.membase = ioremap(res->start, resource_size(res));
 		if (!sport->port.membase) {
 			dev_err(&pdev->dev, "Cannot map sport IO\n");
 			ret = -ENXIO;
-- 
1.6.3.3

