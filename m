From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Wed, 07 Aug 2019 12:59:42 +0000
Subject: Re: [PATCH] IB/mlx5: Check the correct variable in error handling code
Message-Id: <20190807125942.GG1557@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190807123236.GA11452@mwanda>
In-Reply-To: <20190807123236.GA11452@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Leon Romanovsky <leon@kernel.org>, Yishai Hadas <yishaih@mellanox.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Aug 07, 2019 at 03:32:36PM +0300, Dan Carpenter wrote:
> The code accidentally checks "event_sub" instead of "event_sub->eventfd".
> 
> Fixes: 759738537142 ("IB/mlx5: Enable subscription for device events over DEVX")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/infiniband/hw/mlx5/devx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>

Jason
