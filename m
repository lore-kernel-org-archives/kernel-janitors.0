From: Joe Perches <joe@perches.com>
Date: Fri, 06 Mar 2020 10:56:06 +0000
Subject: Re: [Intel-gfx] [PATCH] MAINTAINERS: adjust to reservation.h renaming
Message-Id: <155f99baffe11836fc9d794ff297bdcee7831050.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200304120711.12117-1-lukas.bulwahn@gmail.com>
 <b0296e3a-31f8-635a-f26d-8b0bc490aae3@amd.com>
 <20200306103946.GT2363188@phenom.ffwll.local>
In-Reply-To: <20200306103946.GT2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Daniel Vetter <daniel@ffwll.ch>, Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Sebastian Duda <sebastian.duda@fau.de>, linux-media@vger.kernel.org

On Fri, 2020-03-06 at 11:39 +0100, Daniel Vetter wrote:
> On Wed, Mar 04, 2020 at 01:08:32PM +0100, Christian K=F6nig wrote:
> > Am 04.03.20 um 13:07 schrieb Lukas Bulwahn:
> > > Commit 52791eeec1d9 ("dma-buf: rename reservation_object to dma_resv")
> > > renamed include/linux/reservation.h to include/linux/dma-resv.h, but
> > > missed the reference in the MAINTAINERS entry.
> > >=20
> > > Since then, ./scripts/get_maintainer.pl --self-test complains:
> > >=20
> > >    warning: no file matches F: include/linux/reservation.h
> > >=20
> > > Adjust the DMA BUFFER SHARING FRAMEWORK entry in MAINTAINERS.
> > >=20
> > > Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
> > > Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> >=20
> > Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
>=20
> You'll push this too?
> -Daniel
>=20
> > > ---
> > > Christian, please pick this patch.
> > > applies cleanly on current master and next-20200303
> > >=20
> > >   MAINTAINERS | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 6158a143a13e..3d6cb2789c9e 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -5022,7 +5022,7 @@ L:	dri-devel@lists.freedesktop.org
> > >   L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
> > >   F:	drivers/dma-buf/
> > >   F:	include/linux/dma-buf*
> > > -F:	include/linux/reservation.h
> > > +F:	include/linux/dma-resv.h
> > >   F:	include/linux/*fence.h
> > >   F:	Documentation/driver-api/dma-buf.rst
> > >   K:	dma_(buf|fence|resv)

Slightly unrelated:

The K: entry matches a lot of other things
and may have a lot of false positive matches
like any variable named dma_buffer

This should also use (?:...) to avoid a perl
capture group.

Perhaps:

K:	'\bdma_(?:buf|fence|resv)\b'
