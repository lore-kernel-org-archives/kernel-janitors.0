From: Jason Gunthorpe <jgg@nvidia.com>
Date: Thu, 08 Oct 2020 18:18:02 +0000
Subject: Re: [PATCH] IB/rdmavt: Fix sizeof mismatch
Message-Id: <20201008181802.GB374464@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201008095204.82683-1-colin.king@canonical.com>
In-Reply-To: <20201008095204.82683-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Dennis Dalessandro <dennis.dalessandro@intel.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>, Doug Ledford <dledford@redhat.com>, Ira Weiny <ira.weiny@intel.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

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
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Acked-by: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
> ---
>  drivers/infiniband/sw/rdmavt/vt.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied to for-next, thanks

Jason
