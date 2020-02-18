From: Leon Romanovsky <leon@kernel.org>
Date: Tue, 18 Feb 2020 16:41:24 +0000
Subject: Re: [PATCH] IB/core: Fix a bitwise vs logical OR typo
Message-Id: <20200218164124.GA14557@unreal>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200218055801.cosg4fylgfxhk67s@kili.mountain>
In-Reply-To: <20200218055801.cosg4fylgfxhk67s@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Erez Alfasi <ereza@mellanox.com>, Maor Gottlieb <maorg@mellanox.com>, Mohamad Heib <mohamadh@mellanox.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Feb 18, 2020 at 08:58:01AM +0300, Dan Carpenter wrote:
> This was supposed to be a bitwise | instead of a logical ||.
>
> Fixes: 1dd017882e01 ("RDMA/core: Fix protection fault in get_pkey_idx_qp_list")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/infiniband/core/security.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Thanks,

There is an extra patch for that.
https://lore.kernel.org/lkml/20200217204318.13609-1-natechancellor@gmail.com

Reviewed-by: Leon Romanovsky <leonro@mellanox.com>
