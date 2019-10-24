From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Oct 2019 18:20:39 +0000
Subject: Re: [PATCH] RDMA/hns: prevent undefined behavior in hns_roce_set_user_sq_size()
Message-Id: <20191024182039.GB23523@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190608092514.GC28890@mwanda>
 <20191007121821.GI21515@kadam>
 <20191024163749.GX23952@ziepe.ca>
In-Reply-To: <20191024163749.GX23952@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Lijun Ou <oulijun@huawei.com>, "Wei Hu(Xavier)" <xavier.huwei@huawei.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Oct 24, 2019 at 01:37:49PM -0300, Jason Gunthorpe wrote:
> On Mon, Oct 07, 2019 at 03:18:22PM +0300, Dan Carpenter wrote:
> > This one still needs to be applied.
> > 
> > regards,
> > dan carpenter
> 
> Weird, it is marked changes requested in patchworks. An email must
> have been lost??
>

Maybe you replied to a different thread?

> I think I probably wanted to say that:
> 
> > >  	/* Sanity check SQ size before proceeding */
> > > -	if ((u32)(1 << ucmd->log_sq_bb_count) > hr_dev->caps.max_wqes ||
> > > +	if (ucmd->log_sq_bb_count > 31 ||
> > > +	    (u32)(1 << ucmd->log_sq_bb_count) > hr_dev->caps.max_wqes
> > > ||
> 
> Overall should probably be coded using check_shl_overflow(), as this
> later shift:
> 
> 	hr_qp->sq.wqe_cnt = 1 << ucmd->log_sq_bb_count;
> 
> Is storing it into an int and hardwring '31' because it magically
> matches that lower shift is pretty fragile.
> 
> More like this?
> 

Yeah.  I like your patch.  I'd feel silly claiming authorship though.
I'm willing to, because it's nice, but probably you should just give me
Reported-by credit instead.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter
