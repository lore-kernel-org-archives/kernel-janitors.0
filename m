From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 21 Jun 2015 00:49:34 +0000
Subject: Re: [PATCH 5/5] staging: lustre: osc: drop trivially useless initialization
Message-Id: <alpine.DEB.2.02.1506210249180.2231@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434827273-13929-1-git-send-email-Julia.Lawall@lip6.fr> <1434827273-13929-6-git-send-email-Julia.Lawall@lip6.fr> <CAGhQ9VwuaSdEFj_X2=_re=A2kHh8NqhmMVOLTc9X8LOifLAUWw@mail.gmail.com>
In-Reply-To: <CAGhQ9VwuaSdEFj_X2=_re=A2kHh8NqhmMVOLTc9X8LOifLAUWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joachim Eastwood <manabian@gmail.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Oleg Drokin <oleg.drokin@intel.com>, kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, 20 Jun 2015, Joachim Eastwood wrote:

> On 20 June 2015 at 21:07, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> > Remove initialization of a variable that is immediately reassigned.
> >
> > The semantic patch that makes this change is as follows:
> > (http://coccinelle.lip6.fr/)
> >
> > // <smpl>
> > @@
> > type T;
> > identifier x;
> > constant C;
> > expression e;
> > @@
> >
> > T x
> > - = C
> >  ;
> > x = e;
> > // </smpl>
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> >
> > ---
> >  drivers/staging/lustre/lustre/osc/osc_page.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff -u -p a/drivers/staging/lustre/lustre/osc/osc_page.c b/drivers/staging/lustre/lustre/osc/osc_page.c
> > --- a/drivers/staging/lustre/lustre/osc/osc_page.c
> > +++ b/drivers/staging/lustre/lustre/osc/osc_page.c
> > @@ -471,7 +471,7 @@ static int osc_page_flush(const struct l
> >                           struct cl_io *io)
> >  {
> >         struct osc_page *opg = cl2osc_page(slice);
> > -       int rc = 0;
> > +       int rc;
> >
> >         rc = osc_flush_async_page(env, io, opg);
> >         return rc;
> >
> 
> The whole rc variable is kinda useless.
> 
> Why not make it just:
> return osc_flush_async_page(env, io, opg);

Sure.  I'll fix that.

julia
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
