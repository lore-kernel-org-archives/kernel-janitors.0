From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 22 Oct 2019 18:15:58 +0000
Subject: Re: [PATCH v2] uverbs: prevent potential underflow
Message-Id: <20191022181558.GA18115@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191008194425.GA28067@ziepe.ca>
 <20191011133419.GA22905@mwanda>
In-Reply-To: <20191011133419.GA22905@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Doug Ledford <dledford@redhat.com>, Matan Barak <matanb@mellanox.com>, Yishai Hadas <yishaih@mellanox.com>, Leon Romanovsky <leon@kernel.org>, Shamir Rabinovitch <shamir.rabinovitch@oracle.com>, Michael Guralnik <michaelgur@mellanox.com>, Matthew Wilcox <willy@infradead.org>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Oct 11, 2019 at 04:34:19PM +0300, Dan Carpenter wrote:
> The issue is in drivers/infiniband/core/uverbs_std_types_cq.c in the
> UVERBS_HANDLER(UVERBS_METHOD_CQ_CREATE) function.  We check that:
> 
>         if (attr.comp_vector >= attrs->ufile->device->num_comp_vectors) {
> 
> But we don't check that "attr.comp_vector" whether negative.  It
> could potentially lead to an array underflow.  My concern would be where
> cq->vector is used in the create_cq() function from the cxgb4 driver.
> 
> And really "attr.comp_vector" is appears as a u32 to user space so that's
> the right type to use.
> 
> Fixes: 9ee79fce3642 ("IB/core: Add completion queue (cq) object actions")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Change both types to u32
> 
>  drivers/infiniband/core/uverbs.h | 2 +-
>  include/rdma/ib_verbs.h          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to for-rc, thanks

Jason
