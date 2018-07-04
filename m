From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Wed, 04 Jul 2018 18:07:38 +0000
Subject: Re: [PATCH] RDMA/bnxt_re: Fix a bunch of off by one bugs in qplib_fp.c
Message-Id: <20180704180737.GB14028@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704095802.wg4wjgdweyy6ofug@kili.mountain>
In-Reply-To: <20180704095802.wg4wjgdweyy6ofug@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jul 04, 2018 at 12:58:02PM +0300, Dan Carpenter wrote:
> The srq->swq[] is allocated in bnxt_qplib_create_srq().  It has
> srq->hwq.max_elements elements so these tests should be > instead of >> or we might go beyond the end of the array.
> 
> Fixes: 1ac5a4047975 ("RDMA/bnxt_re: Add bnxt_re RoCE driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Selvin Xavier <selvin.xavier@broadcom.com>

Applied to for-next

Thanks,
Jason
