From: Amitkumar Karwar <akarwar@marvell.com>
Date: Wed, 05 Aug 2015 13:27:28 +0000
Subject: RE: [patch] mwifiex: usb: return an error if kmalloc fails
Message-Id: <4204aa5c96fe44e7a6f5b6e25e6e31cd@SC-EXCH04.marvell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150804074927.GD10867@mwanda>
In-Reply-To: <20150804074927.GD10867@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Nishant Sarmukadam <nishants@marvell.com>, Kalle Valo <kvalo@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan,

> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Tuesday, August 04, 2015 1:19 PM
> To: Amitkumar Karwar
> Cc: Nishant Sarmukadam; Kalle Valo; linux-wireless@vger.kernel.org;
> kernel-janitors@vger.kernel.org
> Subject: [patch] mwifiex: usb: return an error if kmalloc fails
> 
> The current code returns success if kmalloc fails.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/net/wireless/mwifiex/usb.c
> b/drivers/net/wireless/mwifiex/usb.c
> index fbad99c..f866d5d 100644
> --- a/drivers/net/wireless/mwifiex/usb.c
> +++ b/drivers/net/wireless/mwifiex/usb.c
> @@ -870,8 +870,10 @@ static int mwifiex_prog_fw_w_helper(struct
> mwifiex_adapter *adapter,
> 
>  	/* Allocate memory for transmit */
>  	fwdata = kzalloc(FW_DNLD_TX_BUF_SIZE, GFP_KERNEL);
> -	if (!fwdata)
> +	if (!fwdata) {
> +		ret = -ENOMEM;
>  		goto fw_exit;
> +	}
> 
>  	/* Allocate memory for receive */
>  	recv_buff = kzalloc(FW_DNLD_RX_BUF_SIZE, GFP_KERNEL);

Acked-by: Amitkumar Karwar <akarwar@marvell.com>

Regards,
Amitkumar
