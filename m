From: Ioana Ciornei <ioana.ciornei@nxp.com>
Date: Tue, 02 Feb 2021 12:36:55 +0000
Subject: Re: [PATCH] bus: fsl-mc: Fix test for end of loop
Message-Id: <20210202123654.yf5qx3k6lfkiiqru@skbuf>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YBf0Br9obNGZTcNI@mwanda>
In-Reply-To: <YBf0Br9obNGZTcNI@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, Feb 01, 2021 at 03:28:54PM +0300, Dan Carpenter wrote:
> The "desc" pointer can't possibly be NULL here.  If we can't find the
> correct "desc" then tt points to the last element of the
> fsl_mc_accepted_cmds[] array.  Fix this by testing if
> "i == FSL_MC_NUM_ACCEPTED_CMDS" instead.
> 
> Fixes: 2cf1e703f066 ("bus: fsl-mc: add fsl-mc userspace support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Ioana Ciornei <ioana.ciornei@nxp.com>

Thanks!

> ---
>  drivers/bus/fsl-mc/fsl-mc-uapi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/fsl-mc/fsl-mc-uapi.c b/drivers/bus/fsl-mc/fsl-mc-uapi.c
> index eeb988c9f4bb..bdcd9d983a78 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-uapi.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-uapi.c
> @@ -338,7 +338,7 @@ static int fsl_mc_command_check(struct fsl_mc_device *mc_dev,
>  		if ((cmdid & desc->cmdid_mask) == desc->cmdid_value)
>  			break;
>  	}
> -	if (!desc) {
> +	if (i == FSL_MC_NUM_ACCEPTED_CMDS) {
>  		dev_err(&mc_dev->dev, "MC command 0x%04x: cmdid not accepted\n", cmdid);
>  		return -EACCES;
>  	}
> -- 
> 2.29.2
> 
