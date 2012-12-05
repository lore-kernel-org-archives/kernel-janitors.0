From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Wed, 05 Dec 2012 04:07:03 +0000
Subject: Re: [PATCH] staging: rtl8712: avoid a useless call to memset().
Message-Id: <50BEC867.7090209@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1354670522-27144-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1354670522-27144-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyril Roelandt <tipecaml@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org, yongjun_wei@trendmicro.com.cn, jim.cromie@gmail.com, marcos.souza.org@gmail.com, devel@driverdev.osuosl.org

On 12/04/2012 07:22 PM, Cyril Roelandt wrote:
> In r8711_wx_get_wap(), make sure we do not call memcpy() on a memory area that
> has just been zeroed by a call to memset().
>
> Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
> ---
>   drivers/staging/rtl8712/rtl871x_ioctl_linux.c |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry

>
> diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
> index 3a64790..2c73319 100644
> --- a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
> +++ b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
> @@ -1131,10 +1131,11 @@ static int r8711_wx_get_wap(struct net_device *dev,
>   	struct ndis_wlan_bssid_ex *pcur_bss = &pmlmepriv->cur_network.network;
>
>   	wrqu->ap_addr.sa_family = ARPHRD_ETHER;
> -	memset(wrqu->ap_addr.sa_data, 0, ETH_ALEN);
>   	if (check_fwstate(pmlmepriv, _FW_LINKED |
>   	    WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE)) {
>   		memcpy(wrqu->ap_addr.sa_data, pcur_bss->MacAddress, ETH_ALEN);
> +	} else {
> +		memset(wrqu->ap_addr.sa_data, 0, ETH_ALEN);
>   	}
>   	return 0;
>   }
>

