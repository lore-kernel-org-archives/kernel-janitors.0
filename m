From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 28 Sep 2020 09:47:24 +0000
Subject: Re: [PATCH 10/18] clk: meson: use semicolons rather than commas to separate statements
Message-Id: <1j1rimjkr7.fsf@starbuckisacylon.baylibre.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <1601233948-11629-11-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-11-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>, Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org


On Sun 27 Sep 2020 at 21:12, Julia Lawall <Julia.Lawall@inria.fr> wrote:

Hi Stephen,

Do you want to take all the clock related patches directly ?


> Replace commas with semicolons.  What is done is essentially described by
> the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):
>
> // <smpl>
> @@ expression e1,e2; @@
> e1
> -,
> +;
> e2
> ... when any
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>  drivers/clk/meson/meson-aoclk.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
> index bf8bea675d24..3a6d84cd6601 100644
> --- a/drivers/clk/meson/meson-aoclk.c
> +++ b/drivers/clk/meson/meson-aoclk.c
> @@ -57,7 +57,7 @@ int meson_aoclkc_probe(struct platform_device *pdev)
>  	rstc->data = data;
>  	rstc->regmap = regmap;
>  	rstc->reset.ops = &meson_aoclk_reset_ops;
> -	rstc->reset.nr_resets = data->num_reset,
> +	rstc->reset.nr_resets = data->num_reset;
>  	rstc->reset.of_node = dev->of_node;
>  	ret = devm_reset_controller_register(dev, &rstc->reset);
>  	if (ret) {
