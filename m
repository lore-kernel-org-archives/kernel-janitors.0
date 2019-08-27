From: walter harms <wharms@bfs.de>
Date: Tue, 27 Aug 2019 07:24:47 +0000
Subject: Re: [PATCH -next] net: mlx5: Kconfig: Fix MLX5_CORE_EN dependencies
Message-Id: <5D64DABF.4010601@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190827031251.98881-1-maowenan@huawei.com>
In-Reply-To: <20190827031251.98881-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: saeedm@mellanox.com, leon@kernel.org, davem@davemloft.net, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 27.08.2019 05:12, schrieb Mao Wenan:
> When MLX5_CORE_EN=y and PCI_HYPERV_INTERFACE is not set, below errors are found:
> drivers/net/ethernet/mellanox/mlx5/core/en_main.o: In function `mlx5e_nic_enable':
> en_main.c:(.text+0xb649): undefined reference to `mlx5e_hv_vhca_stats_create'
> drivers/net/ethernet/mellanox/mlx5/core/en_main.o: In function `mlx5e_nic_disable':
> en_main.c:(.text+0xb8c4): undefined reference to `mlx5e_hv_vhca_stats_destroy'
> 
> This because CONFIG_PCI_HYPERV_INTERFACE is newly introduced by 'commit 348dd93e40c1
> ("PCI: hv: Add a Hyper-V PCI interface driver for software backchannel interface"),
> Fix this by making MLX5_CORE_EN imply PCI_HYPERV_INTERFACE.
> 
> Fixes: cef35af34d6d ("net/mlx5e: Add mlx5e HV VHCA stats agent")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/Kconfig b/drivers/net/ethernet/mellanox/mlx5/core/Kconfig
> index 37fef8c..a6a70ce 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/Kconfig
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/Kconfig
> @@ -35,6 +35,7 @@ config MLX5_CORE_EN
>  	depends on IPV6=y || IPV6=n || MLX5_CORE=m

OT but ...
is that IPV6 needed at all ? can there be something else that yes or no ?

re,
 wh

>  	select PAGE_POOL
>  	select DIMLIB
> +	imply PCI_HYPERV_INTERFACE
>  	default n
>  	---help---
>  	  Ethernet support in Mellanox Technologies ConnectX-4 NIC.
