From: Ido Schimmel <idosch@idosch.org>
Date: Thu, 14 Jan 2021 09:47:07 +0000
Subject: Re: [PATCH] mlxsw: pci: switch from 'pci_' to 'dma_' API
Message-Id: <20210114094707.GA1979201@shredder.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210114084757.490540-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20210114084757.490540-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: jiri@nvidia.com, idosch@nvidia.com, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jan 14, 2021 at 09:47:57AM +0100, Christophe JAILLET wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'mlxsw_pci_queue_init()' and
> 'mlxsw_pci_fw_area_init()' GFP_KERNEL can be used because both functions
> are already using this flag and no lock is acquired.
> 
> When memory is allocated in 'mlxsw_pci_mbox_alloc()' GFP_KERNEL can be used
> because it is only called from the probe function and no lock is acquired
> in the between.
> The call chain is:
>   --> mlxsw_pci_probe()
>     --> mlxsw_pci_cmd_init()
>       --> mlxsw_pci_mbox_alloc()
> 
> While at it, also replace the 'dma_set_mask/dma_set_coherent_mask' sequence
> by a less verbose 'dma_set_mask_and_coherent() call.

[...]

> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

For net-next:

Tested-by: Ido Schimmel <idosch@nvidia.com>

Thanks
