From: Milo Kim <milo.kim@ti.com>
Date: Sun, 20 Dec 2015 23:20:20 +0000
Subject: Re: [PATCH] regulator: lp8788: constify regulator_ops structures
Message-Id: <567737B4.40904@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1450539802-22570-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1450539802-22570-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org

On 20/12/15 00:43, Julia Lawall wrote:
> The regulator_ops structures are never modified, so declare them as const.
>
> Done with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Milo Kim <milo.kim@ti.com>

>
> ---
>   drivers/regulator/lp8788-buck.c |    4 ++--
>   drivers/regulator/lp8788-ldo.c  |    4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/regulator/lp8788-buck.c b/drivers/regulator/lp8788-buck.c
> index a97bed9..ec46290 100644
> --- a/drivers/regulator/lp8788-buck.c
> +++ b/drivers/regulator/lp8788-buck.c
> @@ -344,7 +344,7 @@ static unsigned int lp8788_buck_get_mode(struct regulator_dev *rdev)
>   				REGULATOR_MODE_FAST : REGULATOR_MODE_NORMAL;
>   }
>
> -static struct regulator_ops lp8788_buck12_ops = {
> +static const struct regulator_ops lp8788_buck12_ops = {
>   	.list_voltage = regulator_list_voltage_table,
>   	.map_voltage = regulator_map_voltage_ascend,
>   	.set_voltage_sel = lp8788_buck12_set_voltage_sel,
> @@ -357,7 +357,7 @@ static struct regulator_ops lp8788_buck12_ops = {
>   	.get_mode = lp8788_buck_get_mode,
>   };
>
> -static struct regulator_ops lp8788_buck34_ops = {
> +static const struct regulator_ops lp8788_buck34_ops = {
>   	.list_voltage = regulator_list_voltage_table,
>   	.map_voltage = regulator_map_voltage_ascend,
>   	.set_voltage_sel = regulator_set_voltage_sel_regmap,
> diff --git a/drivers/regulator/lp8788-ldo.c b/drivers/regulator/lp8788-ldo.c
> index 30e28b1..cbfd358 100644
> --- a/drivers/regulator/lp8788-ldo.c
> +++ b/drivers/regulator/lp8788-ldo.c
> @@ -170,7 +170,7 @@ static int lp8788_ldo_enable_time(struct regulator_dev *rdev)
>   	return ENABLE_TIME_USEC * val;
>   }
>
> -static struct regulator_ops lp8788_ldo_voltage_table_ops = {
> +static const struct regulator_ops lp8788_ldo_voltage_table_ops = {
>   	.list_voltage = regulator_list_voltage_table,
>   	.set_voltage_sel = regulator_set_voltage_sel_regmap,
>   	.get_voltage_sel = regulator_get_voltage_sel_regmap,
> @@ -180,7 +180,7 @@ static struct regulator_ops lp8788_ldo_voltage_table_ops = {
>   	.enable_time = lp8788_ldo_enable_time,
>   };
>
> -static struct regulator_ops lp8788_ldo_voltage_fixed_ops = {
> +static const struct regulator_ops lp8788_ldo_voltage_fixed_ops = {
>   	.list_voltage = regulator_list_voltage_linear,
>   	.enable = regulator_enable_regmap,
>   	.disable = regulator_disable_regmap,
>
