From: Vignesh R <vigneshr@ti.com>
Date: Mon, 25 Jul 2016 10:46:39 +0000
Subject: Re: [PATCH 1/2] driver: w1: fix quoted strings split across lines
Message-Id: <b1ef4030-c774-20cc-3a73-2559752774e4@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1469313922-3453-2-git-send-email-ben.werbowyj@gmail.com>
In-Reply-To: <1469313922-3453-2-git-send-email-ben.werbowyj@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Sunday 24 July 2016 04:15 AM, Ben Werbowyj wrote:
> Coding style corrections as indentified by checkpatch.pl scripts.

nit, s/indentified/identified

Regards
Vignesh

> Quoted strings split across line.
> 
> Signed-off-by: Ben Werbowyj <ben.werbowyj@gmail.com>
> ---
>  drivers/w1/masters/omap_hdq.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/w1/masters/omap_hdq.c b/drivers/w1/masters/omap_hdq.c
> index a2eec97..7d0987d 100644
> --- a/drivers/w1/masters/omap_hdq.c
> +++ b/drivers/w1/masters/omap_hdq.c
> @@ -203,8 +203,9 @@ static int hdq_write_byte(struct hdq_data *hdq_data, u8 val, u8 *status)
>  	*status = hdq_data->hdq_irqstatus;
>  	/* check irqstatus */
>  	if (!(*status & OMAP_HDQ_INT_STATUS_TXCOMPLETE)) {
> -		dev_dbg(hdq_data->dev, "timeout waiting for"
> -			" TXCOMPLETE/RXCOMPLETE, %x", *status);
> +		dev_dbg(hdq_data->dev,
> +			"timeout waiting for TXCOMPLETE/RXCOMPLETE, %x",
> +			*status);
>  		ret = -ETIMEDOUT;
>  		goto out;
>  	}
> @@ -214,8 +215,9 @@ static int hdq_write_byte(struct hdq_data *hdq_data, u8 val, u8 *status)
>  			OMAP_HDQ_CTRL_STATUS_GO,
>  			OMAP_HDQ_FLAG_CLEAR, &tmp_status);
>  	if (ret) {
> -		dev_dbg(hdq_data->dev, "timeout waiting GO bit"
> -			" return to zero, %x", tmp_status);
> +		dev_dbg(hdq_data->dev,
> +			"timeout waiting GO bit return to zero, %x",
> +			tmp_status);
>  	}
>  
>  out:
> @@ -365,8 +367,9 @@ static int omap_hdq_break(struct hdq_data *hdq_data)
>  			OMAP_HDQ_CTRL_STATUS_GO, OMAP_HDQ_FLAG_CLEAR,
>  			&tmp_status);
>  	if (ret)
> -		dev_dbg(hdq_data->dev, "timeout waiting INIT&GO bits"
> -			" return to zero, %x", tmp_status);
> +		dev_dbg(hdq_data->dev,
> +			"timeout waiting INIT&GO bits return to zero, %x",
> +			tmp_status);
>  
>  out:
>  	mutex_unlock(&hdq_data->hdq_mutex);
> @@ -409,8 +412,8 @@ static int hdq_read_byte(struct hdq_data *hdq_data, u8 *val)
>  		status = hdq_data->hdq_irqstatus;
>  		/* check irqstatus */
>  		if (!(status & OMAP_HDQ_INT_STATUS_RXCOMPLETE)) {
> -			dev_dbg(hdq_data->dev, "timeout waiting for"
> -				" RXCOMPLETE, %x", status);
> +			dev_dbg(hdq_data->dev,
> +				"timeout waiting for RXCOMPLETE, %x", status);
>  			ret = -ETIMEDOUT;
>  			goto out;
>  		}
> @@ -484,8 +487,8 @@ static int omap_hdq_put(struct hdq_data *hdq_data)
>  	hdq_reg_out(hdq_data, OMAP_HDQ_SYSCONFIG,
>  		    OMAP_HDQ_SYSCONFIG_AUTOIDLE);
>  	if (0 = hdq_data->hdq_usecount) {
> -		dev_dbg(hdq_data->dev, "attempt to decrement use count"
> -			" when it is zero");
> +		dev_dbg(hdq_data->dev,
> +			"attempt to decrement use count when it is zero");
>  		ret = -EINVAL;
>  	} else {
>  		hdq_data->hdq_usecount--;
> 

