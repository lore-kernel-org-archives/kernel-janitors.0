From: Mark Hollomon <markhollomon@comcast.net>
Date: Wed, 25 May 2005 19:07:26 +0000
Subject: Re: [KJ] [PATCH] Fix gcc4 warning, def & len may be used uninitialized
Message-Id: <4294CCEE.70907@comcast.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Jesse Millan wrote:
> 
> --- linux-2.6.12-rc4/fs/cifs/asn1.c~	2005-05-24 22:25:21.436866468 -0700
> +++ linux-2.6.12-rc4/fs/cifs/asn1.c	2005-05-24 22:49:43.744939729 -0700
> @@ -160,12 +160,18 @@ asn1_length_decode(struct asn1_ctx *ctx,
>  {
>  	unsigned char ch, cnt;
> 
> -	if (!asn1_octet_decode(ctx, &ch))
> +	if (!asn1_octet_decode(ctx, &ch)) {
> +		/* Function would have returned without initializing 'def' and 'len' */
> +		*def = 0;
> +		*len = 0;
>  		return 0;
> +	}
> 
> -	if (ch = 0x80)
> +	if (ch = 0x80) {
>  		*def = 0;
> -	else {
> +		/* Function would have returned without initializing 'len' */
> +		*len = 0;
> +	} else {
>  		*def = 1;
> 
>  		if (ch < 0x80)
> 
> 

Wouldn't it be better to just initialize def and len at the top of the function 
and be done? Or does that violate some kernel style preference?

-- 
Mark Hollomon
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
