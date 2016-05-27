From: Luis de Bethencourt <luisbg@osg.samsung.com>
Date: Fri, 27 May 2016 10:19:47 +0000
Subject: Re: [PATCH 1/2 v2] staging: dgnc: remove redundant NULL check for brd
Message-Id: <57481F43.9030008@osg.samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160527014142.GA32739@SEL-JYOUN-D1>
In-Reply-To: <20160527014142.GA32739@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>, lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 27/05/16 02:42, Daeseok Youn wrote:
> the "brd" value cannot be NULL in dgnc_finalize_board_init().
> Because "brd" as a parameter of this function was already
> checked for NULL.
> 
> the dgnc_finalize_board_init() as a static function was called
> only from dgnc_found_board() function and brd->magic value
> was assigned once in dgnc_found_board(). So it doesn't need to
> check for DGNC_BOARD_MAGIC value.
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> ---
> V2: Adds more comments to Change Log.
> 
>  drivers/staging/dgnc/dgnc_driver.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/dgnc/dgnc_driver.c b/drivers/staging/dgnc/dgnc_driver.c
> index af2e835..22257d2 100644
> --- a/drivers/staging/dgnc/dgnc_driver.c
> +++ b/drivers/staging/dgnc/dgnc_driver.c
> @@ -579,9 +579,6 @@ static int dgnc_finalize_board_init(struct dgnc_board *brd)
>  {
>  	int rc = 0;
>  
> -	if (!brd || brd->magic != DGNC_BOARD_MAGIC)
> -		return -ENODEV;
> -
>  	if (brd->irq) {
>  		rc = request_irq(brd->irq, brd->bd_ops->intr,
>  				 IRQF_SHARED, "DGNC", brd);
> 

Looks good.

Thanks for the fixes Daeseok :)

Luis
