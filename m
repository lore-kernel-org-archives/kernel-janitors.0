From: Rob Herring <robh+dt@kernel.org>
Date: Sun, 20 Oct 2019 18:56:38 +0000
Subject: Re: [PATCH] dtc: fix spelling mistake "mmory" -> "memory"
Message-Id: <CAL_JsqKETEt3SstdoRBV0s63fKeE7pPnOf405147r22ZC6XcgQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190911093123.11312-1-colin.king@canonical.com> <4aa3bcde-1ad1-98ec-8deb-4a8ab1bbb41c@gmail.com>
In-Reply-To: <4aa3bcde-1ad1-98ec-8deb-4a8ab1bbb41c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Rowand <frowand.list@gmail.com>
Cc: Colin King <colin.king@canonical.com>, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Oct 17, 2019 at 2:08 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> Hi Rob,
>
>
> On 09/11/2019 04:31, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > There is a spelling mistake in an error message. Fix it.
> >
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  scripts/dtc/fdtput.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/dtc/fdtput.c b/scripts/dtc/fdtput.c
> > index a363c3cabc59..3755e5f68a5a 100644
> > --- a/scripts/dtc/fdtput.c
> > +++ b/scripts/dtc/fdtput.c
> > @@ -84,7 +84,7 @@ static int encode_value(struct display_info *disp, char **arg, int arg_count,
> >                       value_size = (upto + len) + 500;
> >                       value = realloc(value, value_size);
> >                       if (!value) {
> > -                             fprintf(stderr, "Out of mmory: cannot alloc "
> > +                             fprintf(stderr, "Out of memory: cannot alloc "
> >                                       "%d bytes\n", value_size);
> >                               return -1;
> >                       }
> >
>
> This is a very old version of the upstream file.  update-dtc-source.sh does
> not pull new versions of this file.
>
> We don't actually build fdtput, is there any reason to not just remove
> scripts/dtc/fdtput.c?

Yes, we should just remove it.

Rob
