From: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 16 Oct 2015 10:02:30 +0000
Subject: Re: [PATCH] powerpc/prom: Avoid reference to potentially freed memory
Message-Id: <1444989750.12954.4.camel@ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1444976055-19148-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1444976055-19148-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, benh@kernel.crashing.org, paulus@samba.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 2015-10-16 at 08:14 +0200, Christophe JAILLET wrote:

> of_get_property() is used inside the loop, but then the reference to the
> node is dropped before dereferencing the prop pointer, which could by then
> point to junk if the node has been freed.
> 
> Instead use of_property_read_u32() to actually read the property
> value before dropping the reference.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> *** UNTESTED ***
> ---
>  arch/powerpc/kernel/prom.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index bef76c5..dc4f6a4 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -783,14 +783,13 @@ void __init early_get_first_memblock_info(void *params, phys_addr_t *size)
>  int of_get_ibm_chip_id(struct device_node *np)
>  {
>  	of_node_get(np);
> -	while(np) {
> +	while (np) {
>  		struct device_node *old = np;
> -		const __be32 *prop;
> +		u32 chip_id;
>  
> -		prop = of_get_property(np, "ibm,chip-id", NULL);
> -		if (prop) {
> +		if (!of_property_read_u32(np, "ibm,chip-id", &chip_id))
>  			of_node_put(np);
> -			return be32_to_cpup(prop);
> +			return chip_id;
>  		}


As the kbuild robot detected you have left an extra "}" here.

I don't mind too much if you send patches that aren't compile tested, but you
might save yourself some time by compiling them.

There are x86->powerpc cross compilers here:

https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.9.0/x86_64-gcc-4.9.0-nolibc_powerpc64-linux.tar.gz

Or if you're running on Ubuntu you can just do:

$ apt-get install gcc-powerpc-linux-gnu

I think there's a package for Fedora too but I don't know the name off the top
of my head.

cheers

