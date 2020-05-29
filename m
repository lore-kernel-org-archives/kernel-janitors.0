From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Fri, 29 May 2020 18:20:36 +0000
Subject: Re: [PATCH][next] RDMA/hns: remove duplicate assignment to pointer raq
Message-Id: <20200529182036.GA11361@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200528150427.420624-1-colin.king@canonical.com>
In-Reply-To: <20200528150427.420624-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Lijun Ou <oulijun@huawei.com>, Wei Hu <huwei87@hisilicon.com>, Weihang Li <liweihang@huawei.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, May 28, 2020 at 04:04:27PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer raq is being assigned twice. Fix this by removing
> one of the redundant assignments.
> 
> Fixes: 14ba87304bf9 ("RDMA/hns: Remove redundant type cast for general pointers")
> Addressses-Coverity: ("Evaluation order violation")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_hw_v1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next

Thanks,
Jason
