From: Luis de Bethencourt <luisbg@osg.samsung.com>
Date: Fri, 27 May 2016 10:19:59 +0000
Subject: Re: [PATCH 2/2 V2] staging: dgnc: remove redundant null check in
Message-Id: <57481F4F.5010507@osg.samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160527014310.GA303@SEL-JYOUN-D1>
In-Reply-To: <20160527014310.GA303@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>, lidza.louina@gmail.com
Cc: markh@compro.net, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 27/05/16 02:43, Daeseok Youn wrote:
> the "brd" was already checked for NULL before calling dgnc_do_remap().
> 
> the dgnc_do_remap() function was called only
> from the dgnc_found_board() and the DGNC_BOARD_MAGIC value
> was assigned to "brd->magic" in dgcn_found_board(). So it doesn't
> need to check about magic value.
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> ---
> V2: Adds more comments to Change Log.
> 
>  drivers/staging/dgnc/dgnc_driver.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/staging/dgnc/dgnc_driver.c b/drivers/staging/dgnc/dgnc_driver.c
> index 22257d2..1882ef5 100644
> --- a/drivers/staging/dgnc/dgnc_driver.c
> +++ b/drivers/staging/dgnc/dgnc_driver.c
> @@ -599,9 +599,6 @@ static int dgnc_finalize_board_init(struct dgnc_board *brd)
>   */
>  static void dgnc_do_remap(struct dgnc_board *brd)
>  {
> -	if (!brd || brd->magic != DGNC_BOARD_MAGIC)
> -		return;
> -
>  	brd->re_map_membase = ioremap(brd->membase, 0x1000);
>  }
>  
> 

Looks good.

Thanks for the fixes Daeseok :)

Luis
