From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Feb 2019 19:18:10 +0000
Subject: Re: [PATCH] RDMA/core: Fix a WARN() message
Message-Id: <20190222191810.GD1737@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190222062902.GB30993@kadam>
In-Reply-To: <20190222062902.GB30993@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Feb 22, 2019 at 11:56:05AM -0700, Jason Gunthorpe wrote:
> On Fri, Feb 22, 2019 at 09:29:02AM +0300, Dan Carpenter wrote:
> > The first parameter of WARN_ONCE() is a condition, then following
> > parameters are the message.  In this case, we left out the condition so
> > it will just print the ops->type string.
> > 
> > Fixes: 3856ec4b93c9 ("RDMA/core: Add RDMA_NLDEV_CMD_NEWLINK/DELLINK support")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Reviewed-by: Majd Dibbiny <majd@mellanox.com>
> > Reviewed-by: Steve Wise <swise@opengridcomputing.com>
> >  drivers/infiniband/core/nldev.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/infiniband/core/nldev.c b/drivers/infiniband/core/nldev.c
> > index 5e94dc87f04f..660a192a44a3 100644
> > +++ b/drivers/infiniband/core/nldev.c
> > @@ -1223,7 +1223,7 @@ void rdma_link_register(struct rdma_link_ops *ops)
> >  {
> >  	down_write(&link_ops_rwsem);
> >  	if (link_ops_get(ops->type)) {
> > -		WARN_ONCE("Duplicate rdma_link_ops! %s\n", ops->type);
> > +		WARN_ONCE(1, "Duplicate rdma_link_ops! %s\n", ops->type);
> >  		goto out;
> 
> I think I prefer
> 
> 	if (WARN_ON_ONCE(link_ops_get(ops->type)))
> 		goto out;
> 
> No need to belabor things
> 
> Applied to for-next with the change
> 

Thank you very much, sir!  You are a gentleman and a scholar.

regards,
dan carpenter
