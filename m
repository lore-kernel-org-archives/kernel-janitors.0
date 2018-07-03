From: Ray Jui <ray.jui@broadcom.com>
Date: Tue, 03 Jul 2018 16:47:39 +0000
Subject: Re: [PATCH] pinctrl: nsp: off by ones in nsp_pinmux_enable()
Message-Id: <36102ecb-0936-e2a1-6912-d35f7fd4ddae@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180703120425.jloiga5fcbdzcqpc@kili.mountain>
In-Reply-To: <20180703120425.jloiga5fcbdzcqpc@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

On 7/3/2018 5:04 AM, Dan Carpenter wrote:
> The > comparisons should be >= or else we read beyond the end of the
> pinctrl->functions[] array.
> 
> Fixes: cc4fa83f66e9 ("pinctrl: nsp: add pinmux driver support for Broadcom NSP SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
> index 35c17653c694..5cd8166fbbc8 100644
> --- a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
> +++ b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
> @@ -460,8 +460,8 @@ static int nsp_pinmux_enable(struct pinctrl_dev *pctrl_dev,
>   	const struct nsp_pin_function *func;
>   	const struct nsp_pin_group *grp;
>   
> -	if (grp_select > pinctrl->num_groups ||
> -		func_select > pinctrl->num_functions)
> +	if (grp_select >= pinctrl->num_groups ||
> +	    func_select >= pinctrl->num_functions)
>   		return -EINVAL;
>   
>   	func = &pinctrl->functions[func_select];
> 

Fix looks good to me. Thanks!

Reviewed-by: Ray Jui <ray.jui@broadcom.com>
