From: Jes Sorensen <Jes.Sorensen@redhat.com>
Date: Sat, 03 May 2014 21:09:07 +0000
Subject: Re: [patch] staging: rtl8723au: fix some confusing indenting
Message-Id: <wrfjvbtmpo24.fsf@ultrasam.lan.trained-monkey.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140503201919.GB32753@mwanda>
In-Reply-To: <20140503201919.GB32753@mwanda> (Dan Carpenter's message of "Sat,
	3 May 2014 23:19:19 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:
> The break and the "unknown++" are at the same indent level so my static
> checker complains.  The if statement should be indented more.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Urgh yes, that should be cleaned up!

Acked-by: Jes Sorensen <Jes.Sorensen@redhat.com>

>
> diff --git a/drivers/staging/rtl8723au/core/rtw_mlme_ext.c b/drivers/staging/rtl8723au/core/rtw_mlme_ext.c
> index eb7b98e..4ad80e7 100644
> --- a/drivers/staging/rtl8723au/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723au/core/rtw_mlme_ext.c
> @@ -1235,8 +1235,8 @@ static int rtw_validate_frame_ies(const u8 *start, uint len)
>  		case WLAN_EID_ERP_INFO:
>  		case WLAN_EID_EXT_SUPP_RATES:
>  		case WLAN_EID_VENDOR_SPECIFIC:
> -		if (rtw_validate_vendor_specific_ies(pos, elen))
> -			unknown++;
> +			if (rtw_validate_vendor_specific_ies(pos, elen))
> +				unknown++;
>  			break;
>  		case WLAN_EID_RSN:
>  		case WLAN_EID_PWR_CAPABILITY:
