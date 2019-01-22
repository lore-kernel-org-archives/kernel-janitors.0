From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Date: Tue, 22 Jan 2019 10:00:57 +0000
Subject: Re: drm/komeda: Fix a signedness bug
Message-Id: <20190122100042.GA21770@james-ThinkStation-P300>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190121135952.GA14103@kadam>
In-Reply-To: <20190121135952.GA14103@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>

On Mon, Jan 21, 2019 at 04:59:52PM +0300, Dan Carpenter wrote:
> The mdev->irq value comes from platform_get_irq() so it can't be more
> than INT_MAX and if it's unsigned then it breaks the error handling in
> komeda_parse_dt().
>
> Fixes: 29e56aec911d ("drm/komeda: Add DT parsing")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_dev.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
> index a0bf7050037a..a52da6180c69 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.h
> @@ -82,7 +82,7 @@ struct komeda_dev {
>  struct clk *mclk;
>
>  /** @irq: irq number */
> -u32 irq;
> +int irq;
>

Hi Dan:

    Thank you.

    Liviu and I discussed this problem, and we decided to fix it by

    Remove IRQ parsing from initial series:
    https://patchwork.freedesktop.org/patch/277409/

    And add it back when add the fully IRQ handling:
    https://patchwork.freedesktop.org/patch/279491/

>  int n_pipelines;
>  struct komeda_pipeline *pipelines[KOMEDA_MAX_PIPELINES];
IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.
