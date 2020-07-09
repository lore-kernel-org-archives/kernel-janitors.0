From: Ian Abbott <abbotti@mev.co.uk>
Date: Thu, 09 Jul 2020 11:08:34 +0000
Subject: Re: [PATCH] staging: comedi: verify array index is correct before using it
Message-Id: <23bd2a41-4e65-ae4e-8133-c8ddeebfc6c5@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200709102936.GA20875@mwanda>
In-Reply-To: <20200709102936.GA20875@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org

On 09/07/2020 11:29, Dan Carpenter wrote:
> This code reads from the array before verifying that "trig" is a valid
> index.  If the index is wildly out of bounds then reading from an
> invalid address could lead to an Oops.
> 
> Fixes: a8c66b684efa ("staging: comedi: addi_apci_1500: rewrite the subdevice support functions")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/staging/comedi/drivers/addi_apci_1500.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/comedi/drivers/addi_apci_1500.c b/drivers/staging/comedi/drivers/addi_apci_1500.c
> index 45ad4ba92f94..689acd69a1b9 100644
> --- a/drivers/staging/comedi/drivers/addi_apci_1500.c
> +++ b/drivers/staging/comedi/drivers/addi_apci_1500.c
> @@ -456,9 +456,9 @@ static int apci1500_di_cfg_trig(struct comedi_device *dev,
>   	unsigned int lo_mask = data[5] << shift;
>   	unsigned int chan_mask = hi_mask | lo_mask;
>   	unsigned int old_mask = (1 << shift) - 1;
> -	unsigned int pm = devpriv->pm[trig] & old_mask;
> -	unsigned int pt = devpriv->pt[trig] & old_mask;
> -	unsigned int pp = devpriv->pp[trig] & old_mask;
> +	unsigned int pm;
> +	unsigned int pt;
> +	unsigned int pp;
>   
>   	if (trig > 1) {
>   		dev_dbg(dev->class_dev,
> @@ -471,6 +471,10 @@ static int apci1500_di_cfg_trig(struct comedi_device *dev,
>   		return -EINVAL;
>   	}
>   
> +	pm = devpriv->pm[trig] & old_mask;
> +	pt = devpriv->pt[trig] & old_mask;
> +	pp = devpriv->pp[trig] & old_mask;
> +
>   	switch (data[2]) {
>   	case COMEDI_DIGITAL_TRIG_DISABLE:
>   		/* clear trigger configuration */
> 

Nice catch!

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || Web: www.mev.co.uk )=-
-=( MEV Ltd. is a company registered in England & Wales. )=-
-=( Registered number: 02862268.  Registered address:    )=-
-=( 15 West Park Road, Bramhall, STOCKPORT, SK7 3JZ, UK. )=-
