From: Vasiliy Kulikov <segoon@openwall.com>
Date: Fri, 19 Nov 2010 18:42:03 +0000
Subject: [PATCH] serial: ifx6x60: free IRQ on error
Message-Id: <1290192123-11747-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Russ Gorby <richardx.r.gorby@intel.com>, linux-kernel@vger.kernel.org

If second request_irq() failed then the first IRQ must be freed in
error handling code.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested only.

 drivers/serial/ifx6x60.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/serial/ifx6x60.c b/drivers/serial/ifx6x60.c
index 803264a..3f8d5ee 100644
--- a/drivers/serial/ifx6x60.c
+++ b/drivers/serial/ifx6x60.c
@@ -1133,7 +1133,7 @@ static int ifx_spi_spi_probe(struct spi_device *spi)
 	if (ret) {
 		dev_err(&spi->dev, "Unable to get irq %x",
 			gpio_to_irq(ifx_dev->gpio.srdy));
-		goto error_ret6;
+		goto error_ret7;
 	}
 
 	/* set pm runtime power state and register with power system */
@@ -1153,6 +1153,8 @@ static int ifx_spi_spi_probe(struct spi_device *spi)
 		mrdy_set_low(ifx_dev);
 	return 0;
 
+error_ret7:
+	free_irq(gpio_to_irq(ifx_dev->gpio.reset_out), (void *)ifx_dev);
 error_ret6:
 	gpio_free(ifx_dev->gpio.srdy);
 error_ret5:
-- 
1.7.0.4

