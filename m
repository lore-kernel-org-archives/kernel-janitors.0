From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 01 Sep 2020 09:35:21 +0000
Subject: Re: [PATCH] rtlwifi: switch from 'pci_' to 'dma_' API
Message-Id: <20200901093521.0FB3EC43391@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200820144604.144521-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200820144604.144521-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: pkshih@realtek.com, davem@davemloft.net, kuba@kernel.org, Larry.Finger@lwfinger.net, straube.linux@gmail.com, zhengbin13@huawei.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> The only file where some GFP_ flags are updated is 'pci.c'.
> 
> When memory is allocated in '_rtl_pci_init_tx_ring()' and
> '_rtl_pci_init_rx_ring()' GFP_KERNEL can be used because both functions are
> called from a probe function and no spinlock is taken.
> 
> The call chain is:
>   rtl_pci_probe
>     --> rtl_pci_init
>       --> _rtl_pci_init_trx_ring
>         --> _rtl_pci_init_rx_ring
>         --> _rtl_pci_init_tx_ring
> 
> 
> @@
> @@
> -    PCI_DMA_BIDIRECTIONAL
> +    DMA_BIDIRECTIONAL
> 
> @@
> @@
> -    PCI_DMA_TODEVICE
> +    DMA_TO_DEVICE
> 
> @@
> @@
> -    PCI_DMA_FROMDEVICE
> +    DMA_FROM_DEVICE
> 
> @@
> @@
> -    PCI_DMA_NONE
> +    DMA_NONE
> 
> @@
> expression e1, e2, e3;
> @@
> -    pci_alloc_consistent(e1, e2, e3)
> +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
> 
> @@
> expression e1, e2, e3;
> @@
> -    pci_zalloc_consistent(e1, e2, e3)
> +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_free_consistent(e1, e2, e3, e4)
> +    dma_free_coherent(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_map_single(e1, e2, e3, e4)
> +    dma_map_single(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_single(e1, e2, e3, e4)
> +    dma_unmap_single(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4, e5;
> @@
> -    pci_map_page(e1, e2, e3, e4, e5)
> +    dma_map_page(&e1->dev, e2, e3, e4, e5)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_page(e1, e2, e3, e4)
> +    dma_unmap_page(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_map_sg(e1, e2, e3, e4)
> +    dma_map_sg(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_sg(e1, e2, e3, e4)
> +    dma_unmap_sg(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
> +    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_single_for_device(e1, e2, e3, e4)
> +    dma_sync_single_for_device(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
> +    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
> +    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2;
> @@
> -    pci_dma_mapping_error(e1, e2)
> +    dma_mapping_error(&e1->dev, e2)
> 
> @@
> expression e1, e2;
> @@
> -    pci_set_dma_mask(e1, e2)
> +    dma_set_mask(&e1->dev, e2)
> 
> @@
> expression e1, e2;
> @@
> -    pci_set_consistent_dma_mask(e1, e2)
> +    dma_set_coherent_mask(&e1->dev, e2)
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Tested-by: Larry Finger <Larry.Finger@lwfinger.net> for rtl8821ae.

Failed to apply, please rebase on top of wireless-drivers-next.

Recorded preimage for 'drivers/net/wireless/realtek/rtlwifi/rtl8188ee/trx.c'
Recorded preimage for 'drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c'
Recorded preimage for 'drivers/net/wireless/realtek/rtlwifi/rtl8723be/trx.c'
error: Failed to merge in the changes.
Applying: rtlwifi: switch from 'pci_' to 'dma_' API
Using index info to reconstruct a base tree...
M	drivers/net/wireless/realtek/rtlwifi/pci.c
M	drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c
M	drivers/net/wireless/realtek/rtlwifi/rtl8188ee/trx.c
M	drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c
M	drivers/net/wireless/realtek/rtlwifi/rtl8192de/trx.c
M	drivers/net/wireless/realtek/rtlwifi/rtl8192ee/trx.c
M	drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c
M	drivers/net/wireless/realtek/rtlwifi/rtl8723ae/trx.c
M	drivers/net/wireless/realtek/rtlwifi/rtl8723be/hw.c
M	drivers/net/wireless/realtek/rtlwifi/rtl8723be/trx.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/realtek/rtlwifi/rtl8723be/trx.c
CONFLICT (content): Merge conflict in drivers/net/wireless/realtek/rtlwifi/rtl8723be/trx.c
Auto-merging drivers/net/wireless/realtek/rtlwifi/rtl8723be/hw.c
Auto-merging drivers/net/wireless/realtek/rtlwifi/rtl8723ae/trx.c
CONFLICT (content): Merge conflict in drivers/net/wireless/realtek/rtlwifi/rtl8723ae/trx.c
Auto-merging drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c
CONFLICT (content): Merge conflict in drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c
Auto-merging drivers/net/wireless/realtek/rtlwifi/rtl8192ee/trx.c
CONFLICT (content): Merge conflict in drivers/net/wireless/realtek/rtlwifi/rtl8192ee/trx.c
Auto-merging drivers/net/wireless/realtek/rtlwifi/rtl8192de/trx.c
CONFLICT (content): Merge conflict in drivers/net/wireless/realtek/rtlwifi/rtl8192de/trx.c
Auto-merging drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c
CONFLICT (content): Merge conflict in drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c
Auto-merging drivers/net/wireless/realtek/rtlwifi/rtl8188ee/trx.c
CONFLICT (content): Merge conflict in drivers/net/wireless/realtek/rtlwifi/rtl8188ee/trx.c
Auto-merging drivers/net/wireless/realtek/rtlwifi/rtl8188ee/hw.c
Auto-merging drivers/net/wireless/realtek/rtlwifi/pci.c
Patch failed at 0001 rtlwifi: switch from 'pci_' to 'dma_' API
The copy of the patch that failed is found in: .git/rebase-apply/patch

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11726377/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
