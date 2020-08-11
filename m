From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Aug 2020 07:57:02 +0000
Subject: Re: [PATCH] drm: amdgpu: Use the correct size when allocating memory
Message-Id: <20200811075702.GE5493@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200809203406.751971-1-christophe.jaillet@wanadoo.fr>
 <20200810154213.GM1793@kadam>
 <8c414dd7-4a80-6ff2-03de-5340fb0d9c61@wanadoo.fr>
In-Reply-To: <8c414dd7-4a80-6ff2-03de-5340fb0d9c61@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Ori.Messinger@amd.com, airlied@linux.ie, bernard@vivo.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org, colton.w.lewis@protonmail.com, amd-gfx@lists.freedesktop.org, daniel@ffwll.ch, alexander.deucher@amd.com, christian.koenig@amd.com, m.szyprowski@samsung.com

On Mon, Aug 10, 2020 at 08:41:14PM +0200, Marion & Christophe JAILLET wrote:
>=20
> Le 10/08/2020 =E0 17:42, Dan Carpenter a =E9crit=A0:
> > On Sun, Aug 09, 2020 at 10:34:06PM +0200, Christophe JAILLET wrote:
> > > When '*sgt' is allocated, we must allocated 'sizeof(**sgt)' bytes ins=
tead
> > > of 'sizeof(*sg)'. 'sg' (i.e. struct scatterlist) is smaller than
> > > 'sgt' (i.e struct sg_table), so this could lead to memory corruption.
> > The sizeof(*sg) is bigger than sizeof(**sgt) so this wastes memory but
> > it won't lead to corruption.
> >=20
> >      11  struct scatterlist {
> >      12          unsigned long   page_link;
> >      13          unsigned int    offset;
> >      14          unsigned int    length;
> >      15          dma_addr_t      dma_address;
> >      16  #ifdef CONFIG_NEED_SG_DMA_LENGTH
> >      17          unsigned int    dma_length;
> >      18  #endif
> >      19  };
> >=20
> >      42  struct sg_table {
> >      43          struct scatterlist *sgl;        /* the list */
> >      44          unsigned int nents;             /* number of mapped en=
tries */
> >      45          unsigned int orig_nents;        /* original size of li=
st */
> >      46  };
> >=20
> > regards,
> > dan carpenter
>=20
>=20
> My bad. I read 'struct scatterlist sgl' (without the *)
> Thanks for the follow-up, Dan.
>=20
> Doesn't smatch catch such mismatch?
> (I've not run smatch for a while, so it is maybe reported)

That's why I was investigating it, because Smatch didn't catch it.

Smatch would have warned if it led to memory corruption.  Smatch also
tries to detect struct mismatches as a separate check but for some
reason it missed it.  I'm not totally sure why yet.  I suspect that it's
a complicated internal reason where Sparse is the sizeof to a normal
number...  It's a known issue and hard to fix.

>=20
> Well, the proposal is still valid, even if it has less impact as initially
> thought.

Yep.

regards,
dan carpenter
