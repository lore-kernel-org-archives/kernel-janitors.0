From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Mon, 28 May 2007 23:11:31 +0000
Subject: Re: [KJ] [PATCH] drivers/video: fix compiler warnings
Message-Id: <465B61A3.9040801@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070528222828.GA25955@sisko.site>
In-Reply-To: <20070528222828.GA25955@sisko.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Martin Baeuml wrote:
> Fix some compile warnings:
> warning: ‘*’ may be used uninitialized in this function
>
> Signed-off-by: Martin Baeuml <baeuml@gmail.com>
> ---
> Compile tested on i386.
> Diffed against Linus' git tree.
>
>  drivers/video/matrox/matroxfb_maven.c |    6 +++---
>  drivers/video/riva/riva_hw.c          |    3 ++-
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/video/matrox/matroxfb_maven.c b/drivers/video/matrox/matroxfb_maven.c
> index 5d29a26..907aef0 100644
> --- a/drivers/video/matrox/matroxfb_maven.c
> +++ b/drivers/video/matrox/matroxfb_maven.c
> @@ -284,7 +284,7 @@ static unsigned int matroxfb_mavenclock(const struct matrox_pll_ctl* ctl,
>  		unsigned int* in, unsigned int* feed, unsigned int* post,
>  		unsigned int* htotal2) {
>  	unsigned int fvco;
> -	unsigned int p;
> +	unsigned int p = 0;
>  
>  	fvco = matroxfb_PLL_mavenclock(&maven1000_pll, ctl, htotal, vtotal, in, feed, &p, htotal2);
>   
matroxfb_PLL_mavenclock() will initialize this variable (have not 
checked the rest). When the compiler warns about "may be used 
uninitialized", it is code for "I have no clue what is happening". So 
most of them is alright and we need to check them by hand. There has 
been some attempt to fix this (the problem is, initialize them when it 
is not needed is just cruft) by some macros and such... I have done some 
minor testing to diff the output of builds (with trees pulled one week 
apart) to see when there is new warnings.

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
