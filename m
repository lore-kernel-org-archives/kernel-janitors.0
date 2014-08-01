From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Fri, 01 Aug 2014 12:51:09 +0000
Subject: Re: [patch] clk: shmobile: r8a7779: silence some static checker warnings
Message-Id: <1995244.UIfbW0RkjC@avalon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140801081926.GB28869@mwanda>
In-Reply-To: <20140801081926.GB28869@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

On Friday 01 August 2014 11:19:26 Dan Carpenter wrote:
> It may seem like the laziest thing to leave an obvious memory leak but,
> in the long run, it's even less work to just fix it.  Lots of people
> review static checker warnings so let's not waste their time.
> 
> Also deliberately putting false positive static checker warnings in the
> code means that we will miss real bugs when they are introduced because
> there is too much noise and not enough signal.

I agree with your argument. However, I still feel there's a problem to 
address, maybe at a bigger scale.

The kfree() calls below adds useless code to the kernel, increasing the image 
size. The increase is of course small, but if we add all the occurrences of 
cleanup code that will anyway lead to system crash, I believe there's room for 
optimization. On the other hand, we need to make sure code validation tools 
will not generate false positives, for the reason you've outlined above. Could 
we find a common solution to both problems ? Is that a topic that should be 
brought up on LKML ?

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/clk/shmobile/clk-rcar-gen2.c
> b/drivers/clk/shmobile/clk-rcar-gen2.c index dff7f79..cf3bf9e 100644
> --- a/drivers/clk/shmobile/clk-rcar-gen2.c
> +++ b/drivers/clk/shmobile/clk-rcar-gen2.c
> @@ -292,10 +292,8 @@ static void __init rcar_gen2_cpg_clocks_init(struct
> device_node *np) cpg = kzalloc(sizeof(*cpg), GFP_KERNEL);
>  	clks = kzalloc(num_clks * sizeof(*clks), GFP_KERNEL);
>  	if (cpg = NULL || clks = NULL) {
> -		/* We're leaking memory on purpose, there's no point in cleaning
> -		 * up as the system won't boot anyway.
> -		 */
> -		pr_err("%s: failed to allocate cpg\n", __func__);
> +		kfree(cpg);
> +		kfree(clks);
>  		return;
>  	}
> 
> diff --git a/drivers/clk/shmobile/clk-r8a7740.c
> b/drivers/clk/shmobile/clk-r8a7740.c index 1e2eaae..54fb56a 100644
> --- a/drivers/clk/shmobile/clk-r8a7740.c
> +++ b/drivers/clk/shmobile/clk-r8a7740.c
> @@ -163,9 +163,8 @@ static void __init r8a7740_cpg_clocks_init(struct
> device_node *np) cpg = kzalloc(sizeof(*cpg), GFP_KERNEL);
>  	clks = kzalloc(num_clks * sizeof(*clks), GFP_KERNEL);
>  	if (cpg = NULL || clks = NULL) {
> -		/* We're leaking memory on purpose, there's no point in cleaning
> -		 * up as the system won't boot anyway.
> -		 */
> +		kfree(cpg);
> +		kfree(clks);
>  		return;
>  	}
> 
> diff --git a/drivers/clk/shmobile/clk-r8a7779.c
> b/drivers/clk/shmobile/clk-r8a7779.c index 652ecac..56e29dd 100644
> --- a/drivers/clk/shmobile/clk-r8a7779.c
> +++ b/drivers/clk/shmobile/clk-r8a7779.c
> @@ -137,9 +137,8 @@ static void __init r8a7779_cpg_clocks_init(struct
> device_node *np) cpg = kzalloc(sizeof(*cpg), GFP_KERNEL);
>  	clks = kzalloc(CPG_NUM_CLOCKS * sizeof(*clks), GFP_KERNEL);
>  	if (cpg = NULL || clks = NULL) {
> -		/* We're leaking memory on purpose, there's no point in cleaning
> -		 * up as the system won't boot anyway.
> -		 */
> +		kfree(cpg);
> +		kfree(clks);
>  		return;
>  	}

-- 
Regards,

Laurent Pinchart

