From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 28 Jul 2017 14:51:35 +0000
Subject: Re: mwifiex: usb: unlock on error in mwifiex_usb_tx_aggr_tmo()
Message-Id: <20170728145135.D98EC60915@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170710072115.2y4ukbl7x4rk4bac@mwanda>
In-Reply-To: <20170710072115.2y4ukbl7x4rk4bac@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Amitkumar Karwar <amitkarwar@gmail.com>, Xinming Hu <huxm@marvell.com>, Nishant Sarmukadam <nishants@marvell.com>, Ganapathi Bhat <gbhat@marvell.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We need to unlock if mwifiex_usb_prepare_tx_aggr_skb() fails.
> 
> Fixes: a2ca85ad721d ("mwifiex: usb: add timer to flush aggregation packets")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/net/wireless/marvell/mwifiex/usb.c b/drivers/net/wireless/marvell/mwifiex/usb.c
> index cb1753e43ef4..880ef1cb4088 100644
> --- a/drivers/net/wireless/marvell/mwifiex/usb.c
> +++ b/drivers/net/wireless/marvell/mwifiex/usb.c
> @@ -1112,7 +1112,7 @@ static void mwifiex_usb_tx_aggr_tmo(unsigned long context)
>  	if (err) {
>  		mwifiex_dbg(adapter, ERROR,
>  			    "prepare tx aggr skb failed, err=%d\n", err);
> -		return;
> +		goto unlock;
>  	}
>  
>  	if (atomic_read(&port->tx_data_urb_pending) >> @@ -1133,6 +1133,7 @@ static void mwifiex_usb_tx_aggr_tmo(unsigned long context)
>  done:
>  	if (err = -1)
>  		mwifiex_write_data_complete(adapter, skb_send, 0, -1);
> +unlock:
>  	spin_unlock_irqrestore(&port->tx_aggr_lock, flags);
>  }

Patch applied to wireless-drivers-next.git, thanks.

fe0c94be77a0 mwifiex: usb: unlock on error in mwifiex_usb_tx_aggr_tmo()

-- 
https://patchwork.kernel.org/patch/9832397/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

