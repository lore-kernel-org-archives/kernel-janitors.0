From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Fri, 08 Jun 2018 23:13:09 +0000
Subject: Re: [PATCH -next] IB/mlx5: Fix return value check in flow_counters_set_data()
Message-Id: <20180608231309.GA24865@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1528336061-13069-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1528336061-13069-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jun 07, 2018 at 01:47:41AM +0000, weiyongjun (A) wrote:
> In case of error, the function mlx5_fc_create() returns ERR_PTR() and
> never returns NULL. The NULL test in the return value check should be
> replaced with IS_ERR().
> 
> Fixes: 3b3233fbf02e ("IB/mlx5: Add flow counters binding support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Acked-by: Leon Romanovsky <leonro@mellanox.com>
> ---
>  drivers/infiniband/hw/mlx5/main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to for-rc, thanks

Jason
