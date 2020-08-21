From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Fri, 21 Aug 2020 04:51:37 +0000
Subject: Re: [PATCH] rtlwifi: switch from 'pci_' to 'dma_' API
Message-Id: <e0f88024-0124-f425-850e-242027198d44@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200820144604.144521-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200820144604.144521-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, pkshih@realtek.com, kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org, straube.linux@gmail.com, zhengbin13@huawei.com
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 8/20/20 9:46 AM, Christophe JAILLET wrote:
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
>    rtl_pci_probe
>      --> rtl_pci_init
>        --> _rtl_pci_init_trx_ring
>          --> _rtl_pci_init_rx_ring
>          --> _rtl_pci_init_tx_ring
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
> ---
> If needed, see post from Christoph Hellwig on the kernel-janitors ML:
>     https://marc.info/?l=kernel-janitors&m8745678307186&w=4
> ---
>   drivers/net/wireless/realtek/rtlwifi/pci.c    | 116 +++++++++---------
>   .../wireless/realtek/rtlwifi/rtl8188ee/hw.c   |   9 +-
>   .../wireless/realtek/rtlwifi/rtl8188ee/trx.c  |  13 +-
>   .../wireless/realtek/rtlwifi/rtl8192ce/trx.c  |  14 +--
>   .../wireless/realtek/rtlwifi/rtl8192de/trx.c  |  12 +-
>   .../wireless/realtek/rtlwifi/rtl8192ee/trx.c  |  13 +-
>   .../wireless/realtek/rtlwifi/rtl8192se/trx.c  |  12 +-
>   .../wireless/realtek/rtlwifi/rtl8723ae/trx.c  |  14 +--
>   .../wireless/realtek/rtlwifi/rtl8723be/hw.c   |   9 +-
>   .../wireless/realtek/rtlwifi/rtl8723be/trx.c  |  13 +-
>   .../wireless/realtek/rtlwifi/rtl8821ae/hw.c   |   9 +-
>   .../wireless/realtek/rtlwifi/rtl8821ae/trx.c  |  13 +-
>   12 files changed, 115 insertions(+), 132 deletions(-)

Tested-by: Larry Finger <Larry.Finger@lwfinger.net> for rtl8821ae.

Larry
