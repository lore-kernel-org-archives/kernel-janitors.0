From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 07 Dec 2012 08:56:23 +0000
Subject: [PATCH] drivers/pps/clients/pps-gpio.c: use devm_kzalloc
Message-Id: <1354874157-30932-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

devm_kzalloc allocates memory that is released when a driver detaches.
This patch uses devm_kzalloc for data that is allocated in the probe
function of a platform device and is only freed in the remove function.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pps/clients/pps-gpio.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpio.c
index 6550555..25b234d 100644
--- a/drivers/pps/clients/pps-gpio.c
+++ b/drivers/pps/clients/pps-gpio.c
@@ -128,7 +128,8 @@ static int pps_gpio_probe(struct platform_device *pdev)
 	}
 
 	/* allocate space for device info */
-	data = kzalloc(sizeof(struct pps_gpio_device_data), GFP_KERNEL);
+	data = devm_kzalloc(&pdev->dev, sizeof(struct pps_gpio_device_data),
+			    GFP_KERNEL);
 	if (data = NULL) {
 		err = -ENOMEM;
 		goto return_error;
@@ -150,7 +151,6 @@ static int pps_gpio_probe(struct platform_device *pdev)
 		pps_default_params |= PPS_CAPTURECLEAR | PPS_OFFSETCLEAR;
 	data->pps = pps_register_source(&data->info, pps_default_params);
 	if (data->pps = NULL) {
-		kfree(data);
 		pr_err("failed to register IRQ %d as PPS source\n", irq);
 		err = -EINVAL;
 		goto return_error;
@@ -164,7 +164,6 @@ static int pps_gpio_probe(struct platform_device *pdev)
 			get_irqf_trigger_flags(pdata), data->info.name, data);
 	if (ret) {
 		pps_unregister_source(data->pps);
-		kfree(data);
 		pr_err("failed to acquire IRQ %d\n", irq);
 		err = -EINVAL;
 		goto return_error;
@@ -190,7 +189,6 @@ static int pps_gpio_remove(struct platform_device *pdev)
 	gpio_free(pdata->gpio_pin);
 	pps_unregister_source(data->pps);
 	pr_info("removed IRQ %d as PPS source\n", data->irq);
-	kfree(data);
 	return 0;
 }
 

