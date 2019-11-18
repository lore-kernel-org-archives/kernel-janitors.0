From: Steve Wise <larrystevenwise@gmail.com>
Date: Mon, 18 Nov 2019 17:39:12 +0000
Subject: Re: [PATCH] RDMA/iw_cgxb4: Fix an error handling path in 'c4iw_connect()'
Message-Id: <CADmRdJcWrsSWSc9_73+V==zbyxoGUdRMVKzOi6bAwVY+5k+cEQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190923190746.10964-1-christophe.jaillet@wanadoo.fr> <20191115210020.GA29581@ziepe.ca>
In-Reply-To: <20191115210020.GA29581@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Potnuri Bharat Teja <bharat@chelsio.com>, Doug Ledford <dledford@redhat.com>, linux-rdma <linux-rdma@vger.kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Those horrible error labels in cxgb* are my bad.  :(   I now always
use descriptive labels.

Stevo

On Fri, Nov 15, 2019 at 3:01 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Mon, Sep 23, 2019 at 09:07:46PM +0200, Christophe JAILLET wrote:
> > We should jump to fail3 in order to undo the 'xa_insert_irq()' call.
> >
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> > Not sure which Fixes tag to use because of the many refactorings in this
> > area. So I've choosen to use none :).
> > The issue was already there in 4a740838bf44c. This commit has renamed
> > all labels because a new fail1 was introduced. I've not searched further.
> >
> > Naming of error labels should be improved. Having nowadays a fail5
> > between fail2 and fail3 (because fail5 was the last
> > error handling path added) is not that readable.
> > However, it goes beyong the purpose of this patch.
> >
> > Maybe, just using a fail2a, just as already done in 9f5a9632e412 (which
> > introduced fail5) would be enough.
> > ---
> >  drivers/infiniband/hw/cxgb4/cm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> The disaster of the error label aside, this does fix the bug, so
> applied to for-next
>
> Thanks,
> Jason
