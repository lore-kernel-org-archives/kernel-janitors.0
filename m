From: Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 14 Oct 2015 04:00:11 +0000
Subject: Re: powerpc/mpc5xxx: Use of_get_next_parent to simplify code
Message-Id: <20151014040011.8AB1514110A@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1444595260-3332-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, benh@kernel.crashing.org, paulus@samba.org
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Sun, 2015-11-10 at 20:27:40 UTC, Christophe Jaillet wrote:
> of_get_next_parent can be used to simplify the while() loop and
> avoid the need of a temp variable.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  arch/powerpc/sysdev/mpc5xxx_clocks.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/sysdev/mpc5xxx_clocks.c b/arch/powerpc/sysdev/mpc5xxx_clocks.c
> index f4f0301..5732926 100644
> --- a/arch/powerpc/sysdev/mpc5xxx_clocks.c
> +++ b/arch/powerpc/sysdev/mpc5xxx_clocks.c
> @@ -13,7 +13,6 @@
>  
>  unsigned long mpc5xxx_get_bus_frequency(struct device_node *node)
>  {
> -	struct device_node *np;
>  	const unsigned int *p_bus_freq = NULL;
>  
>  	of_node_get(node);
> @@ -22,9 +21,7 @@ unsigned long mpc5xxx_get_bus_frequency(struct device_node *node)
>  		if (p_bus_freq)
>  			break;
>  
> -		np = of_get_parent(node);
> -		of_node_put(node);
> -		node = np;
> +		node = of_get_next_parent(node);
>  	}
>  	of_node_put(node);


This conversion is OK, but the logic in the function is still wrong.

It uses of_get_property() inside the loop, but then drops the reference to the
node before dereferencing the p_bus_freq pointer, which could by then point to
junk if the node has been freed.

Instead it should use of_property_read_u32() to actually read the property
value before dropping the reference.

cheers
