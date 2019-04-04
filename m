From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Apr 2019 09:41:41 +0000
Subject: Re: [PATCH] staging: rtl8192u: remove redundant null check on array 'data'
Message-Id: <20190404094141.GJ32590@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190404093257.18757-1-colin.king@canonical.com>
In-Reply-To: <20190404093257.18757-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Whitmore <johnfwhitmore@gmail.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Apr 04, 2019 at 10:32:57AM +0100, Colin King wrote:
> diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> index 944c8894f9ff..c4a4f118f547 100644
> --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
> @@ -2659,8 +2659,7 @@ static int ieee80211_wpa_set_wpa_ie(struct ieee80211_device *ieee,
>  {
>  	u8 *buf;
>  
> -	if (param->u.wpa_ie.len > MAX_WPA_IE_LEN ||
> -	    (param->u.wpa_ie.len && param->u.wpa_ie.data = NULL))
> +	if (param->u.wpa_ie.len > MAX_WPA_IE_LEN || param->u.wpa_ie.len)
>  		return -EINVAL;

Nope...  :P  Don't do that...

regards,
dan carpenter
