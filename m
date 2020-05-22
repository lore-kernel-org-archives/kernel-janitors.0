From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Fri, 22 May 2020 16:41:17 +0000
Subject: Re: [PATCH] block/rnbd: Fix an IS_ERR() vs NULL check in find_or_create_sess()
Message-Id: <20200522164117.GJ17583@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200519120347.GD42765@mwanda>
 <CAMGffEnuk2WfWmwjKy_Sqcuf_xKwzrPpE_o8j3nHM30ADr8HVw@mail.gmail.com>
 <CAMGffEmC215iOmtT_iZizey=jnbgWneE5f5zapYvdJi5WYDM1w@mail.gmail.com>
 <20200522144831.GH17583@ziepe.ca>
 <20200522154403.GN30374@kadam>
In-Reply-To: <20200522154403.GN30374@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jinpu Wang <jinpu.wang@cloud.ionos.com>, Danil Kipnis <danil.kipnis@cloud.ionos.com>, Jens Axboe <axboe@kernel.dk>, Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, May 22, 2020 at 06:44:03PM +0300, Dan Carpenter wrote:
> On Fri, May 22, 2020 at 11:48:31AM -0300, Jason Gunthorpe wrote:
> > On Fri, May 22, 2020 at 07:13:08AM +0200, Jinpu Wang wrote:
> > > On Tue, May 19, 2020 at 2:52 PM Jinpu Wang <jinpu.wang@cloud.ionos.com> wrote:
> > > >
> > > > On Tue, May 19, 2020 at 2:04 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > >
> > > > > The alloc_sess() function returns error pointers, it never returns NULL.
> > > > >
> > > > > Fixes: f7a7a5c228d4 ("block/rnbd: client: main functionality")
> > > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > Thanks Dan,
> > > > Reviewed-by: Jack Wang <jinpu.wang@cloud.ionos.com>
> > > 
> > > Hi Jason,
> > > 
> > > Could you also queue this fix for for-next?
> > 
> > Uhh.. Yes OK, but if it doesn't get cc'd to linux-rdma I won't see it..
> > 
> 
> I suspect that we should update MAINTAINERS so that
> ./scripts/get_maintainer.pl gives the right lists.  Proabably all
> drivers/block/rnbd/ patches are supposed to go through you?

I think Jens will take then once everything is merged, it is just for
the next few weeks

Jason
