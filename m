From: Luis de Bethencourt <luisbg@osg.samsung.com>
Date: Wed, 25 May 2016 21:48:04 +0000
Subject: Re: [PATCH 1/2] staging: dgnc: remove redundant NULL check for brd
Message-Id: <57461D94.1030403@osg.samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160520095104.GA30075@SEL-JYOUN-D1>
In-Reply-To: <20160520095104.GA30075@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>, lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 20/05/16 10:51, Daeseok Youn wrote:
> the "brd" value cannot be NULL in dgnc_finalize_board_init().
> Because "brd" as a parameter of this function was already
> checked for NULL.
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> ---
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

This is partially correct, the check for brd being NULL is in line 371.

But there is a second check for brd->magic != DGNC_BOARD_MAGIC. Do you want
to keep that one?

Also, how did you find this patch. It is useful to mention this in the commit
message if it was through some static analysis tool. For people using these tools
in the future.

Thanks for the patch :)
Luis
