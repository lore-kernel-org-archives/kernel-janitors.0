From: Scott Branden <scott.branden@broadcom.com>
Date: Mon, 28 Aug 2017 20:57:31 +0000
Subject: Re: [PATCH 2/2] bus: arm-ccn: Simplify code
Message-Id: <9478cd8b-1620-a30d-9f52-1d6f5779bd55@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170827100706.13292-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170827100706.13292-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Change looks good.


On 17-08-27 03:07 AM, Christophe JAILLET wrote:
> Use 'devm_kasprintf()' to simplify the code.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Acked-by: Scott Branden <scott.branden@broadcom.com>
> ---
>   drivers/bus/arm-ccn.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/bus/arm-ccn.c b/drivers/bus/arm-ccn.c
> index c0e851a0a3d7..9b6fac98e992 100644
> --- a/drivers/bus/arm-ccn.c
> +++ b/drivers/bus/arm-ccn.c
> @@ -1268,14 +1268,12 @@ static int arm_ccn_pmu_init(struct arm_ccn *ccn)
>   	if (ccn->dt.id = 0) {
>   		name = "ccn";
>   	} else {
> -		int len = snprintf(NULL, 0, "ccn_%d", ccn->dt.id);
> -
> -		name = devm_kzalloc(ccn->dev, len + 1, GFP_KERNEL);
> +		name = devm_kasprintf(ccn->dev, GFP_KERNEL, "ccn_%d",
> +				      ccn->dt.id);
>   		if (!name) {
>   			err = -ENOMEM;
>   			goto error_choose_name;
>   		}
> -		snprintf(name, len + 1, "ccn_%d", ccn->dt.id);
>   	}
>   
>   	/* Perf driver registration */

