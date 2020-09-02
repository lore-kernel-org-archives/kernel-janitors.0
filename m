From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Wed, 02 Sep 2020 23:59:09 +0000
Subject: Re: [PATCH][next] RDMA/ucma: fix memory leak of mc on an xa_alloc failure
Message-Id: <20200902235909.GK24045@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200902162805.200436-1-colin.king@canonical.com>
In-Reply-To: <20200902162805.200436-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Doug Ledford <dledford@redhat.com>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 02, 2020 at 05:28:05PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when an xa_alloc failure occurs the error exit path leaks
> the allocated object mc.  Fix this by adding an error return path
> that frees mc and rename error exit paths err3 to err4 and err2 to err3.
> 
> Fixes: 95fe51096b7a ("RDMA/ucma: Remove mc_list and rely on xarray")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/core/ucma.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Alex beat you too it, so I will use his patch, thanks

Jason
