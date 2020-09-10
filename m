From: Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
Date: Thu, 10 Sep 2020 16:31:38 +0000
Subject: Re: [PATCH] qedr: fix resource leak in qedr_create_qp
Message-Id: <CAEYrHj=pfGB7OuHt90t2aaawr31W9XZCHeHJurt3o0rK44jZ+A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f79159af-4408-dc2f-6efa-45c5b45cf2d9@web.de>
In-Reply-To: <f79159af-4408-dc2f-6efa-45c5b45cf2d9@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-rdma@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Ariel Elior <aelior@marvell.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Michal Kalderon <mkalderon@marvell.com>, Takafumi Kubota <takafumi@sslab.ics.keio.ac.jp>, Yuval Bason <yuval.bason@cavium.com>

Hi,

Thank you for your comment.
I will re-label the goto statements and post the patch as version 2.

Thanks,
Keita

2020年9月10日(木) 22:24 Markus Elfring <Markus.Elfring@web.de>:
>
> > Fix this by adding a new goto label that calls qedr_free_qp_resources.
>
> …
> > +++ b/drivers/infiniband/hw/qedr/verbs.c
> …
> > @@ -2165,11 +2187,13 @@ struct ib_qp *qedr_create_qp(struct ib_pd *ibpd,
> …
> >       return &qp->ibqp;
> >
> > +err2:
> > +     qedr_free_qp_resources(dev, qp, udata);
> >  err:
> >       kfree(qp);
>
> I propose to choose further alternatives for numbered labels.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=7fe10096c1508c7f033d34d0741809f8eecc1ed4#n485
>
> Regards,
> Markus
