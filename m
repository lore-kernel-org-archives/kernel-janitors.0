From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Fri, 07 Jun 2019 17:57:29 +0000
Subject: Re: [PATCH 2/2][next] RDMA/hns: fix inverted logic of readl read and shift
Message-Id: <20190607175729.GA25014@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190531092101.28772-1-colin.king@canonical.com>
 <20190531092101.28772-2-colin.king@canonical.com>
In-Reply-To: <20190531092101.28772-2-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Lijun Ou <oulijun@huawei.com>, Wei Hu <xavier.huwei@huawei.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, May 31, 2019 at 10:21:01AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> A previous change incorrectly changed the inverted logic and logically
> negated the readl rather than the shifted readl result. Fix this by
> adding in missing parentheses around the expression that needs to be
> logically negated.
> 
> Addresses-Coverity: ("Logically dead code")
> Fixes: 669cefb654cb ("RDMA/hns: Remove jiffies operation in disable interrupt context")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_hem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next, thanks

Jason
