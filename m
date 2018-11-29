From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Thu, 29 Nov 2018 23:40:26 +0000
Subject: Re: [PATCH -next] RDMA/uverbs: Use PTR_ERR_OR_ZERO in ib_uverbs_create_cq()
Message-Id: <20181129234026.GA11432@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543455402-79511-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1543455402-79511-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Nov 29, 2018 at 01:36:42AM +0000, YueHaibing wrote:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/infiniband/core/uverbs_cmd.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Sorry, but kbuild-robot beat you to it, I applied that version

Thanks,
Jason
