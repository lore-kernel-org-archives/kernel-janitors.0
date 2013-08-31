From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Sat, 31 Aug 2013 16:37:21 +0000
Subject: Re: [patch 2/2] staging: rtl8188eu: || vs && typo
Message-Id: <52221BC1.3040501@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130829214614.GC23197@elgon.mountain>
In-Reply-To: <20130829214614.GC23197@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 08/29/2013 04:46 PM, Dan Carpenter wrote:
> Obviously it's impossible for ->KeyLength to be both 5 and 13.  I assume
> that && was intended here.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c b/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
> index 5fab477..193f641 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_ioctl_set.c
> @@ -743,7 +743,7 @@ _func_enter_;
>
>   		/*  Check key length for WEP. For NDTEST, 2005.01.27, by rcnjko. */
>   		if ((encryptionalgo = _WEP40_ || encryptionalgo = _WEP104_) &&
> -		    (key->KeyLength != 5 || key->KeyLength != 13)) {
> +		    (key->KeyLength != 5 && key->KeyLength != 13)) {
>   			RT_TRACE(_module_rtl871x_ioctl_set_c_, _drv_err_, ("WEP KeyLength:0x%x != 5 or 13\n", key->KeyLength));
>   			ret = _FAIL;
>   			goto exit;

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry


