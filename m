From: Courtney Cavin <courtney.cavin@sonymobile.com>
Date: Thu, 24 Sep 2015 19:50:12 +0000
Subject: Re: [patch] power: qcom_smbb: test the correct variable
Message-Id: <20150924195012.GB3193@sonymobile.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150924184137.GA28804@mwanda>
In-Reply-To: <20150924184137.GA28804@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sebastian Reichel <sre@kernel.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, Sep 24, 2015 at 08:41:37PM +0200, Dan Carpenter wrote:
> "state" is a bool so it's never less than zero.  The intent was to test
> "ret" instead.
> 
> Fixes: 56d7df8716b2 ('power: Add Qualcomm SMBB driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/power/qcom_smbb.c b/drivers/power/qcom_smbb.c
> index 0dabfe8..5eb1e9e 100644
> --- a/drivers/power/qcom_smbb.c
> +++ b/drivers/power/qcom_smbb.c
> @@ -351,7 +351,7 @@ static void smbb_set_line_flag(struct smbb_charger *chg, int irq, int flag)
>  	int ret;
>  
>  	ret = irq_get_irqchip_state(irq, IRQCHIP_STATE_LINE_LEVEL, &state);
> -	if (state < 0) {
> +	if (ret < 0) {
>  		dev_err(chg->dev, "failed to read irq line\n");
>  		return;
>  	}

Hrm.  This must be a leftover from when this was using Bjorn's
irq_read_line().  Thanks!

I guess you caught this with smatch?  Neither sparse nor gcc give me a
warning here, which is disappointing.

-Courtney
