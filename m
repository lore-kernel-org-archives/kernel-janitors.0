From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Date: Mon, 20 Jul 2020 19:04:35 +0000
Subject: Re: [PATCH][next] media: i2c: fix error check on max9286_read call
Message-Id: <ac2e793b-0f29-ac7b-d29f-3a4695c2eedc@ideasonboard.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200720161335.339174-1-colin.king@canonical.com>
In-Reply-To: <20200720161335.339174-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

On 20/07/2020 17:13, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the error return from the call to max9286_read is masked
> with 0xf0 so the following check for a negative error return is
> never true.  Fix this by checking for an error first, then masking
> the return value for subsequent conflink_mask checking.

Ooops!

> Addresses-Coverity: ("Logically dead code")
> fixes: 66d8c9d2422d ("media: i2c: Add MAX9286 driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/max9286.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 47f280518fdb..b364a3f60486 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -405,10 +405,11 @@ static int max9286_check_config_link(struct max9286_priv *priv,
>  	 * to 5 milliseconds.
>  	 */
>  	for (i = 0; i < 10; i++) {
> -		ret = max9286_read(priv, 0x49) & 0xf0;
> +		ret = max9286_read(priv, 0x49);
>  		if (ret < 0)
>  			return -EIO;
>  
> +		ret &= 0xf0;
>  		if (ret = conflink_mask)
>  			break;
>  
> 
