From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 Jun 2014 08:59:27 +0000
Subject: re: extcon: palmas: Use devm_extcon_dev_allocate for extcon_dev
Message-Id: <20140610085927.GA5837@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[ This wasn't really your bug, but maybe you know the code? -dan ]

Hello Chanwoo Choi,

This is a semi-automatic email about new static checker warnings.

The patch 3f79a3fb5f41: "extcon: palmas: Use devm_extcon_dev_allocate
for extcon_dev" from Apr 21, 2014, leads to the following Smatch
complaint:

drivers/extcon/extcon-palmas.c:196 palmas_usb_probe()
	 error: we previously assumed 'node' could be null (see line 157)

drivers/extcon/extcon-palmas.c
   156	
   157		if (node && !pdata) {
                    ^^^^
Checked.

   158			palmas_usb->wakeup = of_property_read_bool(node, "ti,wakeup");
   159			palmas_usb->enable_id_detection = of_property_read_bool(node,
   160							"ti,enable-id-detection");
   161			palmas_usb->enable_vbus_detection = of_property_read_bool(node,
   162							"ti,enable-vbus-detection");
   163		} else {
   164			palmas_usb->wakeup = true;
   165			palmas_usb->enable_id_detection = true;
   166			palmas_usb->enable_vbus_detection = true;
   167	
   168			if (pdata)
   169				palmas_usb->wakeup = pdata->wakeup;
   170		}
   171	
   172		palmas->usb = palmas_usb;
   173		palmas_usb->palmas = palmas;
   174	
   175		palmas_usb->dev	 = &pdev->dev;
   176	
   177		palmas_usb->id_otg_irq = regmap_irq_get_virq(palmas->irq_data,
   178							PALMAS_ID_OTG_IRQ);
   179		palmas_usb->id_irq = regmap_irq_get_virq(palmas->irq_data,
   180							PALMAS_ID_IRQ);
   181		palmas_usb->vbus_otg_irq = regmap_irq_get_virq(palmas->irq_data,
   182							PALMAS_VBUS_OTG_IRQ);
   183		palmas_usb->vbus_irq = regmap_irq_get_virq(palmas->irq_data,
   184							PALMAS_VBUS_IRQ);
   185	
   186		palmas_usb_wakeup(palmas, palmas_usb->wakeup);
   187	
   188		platform_set_drvdata(pdev, palmas_usb);
   189	
   190		palmas_usb->edev = devm_extcon_dev_allocate(&pdev->dev,
   191							    palmas_extcon_cable);
   192		if (IS_ERR(palmas_usb->edev)) {
   193			dev_err(&pdev->dev, "failed to allocate extcon device\n");
   194			return -ENOMEM;
   195		}
   196		palmas_usb->edev->name = kstrdup(node->name, GFP_KERNEL);
                                                 ^^^^^^^^^^
Dereferenced without a check.

   197		palmas_usb->edev->dev.parent = palmas_usb->dev;
   198		palmas_usb->edev->mutually_exclusive = mutually_exclusive;

regards,
dan carpenter
