From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Fri, 27 Nov 2020 13:05:21 +0000
Subject: Re: [PATCH] RDMA/mlx5: Fix a error code in devx_umem_reg_cmd_alloc()
Message-Id: <20201127130521.GV5487@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201127074349.GA7391@mwanda>
In-Reply-To: <20201127074349.GA7391@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Leon Romanovsky <leon@kernel.org>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Nov 27, 2020 at 10:43:49AM +0300, Dan Carpenter wrote:
> This code returns PTR_ERR(NULL) which is zero or success but it should
> return -ENOMEM.
> 
> Fixes: 878f7b31c3a7 ("RDMA/mlx5: Use ib_umem_find_best_pgsz() for devx")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/infiniband/hw/mlx5/devx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Not quite, it is worse, cmd->in is never NULL in the first place

https://lore.kernel.org/linux-rdma/0-v1-4d05ccc1c223+173-devx_err_ptr_jgg@nvidia.com/

Jason
