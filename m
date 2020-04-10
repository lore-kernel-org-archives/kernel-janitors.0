From: Sam Ravnborg <sam@ravnborg.org>
Date: Fri, 10 Apr 2020 10:18:31 +0000
Subject: Re: drm/tve200: Checking for a failed platform_get_irq() call in tve200_probe()
Message-Id: <20200410101831.GA27723@ravnborg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0263f4fb-c349-7651-b590-8722cdd30c85@web.de>
In-Reply-To: <0263f4fb-c349-7651-b590-8722cdd30c85@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org

Hi Markus.

On Thu, Apr 09, 2020 at 03:05:17PM +0200, Markus Elfring wrote:
> Hello,
> 
> I have taken another look at the implementation of the function “tve200_probe”.
> A software analysis approach points the following source code out for
> further development considerations.
> https://elixir.bootlin.com/linux/v5.6.3/source/drivers/gpu/drm/tve200/tve200_drv.c#L212
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/tve200/tve200_drv.c?id]30bcacd91af6874481129797af364a53cd9b46#n212
> 
> 	irq = platform_get_irq(pdev, 0);
> 	if (!irq) {
> 		ret = -EINVAL;
> 		goto clk_disable;
> 	}
> 
> 
> The software documentation is providing the following information
> for the used programming interface.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/platform.c?id]30bcacd91af6874481129797af364a53cd9b46#n221
> https://elixir.bootlin.com/linux/v5.6.3/source/drivers/base/platform.c#L202
> 
> “…
>  * Return: IRQ number on success, negative error number on failure.
> …”
> 
> Would you like to reconsider the shown condition check?
Thansk for spotting this.

The right way to check for errors is to check if the return value is
less than 0.
Could you please audit all uses of platform_get_irq() in drivers/gpu/
and send a series of patches, one for each driver.

A quick "git grep -C 5 platform_get_irq" identified a few extra drivers
that does not implement the recommend way to check for errors.

Try to be a bit more terse in the changelog - but refer to
the documentation of platform_get_irq():

 * Example:
 *		int irq = platform_get_irq(pdev, 0);
 *		if (irq < 0)
 *			return irq;

Easier to embed it - rather than to link it.
Fine with links in the intro mail.

 	Sam
