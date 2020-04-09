From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 09 Apr 2020 13:05:17 +0000
Subject: drm/tve200: Checking for a failed platform_get_irq() call in tve200_probe()
Message-Id: <0263f4fb-c349-7651-b590-8722cdd30c85@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hello,

I have taken another look at the implementation of the function “tve200_probe”.
A software analysis approach points the following source code out for
further development considerations.
https://elixir.bootlin.com/linux/v5.6.3/source/drivers/gpu/drm/tve200/tve200_drv.c#L212
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/tve200/tve200_drv.c?id=5d30bcacd91af6874481129797af364a53cd9b46#n212

	irq = platform_get_irq(pdev, 0);
	if (!irq) {
		ret = -EINVAL;
		goto clk_disable;
	}


The software documentation is providing the following information
for the used programming interface.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/platform.c?id=5d30bcacd91af6874481129797af364a53cd9b46#n221
https://elixir.bootlin.com/linux/v5.6.3/source/drivers/base/platform.c#L202

“…
 * Return: IRQ number on success, negative error number on failure.
…”

Would you like to reconsider the shown condition check?

Regards,
Markus
