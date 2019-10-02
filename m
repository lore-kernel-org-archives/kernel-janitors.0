From: Scott Branden <scott.branden@broadcom.com>
Date: Wed, 02 Oct 2019 20:06:52 +0000
Subject: Re: [PATCH] ns2: Fix off by one bugs in ns2_pinmux_enable()
Message-Id: <98717865-0417-96d7-58f3-84f6394a1bf3@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190926081426.GB2332@mwanda>
In-Reply-To: <20190926081426.GB2332@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Ray Jui <rjui@broadcom.com>, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

thanks for fix.

On 2019-09-26 1:14 a.m., Dan Carpenter wrote:
> The pinctrl->functions[] array has pinctrl->num_functions elements and
> the pinctrl->groups[] array is the same way.  These are set in
> ns2_pinmux_probe().  So the > comparisons should be >= so that we don't
> read one element beyond the end of the array.
>
> Fixes: b5aa1006e4a9 ("pinctrl: ns2: add pinmux driver support for Broadcom NS2 SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Scott Branden <scott.branden@broadcom.com>
> ---
>   drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
> index 2bf6af7df7d9..9fabc451550e 100644
> --- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
> +++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
> @@ -640,8 +640,8 @@ static int ns2_pinmux_enable(struct pinctrl_dev *pctrl_dev,
>   	const struct ns2_pin_function *func;
>   	const struct ns2_pin_group *grp;
>   
> -	if (grp_select > pinctrl->num_groups ||
> -		func_select > pinctrl->num_functions)
> +	if (grp_select >= pinctrl->num_groups ||
> +		func_select >= pinctrl->num_functions)
>   		return -EINVAL;
>   
>   	func = &pinctrl->functions[func_select];
