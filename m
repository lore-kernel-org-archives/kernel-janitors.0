From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Oct 2019 07:35:06 +0000
Subject: Re: [PATCH] uverbs: prevent potential underflow
Message-Id: <20191009073506.GI25098@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191005052337.GA20129@mwanda>
 <20191008194425.GA28067@ziepe.ca>
In-Reply-To: <20191008194425.GA28067@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Doug Ledford <dledford@redhat.com>, Potnuri Bharat Teja <bharat@chelsio.com>, Matan Barak <matanb@mellanox.com>, Leon Romanovsky <leon@kernel.org>, Shamir Rabinovitch <shamir.rabinovitch@oracle.com>, Matthew Wilcox <willy@infradead.org>, Michael Guralnik <michaelgur@mellanox.com>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Oct 08, 2019 at 04:44:25PM -0300, Jason Gunthorpe wrote:
> On Sat, Oct 05, 2019 at 08:23:37AM +0300, Dan Carpenter wrote:
> > The issue is in drivers/infiniband/core/uverbs_std_types_cq.c in the
> > UVERBS_HANDLER(UVERBS_METHOD_CQ_CREATE) function.  We check that:
> > 
> > 	if (attr.comp_vector >= attrs->ufile->device->num_comp_vectors) {
> > 
> > But we don't check that "attr.comp_vector" whether negative.  It
> > could potentially lead to an array underflow.  My concern would be where
> > cq->vector is used in the create_cq() function from the cxgb4 driver.
> > 
> > Fixes: 9ee79fce3642 ("IB/core: Add completion queue (cq) object actions")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/infiniband/core/uverbs.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
>  
> > diff --git a/drivers/infiniband/core/uverbs.h b/drivers/infiniband/core/uverbs.h
> > index 1e5aeb39f774..63f7f7db5902 100644
> > --- a/drivers/infiniband/core/uverbs.h
> > +++ b/drivers/infiniband/core/uverbs.h
> > @@ -98,7 +98,7 @@ ib_uverbs_init_udata_buf_or_null(struct ib_udata *udata,
> >  
> >  struct ib_uverbs_device {
> >  	atomic_t				refcount;
> > -	int					num_comp_vectors;
> > +	u32					num_comp_vectors;
> >  	struct completion			comp;
> >  	struct device				dev;
> >  	/* First group for device attributes, NULL terminated array */
> 
> I would have expected you to change struct ib_cq_init_attr ? Or at
> least both..
> 
> This is actually a bug as the type of
> UVERBS_ATTR_CREATE_CQ_COMP_VECTOR for userspace is u32:
> 
>         UVERBS_ATTR_PTR_IN(UVERBS_ATTR_CREATE_CQ_COMP_VECTOR,
>                            UVERBS_ATTR_TYPE(u32),
>                            UA_MANDATORY),
> 
> But we are stuffing it into a int:
> 
>         ret = uverbs_copy_from(&attr.comp_vector, attrs,
>                                UVERBS_ATTR_CREATE_CQ_COMP_VECTOR);
> 
> So very large values will become negative and switching
> num_comp_vectors to u32 won't help??

Yeah.  You're right.  I should have changed both.  I'm not sure what I
was thinking.

My patch does fix the bug because of type promotion, but we should
change both to u32.

regards,
dan carpenter
