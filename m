From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Feb 2020 11:27:35 +0000
Subject: Re: [PATCH] staging: rtl8723bs: core: remove redundant zero'ing of counter variable k
Message-Id: <20200224112735.GC3286@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200223152840.418439-1-colin.king@canonical.com>
 <5f875f84e6014d2bb5b78f71dc2831a2@bfs.de>
In-Reply-To: <5f875f84e6014d2bb5b78f71dc2831a2@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walter Harms <wharms@bfs.de>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Colin King <colin.king@canonical.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Mon, Feb 24, 2020 at 11:07:55AM +0000, Walter Harms wrote:
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index 3b8848182221..bdb6ff8aab7d 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -244,10 +244,8 @@ u16        Address)
>                 while (!(Bytetemp & 0x80)) {
>                         Bytetemp = rtw_read8(Adapter, EFUSE_CTRL+3);
>                         k++;
> -                       if (k = 1000) {
> -                               k = 0;
> +                       if (k = 1000)
>                                 break;
> -                       }
> 
> IMHO this is confusing to read, i suggest:
> 
>  for(k=0;k<1000;k++) {
>       Bytetemp = rtw_read8(Adapter, EFUSE_CTRL+3);
>       if ( Bytetemp & 0x80 )
>                break;
>       }
> 

The problem with the original code is that the variable is named "k"
instead of "retry".  It should be:

	do {
		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL+3);
	} while (!(Bytetemp & 0x80)) && ++retry < 1000);


>  NTL is am wondering what will happen if k=1000
>  and Bytetemp is still invalid. Will rtw_read8() fail or
>  simply return invalid data ?

Yeah.  That was my thought reviewing this patch as well.

It should probably return 0xff on failure.

	if (retry >= 1000)
		return 0xff;

regards,
dan carpenter
