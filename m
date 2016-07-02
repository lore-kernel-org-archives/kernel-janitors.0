From: Arend Van Spriel <arend.vanspriel@broadcom.com>
Date: Sat, 02 Jul 2016 18:00:33 +0000
Subject: Re: [patch] mwifiex: fix mwifiex_add_virtual_intf()
Message-Id: <d95186fc-fa1f-b60d-41a9-4d25c7ccc53d@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160702072045.GA25758@mwanda>
In-Reply-To: <20160702072045.GA25758@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Amitkumar Karwar <akarwar@marvell.com>
Cc: Nishant Sarmukadam <nishants@marvell.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org



On 2-7-2016 9:20, Dan Carpenter wrote:
> We accidentally left some if statements out so the
> mwifiex_add_virtual_intf() function returns early.
> 
> Fixes: 7311ea850079 ('mwifiex: fix AP start problem for newly added interface')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Someone beat you to it [1] ;-)

Regards,
Arend

[1]
http://mid.gmane.org/1467401982-18943-1-git-send-email-javier@osg.samsung.com

> diff --git a/drivers/net/wireless/marvell/mwifiex/cfg80211.c b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
> index 99e8cf1..5de9f63 100644
> --- a/drivers/net/wireless/marvell/mwifiex/cfg80211.c
> +++ b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
> @@ -2865,9 +2865,11 @@ struct wireless_dev *mwifiex_add_virtual_intf(struct wiphy *wiphy,
>  
>  	ret = mwifiex_send_cmd(priv, HostCmd_CMD_SET_BSS_MODE,
>  			       HostCmd_ACT_GEN_SET, 0, NULL, true);
> +	if (ret)
>  		return ERR_PTR(ret);
>  
>  	ret = mwifiex_sta_init_cmd(priv, false, false);
> +	if (ret)
>  		return ERR_PTR(ret);
>  
>  	mwifiex_setup_ht_caps(&wiphy->bands[NL80211_BAND_2GHZ]->ht_cap, priv);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
