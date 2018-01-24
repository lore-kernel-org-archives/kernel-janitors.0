From: walter harms <wharms@bfs.de>
Date: Wed, 24 Jan 2018 08:16:48 +0000
Subject: Re: [PATCH-next] misc: mic: Use PTR_ERR_OR_ZERO
Message-Id: <5A6840F0.9090201@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180123201009.12998-1-chrisadr@gentoo.org>
In-Reply-To: <20180123201009.12998-1-chrisadr@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org
Cc: =?UTF-8?B?Q2hyaXN0b3BoZXIgRMOtYXogUml2ZXJvcw==?= <chrisadr@gentoo.org>, sudeep.dutt@intel.com, ashutosh.dixit@intel.com, arnd@arndb.de, gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org



Am 23.01.2018 21:10, schrieb Christopher Díaz Riveros:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Christopher Díaz Riveros <chrisadr@gentoo.org>
> ---
>  drivers/misc/mic/scif/scif_epd.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/misc/mic/scif/scif_epd.h b/drivers/misc/mic/scif/scif_epd.h
> index f39b663da287..b2a835665390 100644
> --- a/drivers/misc/mic/scif/scif_epd.h
> +++ b/drivers/misc/mic/scif/scif_epd.h
> @@ -165,9 +165,7 @@ static inline int scif_verify_epd(struct scif_endpt *ep)
>  static inline int scif_anon_inode_getfile(scif_epd_t epd)
>  {
>  	epd->anon = anon_inode_getfile("scif", &scif_anon_fops, NULL, 0);
> -	if (IS_ERR(epd->anon))
> -		return PTR_ERR(epd->anon);
> -	return 0;
> +	return PTR_ERR_OR_ZERO(epd->anon);
>  }
>  

the patch looks ok,
but someone should thing about if it makes sense to have a oneliner as function.
IMHO this will only confuse readers (note: yes, there are reasons in some cases,
but i do not see what applies here if any).

re,
 wh

>  static inline void scif_anon_inode_fput(scif_epd_t epd)
