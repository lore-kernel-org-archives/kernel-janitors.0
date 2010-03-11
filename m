From: Nathan Fontenot <nfont@austin.ibm.com>
Date: Thu, 11 Mar 2010 15:16:54 +0000
Subject: Re: [PATCH 1/6] arch/powerpc/platforms/pseries: Use kasprintf
Message-Id: <4B990966.3060607@austin.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1003102214430.1672@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1003102214430.1672@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> kasprintf combines kmalloc and sprintf, and takes care of the size
> calculation itself.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression a,flag;
> expression list args;
> statement S;
> @@
> 
>   a > -  \(kmalloc\|kzalloc\)(...,flag)
> +  kasprintf(flag,args)
>   <... when != a
>   if (a = NULL || ...) S
>   ...>
> - sprintf(a,args);
> // </smpl>
> 

Looks good, thanks.

> Signed-off-by: Julia Lawall <julia@diku.dk>
Acked-by: Nathan Fontenot <nfont@austin.ibm.com>

> 
> ---
>  arch/powerpc/platforms/pseries/dlpar.c |    7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff -u -p a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
> --- a/arch/powerpc/platforms/pseries/dlpar.c
> +++ b/arch/powerpc/platforms/pseries/dlpar.c
> @@ -78,13 +78,12 @@ static struct device_node *dlpar_parse_c
>  	 * prepend this to the full_name.
>  	 */
>  	name = (char *)ccwa + ccwa->name_offset;
> -	dn->full_name = kmalloc(strlen(name) + 2, GFP_KERNEL);
> +	dn->full_name = kasprintf(GFP_KERNEL, "/%s", name);
>  	if (!dn->full_name) {
>  		kfree(dn);
>  		return NULL;
>  	}
>  
> -	sprintf(dn->full_name, "/%s", name);
>  	return dn;
>  }
>  
> @@ -409,15 +408,13 @@ static ssize_t dlpar_cpu_probe(const cha
>  	 * directory of the device tree.  CPUs actually live in the
>  	 * cpus directory so we need to fixup the full_name.
>  	 */
> -	cpu_name = kzalloc(strlen(dn->full_name) + strlen("/cpus") + 1,
> -			   GFP_KERNEL);
> +	cpu_name = kasprintf(GFP_KERNEL, "/cpus%s", dn->full_name);
>  	if (!cpu_name) {
>  		dlpar_free_cc_nodes(dn);
>  		rc = -ENOMEM;
>  		goto out;
>  	}
>  
> -	sprintf(cpu_name, "/cpus%s", dn->full_name);
>  	kfree(dn->full_name);
>  	dn->full_name = cpu_name;
>  
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev
