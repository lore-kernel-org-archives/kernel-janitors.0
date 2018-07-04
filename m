From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Wed, 04 Jul 2018 18:07:21 +0000
Subject: Re: [PATCH] RDMA/bnxt_re: Fix a couple off by one bugs
Message-Id: <20180704180721.GA14028@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704095711.v3mjb3qkbgo6iw2r@kili.mountain>
In-Reply-To: <20180704095711.v3mjb3qkbgo6iw2r@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jul 04, 2018 at 12:57:11PM +0300, Dan Carpenter wrote:
> The sgid_tbl->tbl[] array is allocated in bnxt_qplib_alloc_sgid_tbl().
> It has sgid_tbl->max elements.  So the > should be >= to prevent
> accessing one element beyond the end of the array.
> 
> Fixes: 1ac5a4047975 ("RDMA/bnxt_re: Add bnxt_re RoCE driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Selvin Xavier <selvin.xavier@broadcom.com>

Applied to for-next

Thanks,
Jason
