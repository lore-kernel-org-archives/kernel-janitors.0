From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Mon, 01 Jun 2020 17:27:53 +0000
Subject: Re: [PATCH] RDMA/hns: Uninitialized variable in modify_qp_init_to_rtr()
Message-Id: <20200601172753.GA2538@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200529083918.GA1298465@mwanda>
In-Reply-To: <20200529083918.GA1298465@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lijun Ou <oulijun@huawei.com>, Xi Wang <wangxi11@huawei.com>, "Wei Hu(Xavier)" <huwei87@hisilicon.com>, Weihang Li <liweihang@huawei.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, May 29, 2020 at 11:39:18AM +0300, Dan Carpenter wrote:
> The "dmac" variable is used before it is initialized.
> 
> Fixes: 494c3b312255 ("RDMA/hns: Refactor the QP context filling process related to WQE buffer configure")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Leon Romanovsky <leonro@mellanox.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_hw_v2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next, thanks

Jason
