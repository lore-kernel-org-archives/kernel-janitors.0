From: walter harms <wharms@bfs.de>
Date: Thu, 17 Aug 2017 12:28:10 +0000
Subject: Re: [PATCH] lib/string.c: check for kmalloc() failure
Message-Id: <59958BDA.6010309@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170817115420.uikisjvfmtrqkzjn@mwanda>
In-Reply-To: <20170817115420.uikisjvfmtrqkzjn@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 17.08.2017 13:54, schrieb Dan Carpenter:
> This is mostly to keep the number of static checker warnings down so
> we can spot new bugs instead of them being drowned in noise.  This
> function doesn't return normal kernel error codes but instead the return
> value is used to display exactly which memory failed.  I chose -1 as
> hopefully that's a helpful thing to print.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/lib/string.c b/lib/string.c
> index 661a6a6173c0..59e112cbcf22 100644
> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -1058,7 +1058,11 @@ EXPORT_SYMBOL(fortify_overflow);
>  static __init int memset16_selftest(void)
>  {
>  	unsigned i, j, k;
> -	u16 v, *p = kmalloc(256 * 2 * 2, GFP_KERNEL);
> +	u16 v, *p;
> +
> +	p = kmalloc(256 * 2 * 2, GFP_KERNEL);
> +	if (!p)
> +		return -1;
>  
>  	for (i = 0; i < 256; i++) {
>  		for (j = 0; j < 256; j++) {
> @@ -1090,7 +1094,11 @@ static __init int memset16_selftest(void)
>  static __init int memset32_selftest(void)
>  {
>  	unsigned i, j, k;
> -	u32 v, *p = kmalloc(256 * 2 * 4, GFP_KERNEL);
> +	u32 v, *p;
> +
> +	p = kmalloc(256 * 2 * 4, GFP_KERNEL);
> +	if (!p)
> +		return -1;
>  
>  	for (i = 0; i < 256; i++) {
>  		for (j = 0; j < 256; j++) {
> @@ -1122,7 +1130,11 @@ static __init int memset32_selftest(void)
>  static __init int memset64_selftest(void)
>  {
>  	unsigned i, j, k;
> -	u64 v, *p = kmalloc(256 * 2 * 8, GFP_KERNEL);
> +	u64 v, *p;
> +
> +	p = kmalloc(256 * 2 * 8, GFP_KERNEL);
> +	if (!p)
> +		return -1;


I assume that the multiplier 2/4/8 means sizeof(uX).
The 256 is an arbitrary block size but the *2 left me puzzled.
Could anybody (not necessarily Dan) drop a few helpful comments
for these numbers ?

re,
 wh

>  
>  	for (i = 0; i < 256; i++) {
>  		for (j = 0; j < 256; j++) {
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
