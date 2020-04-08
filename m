From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 08 Apr 2020 07:05:22 +0000
Subject: Re: [PATCH] usb: host: ehci-tegra: Remove superfluous dev_err() message
Message-Id: <23c90343-3398-a475-650e-a7bae9aa5675@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tang Bin <tangbin@cmss.chinamobile.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>

> The platform_get_irq() can print error message,so remove the redundant
> dev_err() here.

I suggest to adjust the commit message.

* How do you think about to use the text “usb: host: ehci-tegra:
  Remove an error message in tegra_ehci_probe()” as the commit subject?

* Would a wording like the following be nicer?

  The function “platform_get_irq” can log an error already.
  Thus remove a redundant message for the exception handling in the
  calling function.


…
> +++ b/drivers/usb/host/ehci-tegra.c
> @@ -480,7 +480,6 @@ static int tegra_ehci_probe(struct platform_device *pdev)
>
>  	irq = platform_get_irq(pdev, 0);
>  	if (!irq) {
> -		dev_err(&pdev->dev, "Failed to get IRQ\n");
>  		err = -ENODEV;
>  		goto cleanup_phy;

I find another implementation detail questionable here.
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
