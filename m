From: "Arend van Spriel" <arend@broadcom.com>
Date: Wed, 03 Oct 2012 07:07:27 +0000
Subject: Re: [patch 1/3] brcmfmac: cleanup casts in brcmf_c_mkiovar_bsscfg()
Message-Id: <506BE42F.4070203@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121003060515.GA3802@elgon.mountain>
In-Reply-To: <20121003060515.GA3802@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Brett Rudley <brudley@broadcom.com>, Roland Vossen <rvossen@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Kan Yan <kanyan@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, Alwin Beukers <alwin@broadcom.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, kernel-janitors@vger.kernel.org

On 10/03/2012 08:05 AM, Dan Carpenter wrote:
> Remove some pointless casts from the return value of strlen().  The
> "buflen" variable is already an unsigned int so it's never less than
> zero and doesn't need to be casted to u32.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c b/drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c
> index 15c5db5..ae0978c 100644
> --- a/drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c
> +++ b/drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c
> @@ -102,11 +102,11 @@ brcmf_c_mkiovar_bsscfg(char *name, char *data, uint datalen,

Internally we reworked this code and moved the function to another file. 
The casts are no longer there.

>   	if (bssidx = 0)
>   		return brcmf_c_mkiovar(name, data, datalen, buf, buflen);
>
> -	prefixlen = (u32) strlen(prefix); /* lengh of bsscfg prefix */
> -	namelen = (u32) strlen(name) + 1; /* lengh of iovar  name + null */
> +	prefixlen = strlen(prefix); /* lengh of bsscfg prefix */
> +	namelen = strlen(name) + 1; /* lengh of iovar name + null */
>   	iolen = prefixlen + namelen + sizeof(bssidx_le) + datalen;
>
> -	if (buflen < 0 || iolen > (u32)buflen) {
> +	if (buflen < iolen) {

This is still wrong internally so we will fix this with the appropriate 
credits ;-)

>   		brcmf_dbg(ERROR, "buffer is too short\n");
>   		return 0;
>   	}
>

Thanks.

Gr. AvS

