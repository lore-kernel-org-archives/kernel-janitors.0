From: isdn@linux-pingi.de
Date: Thu, 22 Oct 2020 14:24:00 +0000
Subject: Re: [PATCH net] mISDN: hfcpci: Fix a use after free in hfcmulti_tx()
Message-Id: <0ee243a9-9937-ad26-0684-44b18e772662@linux-pingi.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201022070739.GB2817762@mwanda>
In-Reply-To: <20201022070739.GB2817762@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

that looks wrong to me and never was a use after free.

sp is set either to the address containing the pointer to the actual
D-channel SKB or to the actual B-channel SKB. This address is not freed
and will not change in this context. The dev_kfree(*sp) will delete the
old SKB and the call to  get_next_[bd]frame(), if returning true, will
place a new SKB into this address, so (*sp) point to this new SKB.
The len of course need to be the length of the new SKB, not the old one,
which would be the result of this patch.

Best regards
Karsten

On 10/22/20 9:07 AM, Dan Carpenter wrote:
> This frees "*sp" before dereferencing it to get "len = (*sp)->len;".
> 
> Fixes: af69fb3a8ffa ("Add mISDN HFC multiport driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/isdn/hardware/mISDN/hfcmulti.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/isdn/hardware/mISDN/hfcmulti.c b/drivers/isdn/hardware/mISDN/hfcmulti.c
> index 7013a3f08429..ce6c160e0df4 100644
> --- a/drivers/isdn/hardware/mISDN/hfcmulti.c
> +++ b/drivers/isdn/hardware/mISDN/hfcmulti.c
> @@ -2152,16 +2152,14 @@ hfcmulti_tx(struct hfc_multi *hc, int ch)
>  		HFC_wait_nodebug(hc);
>  	}
>  
> +	len = (*sp)->len;
>  	dev_kfree_skb(*sp);
>  	/* check for next frame */
> -	if (bch && get_next_bframe(bch)) {
> -		len = (*sp)->len;
> +	if (bch && get_next_bframe(bch))
>  		goto next_frame;
> -	}
> -	if (dch && get_next_dframe(dch)) {
> -		len = (*sp)->len;
> +
> +	if (dch && get_next_dframe(dch))
>  		goto next_frame;
> -	}
>  
>  	/*
>  	 * now we have no more data, so in case of transparent,
> 
