From: Jesper Nilsson <jesper.nilsson@axis.com>
Date: Wed, 08 Apr 2009 13:36:19 +0000
Subject: Re: [PATCH 08/56] cris: Remove void casts
Message-Id: <20090408133619.GJ8115@axis.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-3-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-4-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-5-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-7-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-8-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-9-git-send-email-jwjstone@fastmail.fm> <36ca99e90904080534g54a1d4f3ue782b8598d238090@mail.gmail.com>
In-Reply-To: <36ca99e90904080534g54a1d4f3ue782b8598d238090@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Bert Wesarg <bert.wesarg@googlemail.com>
Cc: Jack Stone <jwjstone@fastmail.fm>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jeff@garzik.org" <jeff@garzik.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, Apr 08, 2009 at 02:34:12PM +0200, Bert Wesarg wrote:
> On Wed, Apr 8, 2009 at 13:21, Jack Stone <jwjstone@fastmail.fm> wrote:
> > Remove uneeded void casts
> >
> > Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
> > ---
> > =A0arch/cris/arch-v32/drivers/cryptocop.c | =A0 =A08 ++++----
> > =A01 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/cris/arch-v32/drivers/cryptocop.c b/arch/cris/arch-v3=
2/drivers/cryptocop.c
> > index 67c61ea..5d20327 100644
> > --- a/arch/cris/arch-v32/drivers/cryptocop.c
> > +++ b/arch/cris/arch-v32/drivers/cryptocop.c
> > @@ -2455,7 +2455,7 @@ static int map_pages_to_iovec(struct iovec *iov, =
int iovlen, int *iovix, struct
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0DEBUG_API(printk("map_pa=
ge_to_iovec: *pageix=3D%d >=3D nopages=3D%d\n", *pageix, nopages));
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 iov[*iovix].iov_base =3D (unsigned char*)=
page_address(pages[*pageix]) + *pageoffset;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 iov[*iovix].iov_base =3D page_address(pag=
es[*pageix]) + *pageoffset;
> Pointer arithmetic or intended cast (to avoid warnings for void
> pointer arithmetic).

Good catch. I think I'll drop the patch for now.

/^JN - Jesper Nilsson
--=20
               Jesper Nilsson -- jesper.nilsson@axis.com
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
