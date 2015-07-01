From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Wed, 01 Jul 2015 06:58:23 +0000
Subject: Re: [PATCH] Staging: unisys: virtpci: fixed a brace coding style issue
Message-Id: <20150701065749.GA2411@sudip-PC>
List-Id: <kernel-janitors.vger.kernel.org>
References: <55930BB1.10502@zoho.com>
In-Reply-To: <55930BB1.10502@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sohny Thomas <sohnythomas@zoho.com>
Cc: benjamin.romer@unisys.com, david.kershner@unisys.com, bryan.thompson@unisys.com, erik.arfvidson@unisys.com, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, sparmaintainer@unisys.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jul 01, 2015 at 03:05:45AM +0530, Sohny Thomas wrote:
> 
> FIX 2 unnecessary braces found by checkpatch.pl
> 
> Signed-off-by: Sohny Thomas <sohnythomas@zoho.com>
> ---
>  drivers/staging/unisys/virtpci/virtpci.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/unisys/virtpci/virtpci.c b/drivers/staging/unisys/virtpci/virtpci.c
> index d5ad017..f3674de 100644
> --- a/drivers/staging/unisys/virtpci/virtpci.c
> +++ b/drivers/staging/unisys/virtpci/virtpci.c
> @@ -190,9 +190,10 @@ static int write_vbus_chp_info(struct spar_vbus_channel_protocol *chan,
>  		return -1;
>  
>  	off = sizeof(struct channel_header) + chan->hdr_info.chp_info_offset;
> -	if (chan->hdr_info.chp_info_offset = 0) {
> +
> +	if (chan->hdr_info.chp_info_offset = 0)
>  		return -1;
> -	}
> +
why you are inserting new line here?

>  	memcpy(((u8 *)(chan)) + off, info, sizeof(*info));
>  	return 0;
>  }
> @@ -484,10 +485,10 @@ static int delete_vhba(struct del_virt_guestpart *delparams)
>  
>  	i = virtpci_device_del(NULL /*no parent bus */, VIRTHBA_TYPE,
>  			       &scsi.wwnn, NULL);
> -	if (i) {
> +	if (i)
>  		return 1;
> -	}
> -	return 0;
> +	else
> +		return 0;
No, now this will introduce a new checkpatch warning that "else is not
required after return". why did you introduce this "else"?

regards
sudip
