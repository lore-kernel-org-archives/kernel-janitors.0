From: Jason Gunthorpe <jgg@nvidia.com>
Date: Tue, 06 Oct 2020 19:57:08 +0000
Subject: Re: [PATCH][next] RDMA/bnxt_re: fix sizeof mismatch for allocation of pbl_tbl.
Message-Id: <20201006195708.GA165314@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201006114700.537916-1-colin.king@canonical.com>
In-Reply-To: <20201006114700.537916-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Selvin Xavier <selvin.xavier@broadcom.com>, Devesh Sharma <devesh.sharma@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Naresh Kumar PBS <nareshkumar.pbs@broadcom.com>, Doug Ledford <dledford@redhat.com>, Eddie Wai <eddie.wai@broadcom.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 06, 2020 at 12:47:00PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> An incorrect sizeof is being used, u64 * is not correct, it should be
> just u64 for a table of umem_pgs number of u64 items in the pbl_tbl.
> Use the idiom sizeof(*pbl_tbl) to get the object type without the need
> to explicitly use u64.
> 
> Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
> Fixes: 1ac5a4047975 ("RDMA/bnxt_re: Add bnxt_re RoCE driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/bnxt_re/ib_verbs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next, thanks

Jason
