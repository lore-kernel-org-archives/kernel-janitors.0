From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Wed, 21 Nov 2018 23:51:17 +0000
Subject: Re: [PATCH -next] IB/srpt: Drop pointless static qualifier in srpt_make_tpg()
Message-Id: <20181121235117.GC21840@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1542279300-104731-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1542279300-104731-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Nov 15, 2018 at 10:55:00AM +0000, YueHaibing wrote:
> From: Yue Haibing <yuehaibing@huawei.com>
> 
> There is no need to have the 'struct se_portal_group *tpg' variable
> static since new value always be assigned before use it.
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> Reviewed-by: Leon Romanovsky <leonro@mellanox.com>
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  drivers/infiniband/ulp/srpt/ib_srpt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next

Thanks,
Jason
