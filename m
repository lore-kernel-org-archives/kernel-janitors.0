From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Aug 2020 21:15:44 +0000
Subject: Re: [PATCH] drm: amdgpu: Use the correct size when allocating memory
Message-Id: <CADnq5_NURN9_ONyXoLd5gMK6mTxotRZiP7N27UC1n_RNpQKimA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200809203406.751971-1-christophe.jaillet@wanadoo.fr>
 <20200810154213.GM1793@kadam>
 <8c414dd7-4a80-6ff2-03de-5340fb0d9c61@wanadoo.fr>
In-Reply-To: <8c414dd7-4a80-6ff2-03de-5340fb0d9c61@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "Messinger, Ori" <Ori.Messinger@amd.com>, Dave Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Christian Koenig <christian.koenig@amd.com>, Colton Lewis <colton.w.lewis@protonmail.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, "Deucher, Alexander" <alexander.deucher@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Applied and updated the commit message to reflect the sizes.

Thanks!

Alex

On Mon, Aug 10, 2020 at 3:07 PM Marion & Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
>
> Le 10/08/2020 à 17:42, Dan Carpenter a écrit :
> > On Sun, Aug 09, 2020 at 10:34:06PM +0200, Christophe JAILLET wrote:
> >> When '*sgt' is allocated, we must allocated 'sizeof(**sgt)' bytes instead
> >> of 'sizeof(*sg)'. 'sg' (i.e. struct scatterlist) is smaller than
> >> 'sgt' (i.e struct sg_table), so this could lead to memory corruption.
> > The sizeof(*sg) is bigger than sizeof(**sgt) so this wastes memory but
> > it won't lead to corruption.
> >
> >      11  struct scatterlist {
> >      12          unsigned long   page_link;
> >      13          unsigned int    offset;
> >      14          unsigned int    length;
> >      15          dma_addr_t      dma_address;
> >      16  #ifdef CONFIG_NEED_SG_DMA_LENGTH
> >      17          unsigned int    dma_length;
> >      18  #endif
> >      19  };
> >
> >      42  struct sg_table {
> >      43          struct scatterlist *sgl;        /* the list */
> >      44          unsigned int nents;             /* number of mapped entries */
> >      45          unsigned int orig_nents;        /* original size of list */
> >      46  };
> >
> > regards,
> > dan carpenter
>
>
> My bad. I read 'struct scatterlist sgl' (without the *)
> Thanks for the follow-up, Dan.
>
> Doesn't smatch catch such mismatch?
> (I've not run smatch for a while, so it is maybe reported)
>
> Well, the proposal is still valid, even if it has less impact as
> initially thought.
>
> Thx for the review.
>
> CJ
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
