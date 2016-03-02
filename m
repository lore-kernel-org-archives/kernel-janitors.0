From: Joerg Roedel <joro@8bytes.org>
Date: Wed, 02 Mar 2016 13:53:52 +0000
Subject: Re: [patch 1/2] iommu/mediatek: signedness bug in probe function
Message-Id: <20160302135351.GC20213@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160302101006.GF5533@mwanda>
In-Reply-To: <20160302101006.GF5533@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On Wed, Mar 02, 2016 at 01:10:06PM +0300, Dan Carpenter wrote:
> "larb_nr" needs to be signed for the error handling to work.  "i" can
> be int as well.
> 
> Fixes: 0df4fabe208d ('iommu/mediatek: Add mt8173 IOMMU driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 721ffdb..1a4022c 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -578,7 +578,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>  	struct resource         *res;
>  	struct component_match  *match = NULL;
>  	void                    *protect;
> -	unsigned int            i, larb_nr;
> +	int			i, larb_nr;
>  	int                     ret;
>  
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);

I merged a similar fix from Andrzej Hajda yesterday.
