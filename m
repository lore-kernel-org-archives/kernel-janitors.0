From: Rui Miguel Silva <rmfrfs@gmail.com>
Date: Tue, 10 Sep 2019 08:43:01 +0000
Subject: Re: [PATCH] media: imx7-mipi-csis: make array 'registers' static const, makes object smaller
Message-Id: <m3y2ywley2.fsf@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190906150823.30859-1-colin.king@canonical.com>
In-Reply-To: <20190906150823.30859-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org

Hi Colin,
Thanks for the patch.

On Fri 06 Sep 2019 at 16:08, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Don't populate the array 'registers' on the stack but instead make it
> static const. Makes the object code smaller by 10 bytes.
>
>
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   20138	   5196	    128	  25462	   6376	staging/media/imx/imx7-mipi-csis.o
>
> After:
>    text	   data	    bss	    dec	    hex	filename
>   20032	   5292	    128	  25452	   636c	staging/media/imx/imx7-mipi-csis.o
>
> (gcc version 9.2.1, amd64)
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks very good to me.
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
   Rui
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 73d8354e618c..f8a97b7e2535 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -293,7 +293,7 @@ static int mipi_csis_dump_regs(struct csi_state *state)
>  	struct device *dev = &state->pdev->dev;
>  	unsigned int i;
>  	u32 cfg;
> -	struct {
> +	static const struct {
>  		u32 offset;
>  		const char * const name;
>  	} registers[] = {
