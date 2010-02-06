From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Date: Sat, 06 Feb 2010 09:52:18 +0000
Subject: Re: [PATCH 2/11] arch/mips/sni: Correct NULL test
Message-Id: <20100206095218.GA7185@alpha.franken.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1002060942010.8092@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1002060942010.8092@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Feb 06, 2010 at 09:42:16AM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Test the value that was just allocated rather than the previously tested one.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r@
> expression *x;
> expression e;
> identifier l;
> @@
> 
> if (x = NULL || ...) {
>     ... when forall
>     return ...; }
> ... when != goto l;
>     when != x = e
>     when != &x
> *x = NULL
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> send
> ---
>  arch/mips/sni/rm200.c               |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/mips/sni/rm200.c b/arch/mips/sni/rm200.c
> index 46f0069..31e2583 100644
> --- a/arch/mips/sni/rm200.c
> +++ b/arch/mips/sni/rm200.c
> @@ -404,7 +404,7 @@ void __init sni_rm200_i8259_irqs(void)
>  	if (!rm200_pic_master)
>  		return;
>  	rm200_pic_slave = ioremap_nocache(0x160000a0, 4);
> -	if (!rm200_pic_master) {
> +	if (!rm200_pic_slave) {
>  		iounmap(rm200_pic_master);
>  		return;
>  	}

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Thanks for fixing.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                                [ RFC1925, 2.3 ]
