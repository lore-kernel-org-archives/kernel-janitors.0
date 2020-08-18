From: Jason Gunthorpe <jgg@nvidia.com>
Date: Tue, 18 Aug 2020 16:33:18 +0000
Subject: Re: [PATCH] RDMA/hns: fix spelling mistake "epmty" -> "empty"
Message-Id: <20200818163318.GA1990081@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200805141111.22804-1-colin.king@canonical.com>
In-Reply-To: <20200805141111.22804-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Lijun Ou <oulijun@huawei.com>, Wei Hu <huwei87@hisilicon.com>, Weihang Li <liweihang@huawei.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Aug 05, 2020 at 03:11:11PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_dbg message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_hw_v1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-rc, thanks

Jason
