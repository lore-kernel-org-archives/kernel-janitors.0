From: Joerg Roedel <joerg.roedel@amd.com>
Date: Tue, 02 Oct 2012 10:09:56 +0000
Subject: Re: [patch] iommu/amd: use after free in get_irq_table()
Message-Id: <20121002100956.GQ4009@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121002083439.GN12398@elgon.mountain>
In-Reply-To: <20121002083439.GN12398-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Oct 02, 2012 at 11:34:40AM +0300, Dan Carpenter wrote:
> We should return NULL on error instead of the freed pointer.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
> index e78b8a4..a636d68 100644
> --- a/drivers/iommu/amd_iommu.c
> +++ b/drivers/iommu/amd_iommu.c
> @@ -3867,6 +3867,7 @@ static struct irq_remap_table *get_irq_table(u16 devid, bool ioapic)
>  	table->table = kmem_cache_alloc(amd_iommu_irq_cache, GFP_ATOMIC);
>  	if (!table->table) {
>  		kfree(table);
> +		table = NULL;
>  		goto out;
>  	}

Good catch. Thanks, applied.

-- 
AMD Operating System Research Center

Advanced Micro Devices GmbH Einsteinring 24 85609 Dornach
General Managers: Alberto Bozzo
Registration: Dornach, Landkr. Muenchen; Registerger. Muenchen, HRB Nr. 43632

