From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 16 Jun 2018 06:03:14 +0000
Subject: Re: [PATCH] staging: rtl8192u: fix line over 80 characters
Message-Id: <alpine.DEB.2.20.1806160802390.2380@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1909265.MoDodiKBI3@os-virtualbox>
In-Reply-To: <1909265.MoDodiKBI3@os-virtualbox>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hyunil Kim <thtlwlsmsgkfla@gmail.com>
Cc: gregkh@linuxfoundation.org, davem@davemloft.net, colin.king@canonical.com, johannes.berg@intel.com, Linyu.Yuan@alcatel-sbell.com.cn, keescook@chromium.org, tvboxspy@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On Sat, 16 Jun 2018, Hyunil Kim wrote:

> *fix checkpatch.pl warnings:
>  WARNING: line over 80 characters

Describe what you do and why, rather than just saying "Fix".  Often
something can be fixed in multiple ways.

julia

>
> Signed-off-by: Hyunil Kim <thtlwlsmsgkfla@gmail.com>
> ---
>  drivers/staging/rtl8192u/r8192U_core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
> index 74c5865..2111e01 100644
> --- a/drivers/staging/rtl8192u/r8192U_core.c
> +++ b/drivers/staging/rtl8192u/r8192U_core.c
> @@ -2044,7 +2044,10 @@ static bool GetNmodeSupportBySecCfg8192(struct net_device *dev)
>  		return false;
>  	} else if ((wpa_ie_len != 0)) {
>  		/* parse pairwise key type */
> -		if (((ieee->wpa_ie[0] = 0xdd) && (!memcmp(&(ieee->wpa_ie[14]), ccmp_ie, 4))) || ((ieee->wpa_ie[0] = 0x30) && (!memcmp(&ieee->wpa_ie[10], ccmp_rsn_ie, 4))))
> +		if (((ieee->wpa_ie[0] = 0xdd) &&
> +		    (!memcmp(&(ieee->wpa_ie[14]), ccmp_ie, 4))) ||
> +		    ((ieee->wpa_ie[0] = 0x30) &&
> +		    (!memcmp(&ieee->wpa_ie[10], ccmp_rsn_ie, 4))))
>  			return true;
>  		else
>  			return false;
> --
> 2.7.4
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
