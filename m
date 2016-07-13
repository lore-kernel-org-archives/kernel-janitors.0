From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Jul 2016 10:08:55 +0000
Subject: [patch] avr32: off by one in at32_init_pio()
Message-Id: <20160713100855.GE29468@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haavard Skinnemoen <hskinnemoen@gmail.com>
Cc: Hans-Christian Egtvedt <egtvedt@samfundet.no>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The pio_dev[] array has MAX_NR_PIO_DEVICES elements so the > should be
>=.

Fixes: 5f97f7f9400d ('[PATCH] avr32 architecture')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/avr32/mach-at32ap/pio.c b/arch/avr32/mach-at32ap/pio.c
index 83c2a00..13d3fc4 100644
--- a/arch/avr32/mach-at32ap/pio.c
+++ b/arch/avr32/mach-at32ap/pio.c
@@ -435,7 +435,7 @@ void __init at32_init_pio(struct platform_device *pdev)
 	struct resource *regs;
 	struct pio_device *pio;
 
-	if (pdev->id > MAX_NR_PIO_DEVICES) {
+	if (pdev->id >= MAX_NR_PIO_DEVICES) {
 		dev_err(&pdev->dev, "only %d PIO devices supported\n",
 			MAX_NR_PIO_DEVICES);
 		return;
