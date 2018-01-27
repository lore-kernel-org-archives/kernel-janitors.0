From: Mikko Perttunen <cyndis@kapsi.fi>
Date: Sat, 27 Jan 2018 15:03:12 +0000
Subject: Re: [PATCH] firmware: tegra: adjust tested variable
Message-Id: <2c6c4a51-93d4-04b6-db53-5ef582db97c8@kapsi.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1517063308-16679-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1517063308-16679-1-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

On 01/27/2018 04:28 PM, Julia Lawall wrote:
> Check the variable that was most recently initialized.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x, y, f, g, e, m;
> statement S1,S2,S3,S4;
> @@
> 
> x = f(...);
> if (\(<+...x...+>\&e\)) S1 else S2
> (
> x = g(...);
> |
> m = g(...,&x,...);
> |
> y = g(...);
> *if (e)
>   S3 else S4
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>   drivers/firmware/tegra/bpmp.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
> index a7f461f..96362b5 100644
> --- a/drivers/firmware/tegra/bpmp.c
> +++ b/drivers/firmware/tegra/bpmp.c
> @@ -732,7 +732,7 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
>   	}
>   
>   	bpmp->rx.virt = gen_pool_dma_alloc(bpmp->rx.pool, 4096, &bpmp->rx.phys);
> -	if (!bpmp->rx.pool) {
> +	if (!bpmp->rx.virt) {
>   		dev_err(&pdev->dev, "failed to allocate from RX pool\n");
>   		err = -ENOMEM;
>   		goto free_tx;
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
