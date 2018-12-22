From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Sat, 22 Dec 2018 23:09:18 +0000
Subject: Re: [PATCH] RDMA/mlx5: Signedness bug in UVERBS_HANDLER()
Message-Id: <20181222230918.GB20963@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181222074332.GA7662@kadam>
In-Reply-To: <20181222074332.GA7662@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Dec 22, 2018 at 10:43:32AM +0300, Dan Carpenter wrote:
> The "num_actions" variable needs to be signed for the error handling to
> work.  The maximum number of actions is less than 256 so int type is
> large enough for that.
> 
> Fixes: cbfdd442c43e ("IB/uverbs: Add helper to get array size from ptr attribute")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Leon Romanovsky <leonro@mellanox.com>
> ---
>  drivers/infiniband/hw/mlx5/flow.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next

Thanks,
Jason
