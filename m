From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Wed, 27 Mar 2019 13:21:14 +0000
Subject: Re: [PATCH] IB/iser: remove uninitialized variable len
Message-Id: <20190327132114.GA13128@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190316230512.8933-1-colin.king@canonical.com>
In-Reply-To: <20190316230512.8933-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Sagi Grimberg <sagi@grimberg.me>, Max Gurtovoy <maxg@mellanox.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Mar 16, 2019 at 11:05:12PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable len is not being inintialized and the uninitialized
> value is being returned. However, this return path is never reached
> because the default case in the switch statement returns -ENOSYS.
> Clean up the code by replacing the return -ENOSYS with a break
> for the default case and returning -ENOSYS at the end of the
> function.  This allows len to be removed.  Also remove redundant
> break that follows a return statement.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Max Gurtovoy <maxg@mellanox.com>
> Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
> ---
>  drivers/infiniband/ulp/iser/iscsi_iser.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Applied to for-next

Thanks,
Jason
