From: Lu Baolu <baolu.lu@linux.intel.com>
Date: Thu, 12 Mar 2020 12:02:41 +0000
Subject: Re: [PATCH] iommu/vt-d: Unlock on error paths
Message-Id: <0f0dcaca-5c33-c78c-6d38-2bbae26cbff2@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200312113730.GF20562@mwanda>
In-Reply-To: <20200312113730.GF20562@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, David Woodhouse <dwmw2@infradead.org>, Megha Dey <megha.dey@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, iommu@lists.linux-foundation.org

On 2020/3/12 19:37, Dan Carpenter wrote:
> There were a couple places where we need to unlock before returning.
> 
> Fixes: 91391b919e19 ("iommu/vt-d: Populate debugfs if IOMMUs are detected")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/iommu/intel-iommu-debugfs.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/intel-iommu-debugfs.c b/drivers/iommu/intel-iommu-debugfs.c
> index 8d24c4d85cc2..6a495b103972 100644
> --- a/drivers/iommu/intel-iommu-debugfs.c
> +++ b/drivers/iommu/intel-iommu-debugfs.c
> @@ -289,11 +289,12 @@ static int dmar_translation_struct_show(struct seq_file *m, void *unused)
>   		sts = dmar_readl(iommu->reg + DMAR_GSTS_REG);
>   		if (!(sts & DMA_GSTS_TES)) {
>   			seq_puts(m, "DMA Remapping is not enabled\n");
> -			return 0;
> +			goto unlock;
>   		}
>   		root_tbl_walk(m, iommu);
>   		seq_putc(m, '\n');
>   	}
> +unlock:
>   	rcu_read_unlock();
>   
>   	return 0;
> @@ -444,7 +445,7 @@ static int ir_translation_struct_show(struct seq_file *m, void *unused)
>   		sts = dmar_readl(iommu->reg + DMAR_GSTS_REG);
>   		if (!(sts & DMA_GSTS_IRES)) {
>   			seq_puts(m, "Interrupt Remapping is not enabled\n");
> -			return 0;
> +			goto unlock;
>   		}
>   
>   		if (iommu->ir_table) {
> @@ -475,6 +476,7 @@ static int ir_translation_struct_show(struct seq_file *m, void *unused)
>   		}
>   		seq_putc(m, '\n');
>   	}
> +unlock:
>   	rcu_read_unlock();
>   
>   	return 0;
> 

Thanks a lot for the catch. I think it could be further cleanup. How
about below changes?

index 8d24c4d85cc2..2583a6743dd0 100644
--- a/drivers/iommu/intel-iommu-debugfs.c
+++ b/drivers/iommu/intel-iommu-debugfs.c
@@ -288,8 +288,9 @@ static int dmar_translation_struct_show(struct 
seq_file *m, void *unused)
         for_each_active_iommu(iommu, drhd) {
                 sts = dmar_readl(iommu->reg + DMAR_GSTS_REG);
                 if (!(sts & DMA_GSTS_TES)) {
-                       seq_puts(m, "DMA Remapping is not enabled\n");
-                       return 0;
+                       seq_printf(m, "DMA Remapping is not enabled on 
%s\n",
+                                  iommu->name);
+                       continue;
                 }
                 root_tbl_walk(m, iommu);
                 seq_putc(m, '\n');
@@ -431,7 +432,6 @@ static int ir_translation_struct_show(struct 
seq_file *m, void *unused)
         struct dmar_drhd_unit *drhd;
         struct intel_iommu *iommu;
         u64 irta;
-       u32 sts;

         rcu_read_lock();
         for_each_active_iommu(iommu, drhd) {
@@ -441,12 +441,6 @@ static int ir_translation_struct_show(struct 
seq_file *m, void *unused)
                 seq_printf(m, "Remapped Interrupt supported on IOMMU: 
%s\n",
                            iommu->name);

-               sts = dmar_readl(iommu->reg + DMAR_GSTS_REG);
-               if (!(sts & DMA_GSTS_IRES)) {
-                       seq_puts(m, "Interrupt Remapping is not enabled\n");
-                       return 0;
-               }
-
                 if (iommu->ir_table) {
                         irta = virt_to_phys(iommu->ir_table->base);
                         seq_printf(m, " IR table address:%llx\n", irta);

Best regards,
baolu
