From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Sat, 31 Aug 2013 16:36:49 +0000
Subject: Re: [patch] staging: r8188eu: copying one byte too much
Message-Id: <52221BA1.2030707@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130829214701.GD23197@elgon.mountain>
In-Reply-To: <20130829214701.GD23197@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 08/29/2013 04:47 PM, Dan Carpenter wrote:
> There is a copy and paste bug here so we copy 4 bytes instead of 3.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/staging/rtl8188eu/core/rtw_wlan_util.c b/drivers/staging/rtl8188eu/core/rtw_wlan_util.c
> index a43fc88..013ea48 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_wlan_util.c
> @@ -1592,7 +1592,7 @@ void update_bmc_sta_support_rate(struct adapter *padapter, u32 mac_id)
>   		/*  Only B, B/G, and B/G/N AP could use CCK rate */
>   		memcpy((pmlmeinfo->FW_sta_info[mac_id].SupportedRates), rtw_basic_rate_cck, 4);
>   	} else {
> -		memcpy((pmlmeinfo->FW_sta_info[mac_id].SupportedRates), rtw_basic_rate_ofdm, 4);
> +		memcpy((pmlmeinfo->FW_sta_info[mac_id].SupportedRates), rtw_basic_rate_ofdm, 3);
>   	}
>   }

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry



