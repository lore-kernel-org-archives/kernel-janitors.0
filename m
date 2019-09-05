From: Ray Jui <ray.jui@broadcom.com>
Date: Thu, 05 Sep 2019 16:46:46 +0000
Subject: Re: [PATCH] pinctrl: bcm: remove redundant assignment to pointer log
Message-Id: <190fef22-fe90-dfa0-0943-4d30b10b6b1d@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190905140919.29283-1-colin.king@canonical.com>
In-Reply-To: <20190905140919.29283-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 9/5/19 7:09 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer log is being initialized with a value that is never read
> and is being re-assigned a little later on. The assignment is
> redundant and hence can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/pinctrl/bcm/pinctrl-cygnus-mux.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
> index 44df35942a43..dcab2204c60c 100644
> --- a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
> +++ b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
> @@ -923,7 +923,6 @@ static int cygnus_mux_log_init(struct cygnus_pinctrl *pinctrl)
>   	if (!pinctrl->mux_log)
>   		return -ENOMEM;
>   
> -	log = pinctrl->mux_log;

Yes, this indeed looks completely redundant.

>   	for (i = 0; i < CYGNUS_NUM_IOMUX_REGS; i++) {
>   		for (j = 0; j < CYGNUS_NUM_MUX_PER_REG; j++) {
>   			log = &pinctrl->mux_log[i * CYGNUS_NUM_MUX_PER_REG
> 

Change looks good to me. Thanks!

Reviewed-by: Ray Jui <ray.jui@broadcom.com>
