From: zhong jiang <zhongjiang@huawei.com>
Date: Thu, 23 Aug 2018 11:16:04 +0000
Subject: Re: [PATCH] drm/pl111: add in missing sentinel to a of_device_id array
Message-Id: <5B7E9774.7010500@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180821105407.2318-1-colin.king@canonical.com>
In-Reply-To: <20180821105407.2318-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,  Colin

I has posted the same patch about a month ago. but it seems to be ignored.:-(

https://lore.kernel.org/patchwork/patch/971652/

Thanks,
zhong jiang

On 2018/8/21 18:54, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Array vexpress_muxfpga_match is missing an end of array sentinel,
> add it.
>
> Detected by Coccinelle: ("vexpress_muxfpga_match is not NULL
> terminated at line")
>
> Fixes: ca454bd42dc2 ("drm/pl111: Support the Versatile Express")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/pl111/pl111_vexpress.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/pl111/pl111_vexpress.c b/drivers/gpu/drm/pl111/pl111_vexpress.c
> index a534b225e31b..48e2afcd4798 100644
> --- a/drivers/gpu/drm/pl111/pl111_vexpress.c
> +++ b/drivers/gpu/drm/pl111/pl111_vexpress.c
> @@ -111,7 +111,8 @@ static int vexpress_muxfpga_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id vexpress_muxfpga_match[] = {
> -	{ .compatible = "arm,vexpress-muxfpga", }
> +	{ .compatible = "arm,vexpress-muxfpga", },
> +	{ /* sentinel */ }
>  };
>  
>  static struct platform_driver vexpress_muxfpga_driver = {
