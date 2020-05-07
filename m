From: Leon Romanovsky <leon@kernel.org>
Date: Thu, 07 May 2020 18:24:32 +0000
Subject: Re: [PATCH][next] RDMA/mlx5: remove duplicated assignment to variable rcqe_sz
Message-Id: <20200507182432.GD104730@unreal>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200507151610.52636-1-colin.king@canonical.com>
In-Reply-To: <20200507151610.52636-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, May 07, 2020 at 04:16:10PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable rcqe_sz is being unnecessarily assigned twice, fix this
> by removing one of the duplicates.
>
> Addresses-Coverity: ("Evaluation order violation")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/mlx5/qp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>

Fixes: 8bde2c509e40 ("RDMA/mlx5: Update all DRIVER QP places to use QP subtype")

Thanks,
Acked-by: Leon Romanovsky <leonro@mellanox.com>
