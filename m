From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Mon, 04 May 2020 17:13:15 +0000
Subject: Re: [PATCH] i40iw: Fix error handling in i40iw_manage_arp_cache()
Message-Id: <20200504171315.GA10755@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200422092211.GA195357@mwanda>
In-Reply-To: <20200422092211.GA195357@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Faisal Latif <faisal.latif@intel.com>, Shiraz Saleem <shiraz.saleem@intel.com>, Doug Ledford <dledford@redhat.com>, Shannon Nelson <shannon.nelson@intel.com>, Anjali Singhai Jain <anjali.singhai@intel.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Apr 22, 2020 at 12:22:11PM +0300, Dan Carpenter wrote:
> The i40iw_arp_table() function can return -EOVERFLOW if
> i40iw_alloc_resource() fails so we can't just test for "= -1".
> 
> Fixes: 4e9042e647ff ("i40iw: add hw and utils files")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Shiraz Saleem <shiraz.saleem@intel.com>
> ---
>  drivers/infiniband/hw/i40iw/i40iw_hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-rc, thanks

Jason
