From: Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
Date: Fri, 11 Sep 2020 12:49:46 +0000
Subject: Re: [PATCH] qedr: fix resource leak in qedr_create_qp
Message-Id: <CAEYrHjmsd4Sp2R54y55pVL3CXr1KXedoBnTEczCBkpE9+SsFNg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f79159af-4408-dc2f-6efa-45c5b45cf2d9@web.de> <CAEYrHj=pfGB7OuHt90t2aaawr31W9XZCHeHJurt3o0rK44jZ+A@mail.gmail.com>
 <59440849-23b1-9c69-ecf6-78f8a0b82c7a@web.de>
In-Reply-To: <59440849-23b1-9c69-ecf6-78f8a0b82c7a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-rdma@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Ariel Elior <aelior@marvell.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Michal Kalderon <mkalderon@marvell.com>, Takafumi Kubota <takafumi@sslab.ics.keio.ac.jp>, Yuval Bason <yuval.bason@cavium.com>

Hi,
thank you for the comment.
I will fix the line break and re-post the patch

Thanks,
Keita

2020年9月11日(金) 4:48 Markus Elfring <Markus.Elfring@web.de>:
>
> > I will re-label the goto statements and post the patch as version 2.
>
> Thanks for such a positive feedback.
>
>
> Another suggestion:
>
> > > Fixes: 1212767e23bb ("qedr: Add wrapping generic structure for qpidr and
> > > adjust idr routines.")
>
> Please omit a line break for this tag.
>
> Regards,
> Markus
