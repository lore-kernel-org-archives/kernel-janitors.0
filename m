From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 08 Apr 2020 14:15:38 +0000
Subject: usb: gadget: fsl_udc_core: Checking for a failed platform_get_irq() call in fsl_udc_probe()
Message-Id: <36341bb1-1e00-5eb1-d032-60dcc614ddaf@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Li Yang <leoyang.li@nxp.com>, Tang Bin <tangbin@cmss.chinamobile.com>

Hello,

I have taken another look at the implementation of the function “fsl_udc_probe”.
A software analysis approach points the following source code out for
further development considerations.
https://elixir.bootlin.com/linux/v5.6.2/source/drivers/usb/gadget/udc/fsl_udc_core.c#L2443
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/gadget/udc/fsl_udc_core.c?id=f5e94d10e4c468357019e5c28d48499f677b284f#n2442

 	udc_controller->irq = platform_get_irq(pdev, 0);
 	if (!udc_controller->irq) {
 		ret = -ENODEV;
 		goto err_iounmap;
 	}


The software documentation is providing the following information
for the used programming interface.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/platform.c?id=f5e94d10e4c468357019e5c28d48499f677b284f#n221
https://elixir.bootlin.com/linux/v5.6.2/source/drivers/base/platform.c#L202

“…
 * Return: IRQ number on success, negative error number on failure.
…”

Would you like to reconsider the shown condition check?

Regards,
Markus
