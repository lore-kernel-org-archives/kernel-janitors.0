From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 16 May 2019 09:39:51 +0000
Subject: Re: [PATCH] staging: vt6656: remove unused variable
Message-Id: <20190516093951.GA19798@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190516093046.1400-1-quentin.deslandes@itdev.co.uk>
In-Reply-To: <20190516093046.1400-1-quentin.deslandes@itdev.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Deslandes <quentin.deslandes@itdev.co.uk>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Forest Bond <forest@alittletooquiet.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, May 16, 2019 at 09:31:05AM +0000, Quentin Deslandes wrote:
> Fixed 'set but not used' warning message on a status variable. The
> called function returning the status code 'vnt_start_interrupt_urb()'
> clean up after itself and the caller function
> 'vnt_int_start_interrupt()' does not returns any value.
> 
> Signed-off-by: Quentin Deslandes <quentin.deslandes@itdev.co.uk>
> ---
>  drivers/staging/vt6656/int.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vt6656/int.c b/drivers/staging/vt6656/int.c
> index 504424b19fcf..ac30ce72db5a 100644
> --- a/drivers/staging/vt6656/int.c
> +++ b/drivers/staging/vt6656/int.c
> @@ -42,13 +42,12 @@ static const u8 fallback_rate1[5][5] = {
>  void vnt_int_start_interrupt(struct vnt_private *priv)
>  {
>  	unsigned long flags;
> -	int status;
>  
>  	dev_dbg(&priv->usb->dev, "---->Interrupt Polling Thread\n");
>  
>  	spin_lock_irqsave(&priv->lock, flags);
>  
> -	status = vnt_start_interrupt_urb(priv);
> +	vnt_start_interrupt_urb(priv);

Shouldn't you fix this by erroring out if this fails?  Why ignore the
errors?

thanks,

greg k-h
