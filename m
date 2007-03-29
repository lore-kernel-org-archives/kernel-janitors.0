From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Thu, 29 Mar 2007 03:48:14 +0000
Subject: Re: [KJ] [PATCH] BIT macro cleanup
Message-Id: <460B36FE.5050301@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070328033309.GA9597@arun.site>
In-Reply-To: <20070328033309.GA9597@arun.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Milind Arun Choudhary <milindchoudhary@gmail.com>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org

Milind Arun Choudhary wrote:
> BIT macro cleanup,now in bitops.h
>
> Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>
>
> ---
>   
<snip>
> diff --git a/drivers/net/s2io.h b/drivers/net/s2io.h
> index 0de0c65..5aa3be5 100644
> --- a/drivers/net/s2io.h
> +++ b/drivers/net/s2io.h
> @@ -14,6 +14,7 @@
>  #define _S2IO_H
>  
>  #define TBD 0
> +#undef BIT
>  #define BIT(loc)		(0x8000000000000000ULL >> (loc))
>  #define vBIT(val, loc, sz)	(((u64)val) << (64-loc-sz))
>  #define INV(d)  ((d&0xff)<<24) | (((d>>8)&0xff)<<16) | (((d>>16)&0xff)<<8)| ((d>>24)&0xff)
>   
Why not use "LLBIT(63 - loc)" instead?

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
