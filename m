From: Scott Wood <oss@buserror.net>
Date: Sat, 29 Feb 2020 23:17:39 +0000
Subject: Re: [PATCH 2/2] powerpc/83xx: Add some error handling in 'quirk_mpc8360e_qe_enet10()'
Message-Id: <4b8581f5fd497b3fb1e5232510cd57c1e7ccb92d.camel@buserror.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200208140920.7652-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200208140920.7652-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, galak@kernel.crashing.org, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Sat, 2020-02-08 at 15:09 +0100, Christophe JAILLET wrote:
> In some error handling path, we should call "of_node_put(np_par)" or
> some resource may be leaking in case of error.
> 
> Fixes: 8159df72d43e ("83xx: add support for the kmeter1 board.")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  arch/powerpc/platforms/83xx/km83xx.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Both patches:
Acked-by: Scott Wood <oss@buserror.net>


> diff --git a/arch/powerpc/platforms/83xx/km83xx.c
> b/arch/powerpc/platforms/83xx/km83xx.c
> index 306be75faec7..bcdc2c203ec9 100644
> --- a/arch/powerpc/platforms/83xx/km83xx.c
> +++ b/arch/powerpc/platforms/83xx/km83xx.c
> @@ -60,10 +60,12 @@ static void quirk_mpc8360e_qe_enet10(void)
>  	ret = of_address_to_resource(np_par, 0, &res);
>  	if (ret) {
>  		pr_warn("%s couldn't map par_io registers\n", __func__);
> -		return;
> +		goto out;
>  	}
>  
>  	base = ioremap(res.start, resource_size(&res));
> +	if (!base)
> +		goto out;
>  
>  	/*
>  	 * set output delay adjustments to default values according
> @@ -111,6 +113,7 @@ static void quirk_mpc8360e_qe_enet10(void)
>  		setbits32((base + 0xac), 0x0000c000);
>  	}
>  	iounmap(base);
> +out:
>  	of_node_put(np_par);
>  }
>  
