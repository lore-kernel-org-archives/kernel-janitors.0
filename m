From: Leon Romanovsky <leon@kernel.org>
Date: Fri, 20 Mar 2020 14:32:02 +0000
Subject: Re: [PATCH] {IB,net}/mlx5: Remove unused variable
Message-Id: <20200320143202.GG514123@unreal>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200320132525.GE95012@mwanda>
In-Reply-To: <20200320132525.GE95012@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Saeed Mahameed <saeedm@mellanox.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Mar 20, 2020 at 04:25:25PM +0300, Dan Carpenter wrote:
> The "key" variable is never initialized or used except to print out a
> debug message.
>
> Fixes: fc6a9f86f08a ("{IB,net}/mlx5: Assign mkey variant in mlx5_ib only")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/mr.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>

Thanks, for the patch, but Saeed already fixed it and it is in linux-next.
https://git.kernel.org/pub/scm/linux/kernel/git/mellanox/linux.git/commit/?=
h=3Dmlx5-next&id=826096d84f509d95ee8f72728fe19c44fbb9df6b

Thanks
