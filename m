From: Luis de Bethencourt <luisbg@osg.samsung.com>
Date: Wed, 25 May 2016 22:00:28 +0000
Subject: Re: [PATCH 2/2] staging: dgnc: remove redundant null check in
Message-Id: <5746207C.6010000@osg.samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160520095128.GA30102@SEL-JYOUN-D1>
In-Reply-To: <20160520095128.GA30102@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>, lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 20/05/16 10:51, Daeseok Youn wrote:
> the "brd" was already checked for NULL before calling dgnc_do_remap().
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> ---
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

Same comment as the 1/2 patch.

Do you want to keep the brd->magic != DGNC_BOARD_MAGIC check?

Thanks,
Luis
