From: Leon Romanovsky <leon@kernel.org>
Date: Tue, 28 May 2019 14:38:14 +0000
Subject: Re: [PATCH] net/mlx5: potential error pointer dereference in error handling
Message-Id: <20190528143814.GQ4633@mtr-leonro.mtl.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190503122839.GB29695@mwanda>
In-Reply-To: <20190503122839.GB29695@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, May 03, 2019 at 03:28:39PM +0300, Dan Carpenter wrote:
> The error handling was a bit flipped around.  If the mlx5_create_flow_group()
> function failed then it would have resulted in dereferencing "fg" when
> it was an error pointer.
>
> Fixes: 80f09dfc237f ("net/mlx5: Eswitch, enable RoCE loopback traffic")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/rdma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Sorry for the delay, applied to mlx5-next branch.
6cc070bdf07c net/mlx5: potential error pointer dereference in error handling

Thanks
