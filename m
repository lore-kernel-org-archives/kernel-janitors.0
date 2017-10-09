From: Oleksij Rempel <ore@pengutronix.de>
Date: Mon, 09 Oct 2017 05:14:06 +0000
Subject: Re: [PATCH] remoteproc: imx_rproc: fix a couple off by one bugs
Message-Id: <c98efbc8-7f6c-e26e-d8cf-54308c32e7dd@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171005125827.sfnrpmqhrgmpy3fp@mwanda>
In-Reply-To: <20171005125827.sfnrpmqhrgmpy3fp@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Ohad Ben-Cohen <ohad@wizery.com>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On 05.10.2017 14:58, Dan Carpenter wrote:
> The priv->mem[] array has IMX7D_RPROC_MEM_MAX elements so the > should
> be >= to avoid writing one element beyond the end of the array.
> 
> Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale imx_rproc driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 612d91403341..81ba44510b75 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -264,7 +264,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>   		if (!(att->flags & ATT_OWN))
>   			continue;
>   
> -		if (b > IMX7D_RPROC_MEM_MAX)
> +		if (b >= IMX7D_RPROC_MEM_MAX)
>   			break;


ahrr... you are right!
thx.
