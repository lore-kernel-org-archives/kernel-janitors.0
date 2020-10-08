From: Ira Weiny <ira.weiny@intel.com>
Date: Thu, 08 Oct 2020 16:41:16 +0000
Subject: Re: [PATCH] IB/rdmavt: Fix sizeof mismatch
Message-Id: <20201008164116.GS2046448@iweiny-DESK2.sc.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201008095204.82683-1-colin.king@canonical.com>
In-Reply-To: <20201008095204.82683-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Dennis Dalessandro <dennis.dalessandro@intel.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 08, 2020 at 10:52:04AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> An incorrect sizeof is being used, struct rvt_ibport ** is not correct,
> it should be struct rvt_ibport *. Note that since ** is the same size as
> * this is not causing any issues.  Improve this fix by using
> sizeof(*rdi->ports) as this allows us to not even reference the type
> of the pointer.  Also remove line breaks as the entire statement can
> fit on one line.
> 
> Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
> Fixes: ff6acd69518e ("IB/rdmavt: Add device structure allocation")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
>  drivers/infiniband/sw/rdmavt/vt.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/infiniband/sw/rdmavt/vt.c b/drivers/infiniband/sw/rdmavt/vt.c
> index f904bb34477a..2d534c450f3c 100644
> --- a/drivers/infiniband/sw/rdmavt/vt.c
> +++ b/drivers/infiniband/sw/rdmavt/vt.c
> @@ -95,9 +95,7 @@ struct rvt_dev_info *rvt_alloc_device(size_t size, int nports)
>  	if (!rdi)
>  		return rdi;
>  
> -	rdi->ports = kcalloc(nports,
> -			     sizeof(struct rvt_ibport **),
> -			     GFP_KERNEL);
> +	rdi->ports = kcalloc(nports, sizeof(*rdi->ports), GFP_KERNEL);
>  	if (!rdi->ports)
>  		ib_dealloc_device(&rdi->ibdev);
>  
> -- 
> 2.27.0
> 
