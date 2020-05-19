From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 May 2020 13:25:19 +0000
Subject: Re: [PATCH] RDMA/rtrs: Fix some signedness bugs in error handling
Message-Id: <20200519132519.GM2078@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200519120256.GC42765@mwanda>
 <CAMGffEkkUVV9b=iMhP4C=ndBRcePcTQMiF4h-Et1DFEKYPA6mg@mail.gmail.com>
In-Reply-To: <CAMGffEkkUVV9b=iMhP4C=ndBRcePcTQMiF4h-Et1DFEKYPA6mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Cc: Danil Kipnis <danil.kipnis@cloud.ionos.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, May 19, 2020 at 02:40:41PM +0200, Jinpu Wang wrote:
> On Tue, May 19, 2020 at 2:05 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > The problem is that "req->sg_cnt" is an unsigned int so if "nr" is
> > negative, it gets type promoted to a high positive value and the
> > condition is false.  This patch fixes it by handling negatives separately.
> >
> > Fixes: 6a98d71daea1 ("RDMA/rtrs: client: main functionality")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Thanks Dan, fix looks correct, just one comment inline.
> > ---
> >  drivers/infiniband/ulp/rtrs/rtrs-clt.c | 7 +++----
> >  drivers/infiniband/ulp/rtrs/rtrs-srv.c | 2 +-
> >  2 files changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> > index 468fdd0d8713..17f99f0962d0 100644
> > --- a/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> > +++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> > @@ -1047,11 +1047,10 @@ static int rtrs_map_sg_fr(struct rtrs_clt_io_req *req, size_t count)
> >
> >         /* Align the MR to a 4K page size to match the block virt boundary */
> >         nr = ib_map_mr_sg(req->mr, req->sglist, count, NULL, SZ_4K);
> > -       if (unlikely(nr < req->sg_cnt)) {
> > -               if (nr < 0)
> > -                       return nr;
> > +       if (nr < 0)
> > +               return -EINVAL;
> Why not just return nr here?

Sorry.  I thought I did but I made a typo.  Let me resend.

regards,
dan carpenter
