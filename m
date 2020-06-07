From: Leon Romanovsky <leon@kernel.org>
Date: Sun, 07 Jun 2020 06:40:16 +0000
Subject: Re: [PATCH][next] RDMA/mlx5: remove duplicated assignment to resp.response_length
Message-Id: <20200607064016.GF164174@unreal>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200604143902.56021-1-colin.king@canonical.com>
In-Reply-To: <20200604143902.56021-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 04, 2020 at 03:39:02PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The assignment to resp.response_length is never read since it is being
> updated again on the next statement. The assignment is redundant so
> removed it.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/mlx5/qp.c | 2 --
>  1 file changed, 2 deletions(-)
>

Thanks,
Acked-by: Leon Romanovsky <leonro@mellanox.com>
