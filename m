From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 12 Nov 2010 05:21:37 +0000
Subject: Re: [patch] leds: pca9532: free after input_unregister_device()
Message-Id: <20101112052137.GA10871@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101112043018.GB3644@bicker>
In-Reply-To: <20101112043018.GB3644@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Nov 12, 2010 at 07:30:18AM +0300, Dan Carpenter wrote:
> input_unregister_device() frees data->idev so the second
> input_free_device() is a double free.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Dmitry Torokhov <dtor@mail.ru>

> 
> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index 43d0875..e1700cd 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -286,7 +286,6 @@ exit:
>  			case PCA9532_TYPE_N2100_BEEP:
>  				if (data->idev != NULL) {
>  					input_unregister_device(data->idev);
> -					input_free_device(data->idev);
>  					cancel_work_sync(&data->work);
>  					data->idev = NULL;
>  				}
> @@ -341,7 +340,6 @@ static int pca9532_remove(struct i2c_client *client)
>  		case PCA9532_TYPE_N2100_BEEP:
>  			if (data->idev != NULL) {
>  				input_unregister_device(data->idev);
> -				input_free_device(data->idev);
>  				cancel_work_sync(&data->work);
>  				data->idev = NULL;
>  			}

-- 
Dmitry
