From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 05 Apr 2020 16:50:38 +0000
Subject: [PATCH] thermal: Delete an error message in four functions
Message-Id: <05f49ae7-5cc7-d6a0-fc3d-abaf2a0b373c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, Allison Randal <allison@lohutok.net>, Amit Kucheria <amit.kucheria@verdurent.com>, Clark Williams <williams@redhat.com>, Colin Ian King <colin.king@canonical.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Keerthy <j-keerthy@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Pascal Paillet <p.paillet@st.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, Zhang Rui <rui.zhang@intel.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tang Bin <tangbin@cmss.chinamobile.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 5 Apr 2020 18:35:16 +0200

The function “platform_get_irq” can log an error already.
Thus omit redundant messages for the exception handling in the
calling functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/thermal/rockchip_thermal.c          | 4 +---
 drivers/thermal/st/st_thermal_memmap.c      | 4 +---
 drivers/thermal/st/stm_thermal.c            | 4 +---
 drivers/thermal/ti-soc-thermal/ti-bandgap.c | 5 ++---
 4 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
index 7c1a8bccdcba..15a71ecc916c 100644
--- a/drivers/thermal/rockchip_thermal.c
+++ b/drivers/thermal/rockchip_thermal.c
@@ -1241,10 +1241,8 @@ static int rockchip_thermal_probe(struct platform_device *pdev)
 		return -ENXIO;

 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "no irq resource?\n");
+	if (irq < 0)
 		return -EINVAL;
-	}

 	thermal = devm_kzalloc(&pdev->dev, sizeof(struct rockchip_thermal_data),
 			       GFP_KERNEL);
diff --git a/drivers/thermal/st/st_thermal_memmap.c b/drivers/thermal/st/st_thermal_memmap.c
index a824b78dabf8..a0114452d11f 100644
--- a/drivers/thermal/st/st_thermal_memmap.c
+++ b/drivers/thermal/st/st_thermal_memmap.c
@@ -94,10 +94,8 @@ static int st_mmap_register_enable_irq(struct st_thermal_sensor *sensor)
 	int ret;

 	sensor->irq = platform_get_irq(pdev, 0);
-	if (sensor->irq < 0) {
-		dev_err(dev, "failed to register IRQ\n");
+	if (sensor->irq < 0)
 		return sensor->irq;
-	}

 	ret = devm_request_threaded_irq(dev, sensor->irq,
 					NULL, st_mmap_thermal_trip_handler,
diff --git a/drivers/thermal/st/stm_thermal.c b/drivers/thermal/st/stm_thermal.c
index 9314e3df6a42..331e2b768df5 100644
--- a/drivers/thermal/st/stm_thermal.c
+++ b/drivers/thermal/st/stm_thermal.c
@@ -385,10 +385,8 @@ static int stm_register_irq(struct stm_thermal_sensor *sensor)
 	int ret;

 	sensor->irq = platform_get_irq(pdev, 0);
-	if (sensor->irq < 0) {
-		dev_err(dev, "%s: Unable to find IRQ\n", __func__);
+	if (sensor->irq < 0)
 		return sensor->irq;
-	}

 	ret = devm_request_threaded_irq(dev, sensor->irq,
 					NULL,
diff --git a/drivers/thermal/ti-soc-thermal/ti-bandgap.c b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
index 263b0420fbe4..ab19ceff6e2a 100644
--- a/drivers/thermal/ti-soc-thermal/ti-bandgap.c
+++ b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
@@ -772,10 +772,9 @@ static int ti_bandgap_talert_init(struct ti_bandgap *bgp,
 	int ret;

 	bgp->irq = platform_get_irq(pdev, 0);
-	if (bgp->irq < 0) {
-		dev_err(&pdev->dev, "get_irq failed\n");
+	if (bgp->irq < 0)
 		return bgp->irq;
-	}
+
 	ret = request_threaded_irq(bgp->irq, NULL,
 				   ti_bandgap_talert_irq_handler,
 				   IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
--
2.26.0
