From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 24 Sep 2017 12:00:58 +0000
Subject: Re: [PATCH 2/3] iio: adc: twl4030: Disable the vusb3v1 rugulator in the error handling path of 'twl4
Message-Id: <20170924130058.6bd6dd12@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4bcd315895de7135369e6e0d2402fc2794f2ee99.1506146101.git.christophe.jaillet@wanadoo.fr>
        <6bb9b8b3cba56c9cd201d4f025831ef776fbfef1.1506146101.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <6bb9b8b3cba56c9cd201d4f025831ef776fbfef1.1506146101.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, sre@kernel.org, wsa@the-dreams.de, kishon@ti.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 23 Sep 2017 08:06:19 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> Commit 7cc97d77ee8a has introduced a call to 'regulator_disable()' in the
> .remove function.
> So we should also have such a call in the .probe function in case of
> error after a successful 'regulator_enable()' call.
> 
> Add a new label for that and use it.
> 
> Fixes: 7cc97d77ee8a ("iio: adc: twl4030: Fix ADC[3:6] readings")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to the fixes-togreg-post-rc1 branch of iio.git and marked
for stable.

Thanks,

Jonathan
> ---
>  drivers/iio/adc/twl4030-madc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/twl4030-madc.c b/drivers/iio/adc/twl4030-madc.c
> index 80ab2ed70b85..32db23d9a483 100644
> --- a/drivers/iio/adc/twl4030-madc.c
> +++ b/drivers/iio/adc/twl4030-madc.c
> @@ -899,11 +899,13 @@ static int twl4030_madc_probe(struct platform_device *pdev)
>  	ret = iio_device_register(iio_dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "could not register iio device\n");
> -		goto err_i2c;
> +		goto err_usb3v1;
>  	}
>  
>  	return 0;
>  
> +err_usb3v1:
> +	regulator_disable(madc->usb3v1);
>  err_i2c:
>  	twl4030_madc_set_current_generator(madc, 0, 0);
>  err_current_generator:

