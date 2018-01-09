From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Tue, 09 Jan 2018 09:48:23 +0000
Subject: Re: [PATCH 1/2] slimbus: qcom-ctrl: fix a NULL test
Message-Id: <0e365f53-bb45-2d95-30fb-9a862319df35@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180109092616.mfha2rs56oaxfjaz@mwanda>
In-Reply-To: <20180109092616.mfha2rs56oaxfjaz@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Sagar Dharia <sdharia@codeaurora.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 09/01/18 09:26, Dan Carpenter wrote:
> "retries" ends when it is set to -1 and not 0 so that part of the test
> is wrong.  This bug would lead to a NULL dereference a couple lines
> later.
> 
> Fixes: afbdcc7c384b ("slimbus: Add messaging APIs to slimbus framework")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Should Greg be added to the MAINTAINERS file for this driver?
> 
> diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
> index fb1a5e0eb8dd..3ab59209cbdc 100644
> --- a/drivers/slimbus/qcom-ctrl.c
> +++ b/drivers/slimbus/qcom-ctrl.c
> @@ -345,7 +345,7 @@ static int qcom_xfer_msg(struct slim_controller *sctrl,
>   		}
>   	}
>   
> -	if (!retries && !pbuf)
> +	if (!pbuf)
>   		return -ENOMEM;
>   
>   	puc = (u8 *)pbuf;
> 

Already fixed at:
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1575799.html
