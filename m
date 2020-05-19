From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 19 May 2020 23:44:29 +0000
Subject: Re: [PATCH -next] RDMA/rtrs: server: fix some error return code
Message-Id: <20200519234429.GA30609@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200519091912.134358-1-weiyongjun1@huawei.com>
In-Reply-To: <20200519091912.134358-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Danil Kipnis <danil.kipnis@cloud.ionos.com>, Jack Wang <jinpu.wang@cloud.ionos.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Tue, May 19, 2020 at 09:19:12AM +0000, Wei Yongjun wrote:
> Fix to return negative error code -ENOMEM from the some error handling
> cases instead of 0, as done elsewhere in this function.
> 
> Fixes: 9cb837480424 ("RDMA/rtrs: server: main functionality")
> Fixes: 91b11610af8d ("RDMA/rtrs: server: sysfs interface functions")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Reviewed-by: Danil Kipnis <danil.kipnis@cloud.ionos.com>
> ---
>  drivers/infiniband/ulp/rtrs/rtrs-srv.c | 8 +++++---
>  drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c | 1 +
>  2 file changed, 6 insertions(+), 3 deletions(-)

Applied to for-next, thanks

Jason
