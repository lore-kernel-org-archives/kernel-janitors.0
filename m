From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 08 Apr 2020 12:20:28 +0000
Subject: drm/mcde: Checking for a failed platform_get_irq() call in mcde_probe()
Message-Id: <abd9674c-adf7-b040-814c-076e32a5a48e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: dri-devel@lists.freedesktop.org, Linus Walleij <linus.walleij@linaro.org>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tang Bin <tangbin@cmss.chinamobile.com>

Hello,

I have taken another look at the implementation of the function “mcde_probe”.
A software analysis approach points the following source code out for
further development considerations.
https://elixir.bootlin.com/linux/v5.6.2/source/drivers/gpu/drm/mcde/mcde_drv.c#L401
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/mcde/mcde_drv.c?id=f5e94d10e4c468357019e5c28d48499f677b284f#n402

 	irq = platform_get_irq(pdev, 0);
 	if (!irq) {
 		ret = -EINVAL;
 		goto clk_disable;
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
