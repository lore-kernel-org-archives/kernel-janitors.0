From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Thu, 26 Sep 2019 00:05:40 +0000
Subject: Re: [PATCH] staging: rtl8188eu: fix possible null dereference
Message-Id: <b725820f-525c-519b-4474-476abf004985@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925213215.25082-1-connor.kuehl@canonical.com>
In-Reply-To: <20190925213215.25082-1-connor.kuehl@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Connor Kuehl <connor.kuehl@canonical.com>, gregkh@linuxfoundation.org, straube.linux@gmail.com, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 9/25/19 4:32 PM, Connor Kuehl wrote:
> Inside a nested 'else' block at the beginning of this function is a
> call that assigns 'psta' to the return value of 'rtw_get_stainfo()'.
> If 'rtw_get_stainfo()' returns NULL and the flow of control reaches
> the 'else if' where 'psta' is dereferenced, then we will dereference
> a NULL pointer.
> 
> Fix this by checking if 'psta' is not NULL before reading its
> 'psta->qos_option' data member.
> 
> Addresses-Coverity: ("Dereference null return value")
> 
> Signed-off-by: Connor Kuehl <connor.kuehl@canonical.com>
> ---
>   drivers/staging/rtl8188eu/core/rtw_xmit.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8188eu/core/rtw_xmit.c b/drivers/staging/rtl8188eu/core/rtw_xmit.c
> index 952f2ab51347..bf8877cbe9b6 100644
> --- a/drivers/staging/rtl8188eu/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8188eu/core/rtw_xmit.c
> @@ -784,7 +784,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
>   			memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
>   			memcpy(pwlanhdr->addr3, get_bssid(pmlmepriv), ETH_ALEN);
>   
> -			if (psta->qos_option)
> +			if (psta && psta->qos_option)
>   				qos_option = true;
>   		} else {
>   			RT_TRACE(_module_rtl871x_xmit_c_, _drv_err_, ("fw_state:%x is not allowed to xmit frame\n", get_fwstate(pmlmepriv)));
> 

This change is a good one, but why not get the same fix at line 779?

Larry
