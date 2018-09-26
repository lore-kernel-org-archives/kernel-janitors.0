From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Wed, 26 Sep 2018 22:34:34 +0000
Subject: Re: [PATCH] IB/mthca: remove redundant inner check of mdev->mthca_flags
Message-Id: <20180926223434.GA12887@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180926122608.29853-1-colin.king@canonical.com>
In-Reply-To: <20180926122608.29853-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Doug Ledford <dledford@redhat.com>, Bart Van Assche <bvanassche@acm.org>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 26, 2018 at 01:26:08PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The inner check for mdev->mthca_flags & MTHCA_FLAG_MSI_X is redundant
> as this is already true because of the previous identical check in
> an outer if statement.  Remove it
> 
> Detected by cppcheck:
> (warning) Identical inner 'if' condition is always true.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/mthca/mthca_main.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to for-next, thanks

Jason
