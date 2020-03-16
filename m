From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 16 Mar 2020 09:56:49 +0000
Subject: Re: [Intel-gfx] [PATCH] MAINTAINERS: adjust to reservation.h renaming
Message-Id: <20200316095649.GK2363188@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200304120711.12117-1-lukas.bulwahn@gmail.com>
 <b0296e3a-31f8-635a-f26d-8b0bc490aae3@amd.com>
 <20200306103946.GT2363188@phenom.ffwll.local>
 <155f99baffe11836fc9d794ff297bdcee7831050.camel@perches.com>
 <20200316095007.GI2363188@phenom.ffwll.local>
In-Reply-To: <20200316095007.GI2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Joe Perches <joe@perches.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Sebastian Duda <sebastian.duda@fau.de>, Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org

On Mon, Mar 16, 2020 at 10:50:07AM +0100, Daniel Vetter wrote:
> On Fri, Mar 06, 2020 at 02:56:06AM -0800, Joe Perches wrote:
> > On Fri, 2020-03-06 at 11:39 +0100, Daniel Vetter wrote:
> > > On Wed, Mar 04, 2020 at 01:08:32PM +0100, Christian K=F6nig wrote:
> > > > Am 04.03.20 um 13:07 schrieb Lukas Bulwahn:
> > > > > Commit 52791eeec1d9 ("dma-buf: rename reservation_object to dma_r=
esv")
> > > > > renamed include/linux/reservation.h to include/linux/dma-resv.h, =
but
> > > > > missed the reference in the MAINTAINERS entry.
> > > > >=20
> > > > > Since then, ./scripts/get_maintainer.pl --self-test complains:
> > > > >=20
> > > > >    warning: no file matches F: include/linux/reservation.h
> > > > >=20
> > > > > Adjust the DMA BUFFER SHARING FRAMEWORK entry in MAINTAINERS.
> > > > >=20
> > > > > Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
> > > > > Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
> > > > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > > >=20
> > > > Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
> > >=20
> > > You'll push this too?
> > > -Daniel
> > >=20
> > > > > ---
> > > > > Christian, please pick this patch.
> > > > > applies cleanly on current master and next-20200303
> > > > >=20
> > > > >   MAINTAINERS | 2 +-
> > > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index 6158a143a13e..3d6cb2789c9e 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -5022,7 +5022,7 @@ L:	dri-devel@lists.freedesktop.org
> > > > >   L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscriber=
s)
> > > > >   F:	drivers/dma-buf/
> > > > >   F:	include/linux/dma-buf*
> > > > > -F:	include/linux/reservation.h
> > > > > +F:	include/linux/dma-resv.h
> > > > >   F:	include/linux/*fence.h
> > > > >   F:	Documentation/driver-api/dma-buf.rst
> > > > >   K:	dma_(buf|fence|resv)
> >=20
> > Slightly unrelated:
> >=20
> > The K: entry matches a lot of other things
> > and may have a lot of false positive matches
> > like any variable named dma_buffer
> >=20
> > This should also use (?:...) to avoid a perl
> > capture group.
> >=20
> > Perhaps:
> >=20
> > K:	'\bdma_(?:buf|fence|resv)\b'
>=20
> Hm either people aren't using get_maintainers.pl consistently, or it
> doesn't seem to be a real world problem. I'm not seeing any unrelated
> patches on dri-devel at least.
>=20
> But happy to merge such a patch if it shows up ofc, it's definitely the
> more correct thing :-)

Ofc as usual if you lean out the window you immediately get to eat your
hat, right after sending this I got a mail from syzbot about some random
stuff because of this :-)

I'm gonna do the patch now ...
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
