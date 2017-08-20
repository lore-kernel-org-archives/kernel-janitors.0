From: walter harms <wharms@bfs.de>
Date: Sun, 20 Aug 2017 19:11:30 +0000
Subject: Re: [PATCH 2/2] soc/fsl/qe: Slighly simplify code
Message-Id: <5999DEE2.6030405@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170820155328.882-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170820155328.882-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 20.08.2017 17:53, schrieb Christophe JAILLET:
> Return 0 instead of 'ret' (which is 0 at this point) to make the code more
> explicit.
> Also avoid a useless initialization of 'ret'.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/soc/fsl/qe/qe_tdm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe_tdm.c b/drivers/soc/fsl/qe/qe_tdm.c
> index 6b9647fee512..c90c72ca9e3e 100644
> --- a/drivers/soc/fsl/qe/qe_tdm.c
> +++ b/drivers/soc/fsl/qe/qe_tdm.c
> @@ -42,7 +42,7 @@ int ucc_of_parse_tdm(struct device_node *np, struct ucc_tdm *utdm,
>  		     struct ucc_tdm_info *ut_info)
>  {
>  	const char *sprop;
> -	int ret = 0;
> +	int ret;
>  	u32 val;
>  	struct resource *res;
>  	struct device_node *np2;
> @@ -171,7 +171,7 @@ int ucc_of_parse_tdm(struct device_node *np, struct ucc_tdm *utdm,
>  		siram_init_flag = 1;
>  	}
>  
> -	return ret;
> +	return 0;
>  
>  err_miss_siram_property:
>  	return ret;

This lonely return ret looks like a left over from some cleanup opperation.
Is there any reason why to use goto instead of a plain return ?

re,
 wh


