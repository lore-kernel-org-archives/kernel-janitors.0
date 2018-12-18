From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 18 Dec 2018 12:51:32 +0000
Subject: Re: [PATCH] bus: sunxi-rsb: Fix a small memory leak
Message-Id: <CAGb2v64NgqCn5Mq3W0SfO0ecFkzBvnn9nJxQtyuFSQc8q5kNQQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181218082800.GC440@kadam>
In-Reply-To: <20181218082800.GC440@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi,

On Tue, Dec 18, 2018 at 4:28 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The problem is in __devm_regmap_init_sunxi_rsb().  If the call to
> __devm_regmap_init() fails, then we leak the "ctx" allocation.

This seems to be the same pattern with regmap implementations that
allocate context data, the other two being:

    - drivers/base/regmap/regmap-mmio.c
    - drivers/bluetooth/btintel.c

(CC-ing Mark) Maybe it's worth fixing in regmap itself?

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/bus/sunxi-rsb.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
> index 1b76d9585902..5ec25c8164d1 100644
> --- a/drivers/bus/sunxi-rsb.c
> +++ b/drivers/bus/sunxi-rsb.c
> @@ -417,17 +417,9 @@ static int regmap_sunxi_rsb_reg_write(void *context, unsigned int reg,
>         return sunxi_rsb_write(rdev->rsb, rdev->rtaddr, reg, &val, ctx->size);
>  }
>
> -static void regmap_sunxi_rsb_free_ctx(void *context)
> -{
> -       struct sunxi_rsb_ctx *ctx = context;
> -
> -       kfree(ctx);
> -}
> -
>  static struct regmap_bus regmap_sunxi_rsb = {
>         .reg_write = regmap_sunxi_rsb_reg_write,
>         .reg_read = regmap_sunxi_rsb_reg_read,
> -       .free_context = regmap_sunxi_rsb_free_ctx,
>         .reg_format_endian_default = REGMAP_ENDIAN_NATIVE,
>         .val_format_endian_default = REGMAP_ENDIAN_NATIVE,
>  };
> @@ -446,7 +438,7 @@ static struct sunxi_rsb_ctx *regmap_sunxi_rsb_init_ctx(struct sunxi_rsb_device *
>                 return ERR_PTR(-EINVAL);
>         }
>
> -       ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +       ctx = devm_kzalloc(&rdev->dev, sizeof(*ctx), GFP_KERNEL);

This decouples the lifetime of ctx from the regmap itself. IMO it
would be better to check the return value of __devm_regmap_init()
and act accordingly instead.

ChenYu

>         if (!ctx)
>                 return ERR_PTR(-ENOMEM);
>
> --
> 2.17.1
>
