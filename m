From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 14 Apr 2020 18:51:32 +0000
Subject: Re: [PATCH][next] i40iw: fix null pointer dereference on a null wqe pointer
Message-Id: <20200414185132.GA4556@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200401224921.405279-1-colin.king@canonical.com>
In-Reply-To: <20200401224921.405279-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Faisal Latif <faisal.latif@intel.com>, Shiraz Saleem <shiraz.saleem@intel.com>, Doug Ledford <dledford@redhat.com>, sindhu.devale@intel.com, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Apr 01, 2020 at 11:49:21PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the null check for wqe is incorrect and lets a null wqe
> be passed to set_64bit_val and this indexes into the null pointer
> causing a null pointer dereference.  Fix this by fixing the null
> pointer check to return an error if wqe is null.
> 
> Addresses-Coverity: ("dereference after a null check")
> Fixes: 4b34e23f4eaa ("i40iw: Report correct firmware version")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Shiraz Saleem <shiraz.saleem@intel.com>
> ---
>  drivers/infiniband/hw/i40iw/i40iw_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-rc, thanks

Jason
