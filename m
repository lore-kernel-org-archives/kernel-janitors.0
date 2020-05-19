From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 19 May 2020 23:46:50 +0000
Subject: Re: [PATCH] RDMA/rtrs: Fix a couple off by one bugs in rtrs_srv_rdma_done()
Message-Id: <20200519234650.GD30609@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAHg0Huz39q9nWwTrtCY=SgU=T9oZJQdchx6c1LOPbSQiywzrqw@mail.gmail.com>
 <20200519154525.GA66801@mwanda>
In-Reply-To: <20200519154525.GA66801@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Danil Kipnis <danil.kipnis@cloud.ionos.com>, Jack Wang <jinpu.wang@cloud.ionos.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, May 19, 2020 at 06:45:25PM +0300, Dan Carpenter wrote:
> These > comparisons should be >= to prevent accessing one element
> beyond the end of the buffer.
> 
> Fixes: 9cb837480424 ("RDMA/rtrs: server: main functionality")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Danil Kipnis <danil.kipnis@cloud.ionos.com>
> ---
>  drivers/infiniband/ulp/rtrs/rtrs-srv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to for-next, thanks

Jason
