From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Jan 2020 12:10:10 +0000
Subject: Re: [PATCH][V2] usb: ohci-da8xx: ensure error return on variable error is set
Message-Id: <20200107121010.GN3911@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107103035.19481-1-colin.king@canonical.com>
In-Reply-To: <20200107103035.19481-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jan 07, 2020 at 10:30:35AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when an error in da8xx_ohci->oc_gpio occurs it causes an
> uninitialized error return in variable 'error' to be returned.  Fix
> this by ensuring the error variable is set to the error value in
> da8xx_ohci->oc_gpio.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: d193abf1c913 ("usb: ohci-da8xx: add vbus and overcurrent gpios")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: fix typo and grammar in commit message
> 
> ---
>  drivers/usb/host/ohci-da8xx.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
> index 38183ac438c6..9cdf787055b7 100644
> --- a/drivers/usb/host/ohci-da8xx.c
> +++ b/drivers/usb/host/ohci-da8xx.c
> @@ -415,8 +415,10 @@ static int ohci_da8xx_probe(struct platform_device *pdev)
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
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Also uninitialized here.

regards,
dan carpenter
