From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jul 2018 10:48:31 +0000
Subject: Re: [PATCH] IB/core: type promotion bug in rdma_rw_init_one_mr()
Message-Id: <20180704104831.pf2addlgbl3dzyvm@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704093211.o62tr44m3ugxxhjh@kili.mountain>
In-Reply-To: <20180704093211.o62tr44m3ugxxhjh@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jul 04, 2018 at 12:41:53PM +0200, Walter Harms wrote:
> 
> Am 04.07.2018 11:32, schrieb Dan Carpenter:
> > "nents" is an unsigned int, so if ib_map_mr_sg() returns a negative
> > error code then it's type promoted to a high unsigned int which is
> > treated as success.
> > 
> > Fixes: a060b5629ab0 ("IB/core: generic RDMA READ/WRITE API")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/infiniband/core/rw.c b/drivers/infiniband/core/rw.c
> > index c8963e91f92a..3ee0adfb45e9 100644
> > --- a/drivers/infiniband/core/rw.c
> > +++ b/drivers/infiniband/core/rw.c
> > @@ -87,7 +87,7 @@ static int rdma_rw_init_one_mr(struct ib_qp *qp, u8
> > port_num,
> >  	}
> >  
> >  	ret = ib_map_mr_sg(reg->mr, sg, nents, &offset, PAGE_SIZE);
> > -	if (ret < nents) {
> > +	if (ret < 0 || ret < nents) {
> >  		ib_mr_pool_put(qp, &qp->rdma_mrs, reg->mr);
> >  		return -EINVAL;
> >  	}
> 
> I do not understand the error here.
>  
> ib_map_mr_sg() obviously knows about nents and returns an invalid value ?
> Or is that a special case here ?
> 

ib_map_mr_sg() can return -ENOMEM, -EINVAL, other error codes or a
positive number <= to nents.  If it returns -ENOMEM then that's type
promoted to a high positive value (more than nents for sure) and treated
as success.

regards,
dan carpenter

