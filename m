From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Mon, 28 Oct 2019 16:54:36 +0000
Subject: Re: [PATCH][next] RDMA/hns: fix memory leak on 'context' on error return path
Message-Id: <20191028165436.GA18470@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191024131034.19989-1-colin.king@canonical.com>
In-Reply-To: <20191024131034.19989-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Lijun Ou <oulijun@huawei.com>, Wei Hu <xavier.huwei@huawei.com>, Doug Ledford <dledford@redhat.com>, Tao Tian <tiantao6@huawei.com>, Leon Romanovsky <leon@kernel.org>, Yangyang Li <liyangyang20@huawei.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 24, 2019 at 02:10:34PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently, the error return path when the call to function
> dev->dfx->query_cqc_info fails will leak object 'context'. Fix this
> by making the error return path via 'err' return return codes rather
> than -EMSGSIZE, set ret appropriately for all error return paths and
> for the memory leak now return via 'err' with -EINVAL rather than
> just returning without freeing context.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: e1c9a0dc2939 ("RDMA/hns: Dump detailed driver-specific CQ")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_restrack.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Applied to for-next with the note to remove the EINVAL return

Thanks,
Jason
