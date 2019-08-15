From: Ian Abbott <abbotti@mev.co.uk>
Date: Thu, 15 Aug 2019 12:34:12 +0000
Subject: Re: [PATCH] staging: comedi: usbduxsigma: remove redundant assignment to variable fx2delay
Message-Id: <7d0f8510-9c54-ab4b-c963-e99348efdfd0@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190815105314.5756-1-colin.king@canonical.com>
In-Reply-To: <20190815105314.5756-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 15/08/2019 11:53, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable fx2delay is being initialized with a value that is never read
> and fx2delay is being re-assigned a little later on. The assignment is
> redundant and hence can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/staging/comedi/drivers/usbduxsigma.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/comedi/drivers/usbduxsigma.c b/drivers/staging/comedi/drivers/usbduxsigma.c
> index 3cc40d2544be..54d7605e909f 100644
> --- a/drivers/staging/comedi/drivers/usbduxsigma.c
> +++ b/drivers/staging/comedi/drivers/usbduxsigma.c
> @@ -1074,7 +1074,7 @@ static int usbduxsigma_pwm_period(struct comedi_device *dev,
>   				  unsigned int period)
>   {
>   	struct usbduxsigma_private *devpriv = dev->private;
> -	int fx2delay = 255;
> +	int fx2delay;
>   
>   	if (period < MIN_PWM_PERIOD)
>   		return -EAGAIN;
> 

Looks fine, thanks!

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || Web: www.mev.co.uk )=-
-=( MEV Ltd. is a company registered in England & Wales. )=-
-=( Registered number: 02862268.  Registered address:    )=-
-=( 15 West Park Road, Bramhall, STOCKPORT, SK7 3JZ, UK. )=-
