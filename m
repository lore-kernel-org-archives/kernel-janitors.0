From: Alan Stern <stern@rowland.harvard.edu>
Date: Tue, 07 Jan 2020 19:47:43 +0000
Subject: Re: [PATCH][V3] usb: ohci-da8xx: ensure error return on variable error is set
Message-Id: <Pine.LNX.4.44L0.2001071447300.1567-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200107123901.101190-1-colin.king@canonical.com>
References: <20200107123901.101190-1-colin.king@canonical.com>
In-Reply-To: <20200107123901.101190-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 7 Jan 2020, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when an error occurs when calling devm_gpiod_get_optional or
> calling gpiod_to_irq it causes an uninitialized error return in variable
> 'error' to be returned.  Fix this by ensuring the error variable is set
> from da8xx_ohci->oc_gpio and oc_irq.
> 
> Thanks to Dan Carpenter for spotting the uninitialized error in the
> gpiod_to_irq failure case.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: d193abf1c913 ("usb: ohci-da8xx: add vbus and overcurrent gpios")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: fix typo and grammar in commit message
> V3: fix gpiod_to_irq error case, re-write commit message
> 
> ---
>  drivers/usb/host/ohci-da8xx.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
> index 38183ac438c6..1371b0c249ec 100644
> --- a/drivers/usb/host/ohci-da8xx.c
> +++ b/drivers/usb/host/ohci-da8xx.c
> @@ -415,13 +415,17 @@ static int ohci_da8xx_probe(struct platform_device *pdev)
>  	}
>  
>  	da8xx_ohci->oc_gpio = devm_gpiod_get_optional(dev, "oc", GPIOD_IN);
> -	if (IS_ERR(da8xx_ohci->oc_gpio))
> +	if (IS_ERR(da8xx_ohci->oc_gpio)) {
> +		error = PTR_ERR(da8xx_ohci->oc_gpio);
>  		goto err;
> +	}
>  
>  	if (da8xx_ohci->oc_gpio) {
>  		oc_irq = gpiod_to_irq(da8xx_ohci->oc_gpio);
> -		if (oc_irq < 0)
> +		if (oc_irq < 0) {
> +			error = oc_irq;
>  			goto err;
> +		}
>  
>  		error = devm_request_threaded_irq(dev, oc_irq, NULL,
>  				ohci_da8xx_oc_thread, IRQF_TRIGGER_RISING |

Acked-by: Alan Stern <stern@rowland.harvard.edu>
