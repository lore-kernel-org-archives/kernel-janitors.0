From: Keerthy <j-keerthy@ti.com>
Date: Fri, 28 Jun 2019 03:40:41 +0000
Subject: Re: [PATCH][next] regulator: lp87565: fix missing break in switch statement
Message-Id: <1a17ea61-a164-d61f-6416-637d47668f1b@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190627131639.6394-1-colin.king@canonical.com>
In-Reply-To: <20190627131639.6394-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 27/06/19 6:46 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the LP87565_DEVICE_TYPE_LP87561_Q1 case does not have a
> break statement, causing it to fall through to a dev_err message.
> Fix this by adding in the missing break statement.
> 
> Addresses-Coverity: ("Missing break in switch")
> Fixes: 7ee63bd74750 ("regulator: lp87565: Add 4-phase lp87561 regulator support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/regulator/lp87565-regulator.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/regulator/lp87565-regulator.c b/drivers/regulator/lp87565-regulator.c
> index 993c11702083..5d067f7c2116 100644
> --- a/drivers/regulator/lp87565-regulator.c
> +++ b/drivers/regulator/lp87565-regulator.c
> @@ -180,6 +180,7 @@ static int lp87565_regulator_probe(struct platform_device *pdev)
>   	case LP87565_DEVICE_TYPE_LP87561_Q1:
>   		min_idx = LP87565_BUCK_3210;
>   		max_idx = LP87565_BUCK_3210;
> +		break;

Thanks Colin.

Reviewed-by: Keerthy <j-keerthy@ti.com>

>   	default:
>   		dev_err(lp87565->dev, "Invalid lp config %d\n",
>   			lp87565->dev_type);
> 
