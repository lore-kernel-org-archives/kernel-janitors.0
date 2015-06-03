From: walter harms <wharms@bfs.de>
Date: Wed, 03 Jun 2015 07:14:37 +0000
Subject: Re: [PATCH 2/2] staging : wilc1000 : remove UWORD32
Message-Id: <556EA95D.3030502@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433294221-12123-1-git-send-email-chaehyun.lim@gmail.com>
In-Reply-To: <1433294221-12123-1-git-send-email-chaehyun.lim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


hi,
some remark for you patch:

1. where is the definition of UWORD32 ?
2. can it be removed also ?

hope that helps,
re,
 wh


Am 03.06.2015 03:17, schrieb chaehyun lim:
> Use u32 instead of UWORD32
> 
> Signed-off-by: chaehyun lim <chaehyun.lim@gmail.com>
> ---
>  drivers/staging/wilc1000/coreconfigurator.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/wilc1000/coreconfigurator.c b/drivers/staging/wilc1000/coreconfigurator.c
> index 958cf0b..0dc4413 100644
> --- a/drivers/staging/wilc1000/coreconfigurator.c
> +++ b/drivers/staging/wilc1000/coreconfigurator.c
> @@ -498,10 +498,10 @@ INLINE WILC_Uint32 get_beacon_timestamp_lo(WILC_Uint8 *data)
>  	return time_stamp;
>  }
>  
> -INLINE UWORD32 get_beacon_timestamp_hi(u8 *data)
> +INLINE u32 get_beacon_timestamp_hi(u8 *data)
>  {
> -	UWORD32 time_stamp = 0;
> -	UWORD32 index    = (MAC_HDR_LEN + 4);
> +	u32 time_stamp = 0;
> +	u32 index    = (MAC_HDR_LEN + 4);
>  
>  	time_stamp |= data[index++];
>  	time_stamp |= (data[index++] << 8);
