From: Parav Pandit <parav@nvidia.com>
Date: Fri, 05 Feb 2021 12:04:43 +0000
Subject: RE: [PATCH] net/mlx5: docs: correct section reference in table of contents
Message-Id: <BY5PR12MB432262D2F829A3D14D584AD1DCB29@BY5PR12MB4322.namprd12.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210205095506.29146-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210205095506.29146-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Saeed Mahameed <saeedm@nvidia.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



> From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Sent: Friday, February 5, 2021 3:25 PM
> 
> Commit 142d93d12dc1 ("net/mlx5: Add devlink subfunction port
> documentation") refers to a section 'mlx5 port function' in the table of
> contents, but includes a section 'mlx5 function attributes' instead.
> 
> Hence, make htmldocs warns:
> 
>   mlx5.rst:16: WARNING: Unknown target name: "mlx5 port function".
> 
> Correct the section reference in table of contents to the actual name of
> section in the documentation.
> 
> Also, tune another section underline while visiting this document.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Saeed, please pick this patch for your -next tree on top of the commit above.
> 
>  .../networking/device_drivers/ethernet/mellanox/mlx5.rst      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git
> a/Documentation/networking/device_drivers/ethernet/mellanox/mlx5.rst
> b/Documentation/networking/device_drivers/ethernet/mellanox/mlx5.rst
> index a1b32fcd0d76..1b7e32d8a61b 100644
> --- a/Documentation/networking/device_drivers/ethernet/mellanox/mlx5.rst
> +++
> b/Documentation/networking/device_drivers/ethernet/mellanox/mlx5.rst
> @@ -13,12 +13,12 @@ Contents
>  - `Devlink info`_
>  - `Devlink parameters`_
>  - `mlx5 subfunction`_
> -- `mlx5 port function`_
> +- `mlx5 function attributes`_
>  - `Devlink health reporters`_
>  - `mlx5 tracepoints`_
> 
>  Enabling the driver and kconfig options -
> ================================================
> +=======================================
> 
>  | mlx5 core is modular and most of the major mlx5 core driver features can
> be selected (compiled in/out)  | at build time via kernel Kconfig flags.
> --
> 2.17.1

Thanks.
Reviewed-by: Parav Pandit <parav@nvidia.com>
