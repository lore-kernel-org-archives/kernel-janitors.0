From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 19 May 2020 23:46:35 +0000
Subject: Re: [PATCH v2] RDMA/rtrs: Fix some signedness bugs in error handling
Message-Id: <20200519234635.GC30609@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAMGffEkkUVV9b=iMhP4C=ndBRcePcTQMiF4h-Et1DFEKYPA6mg@mail.gmail.com>
 <20200519133223.GN2078@kadam>
In-Reply-To: <20200519133223.GN2078@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Danil Kipnis <danil.kipnis@cloud.ionos.com>, Jack Wang <jinpu.wang@cloud.ionos.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, May 19, 2020 at 04:32:23PM +0300, Dan Carpenter wrote:
> The problem is that "req->sg_cnt" is an unsigned int so if "nr" is
> negative, it gets type promoted to a high positive value and the
> condition is false.  This patch fixes it by handling negatives separately.
> 
> Fixes: 6a98d71daea1 ("RDMA/rtrs: client: main functionality")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Jack Wang <jinpu.wang@cloud.ionos.com>
> ---
> v2: propagate the correct error code instead of returning -EINVAL
> 
>  drivers/infiniband/ulp/rtrs/rtrs-clt.c | 7 +++----
>  drivers/infiniband/ulp/rtrs/rtrs-srv.c | 2 +-
>  2 files changed, 4 insertions(+), 5 deletions(-)

Applied to for-next, thanks

Jason
