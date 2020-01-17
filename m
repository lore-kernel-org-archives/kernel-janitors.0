From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Jan 2020 03:40:35 +0000
Subject: Re: [PATCH] ubi: Fix an error pointer dereference in error handling code
Message-Id: <20200117034035.GB19765@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200113132346.rmeamdmbxwvo7kgj@kili.mountain>
 <CAFLxGvyBO=_4-f+HQPZSaAL=aJouok3y=MxEKjup3Q=Cj0KKZg@mail.gmail.com>
In-Reply-To: <CAFLxGvyBO=_4-f+HQPZSaAL=aJouok3y=MxEKjup3Q=Cj0KKZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-stm32@st-md-mailman.stormreply.com, Vignesh Raghavendra <vigneshr@ti.com>

On Fri, Jan 17, 2020 at 12:50:14AM +0100, Richard Weinberger wrote:
> On Mon, Jan 13, 2020 at 2:24 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > If "seen_pebs = init_seen(ubi);" fails then "seen_pebs" is an error pointer
> > and we try to kfree() it which results in an Oops.
> >
> > This patch re-arranges the error handling so now it only frees things
> > which have been allocated successfully.
> >
> > Fixes: daef3dd1f0ae ("UBI: Fastmap: Add self check to detect absent PEBs")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/mtd/ubi/fastmap.c | 19 +++++++++++--------
> >  1 file changed, 11 insertions(+), 8 deletions(-)
> > ---
> >  drivers/mtd/ubi/fastmap.c | 21 ++++++++++++---------
> >  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> This patch seems badly formatted.
> Copy&paste error?
> 

Oh, yeah.  Sorrry.  I shouldn't affect anything though.  I can resend
if you want.

regards,
dan carpenter
