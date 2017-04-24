From: Sakari Ailus <sakari.ailus@iki.fi>
Date: Mon, 24 Apr 2017 20:39:59 +0000
Subject: Re: [PATCH 2/2] [media] vb2: Fix error handling in '__vb2_buf_mem_alloc'
Message-Id: <20170424203959.GX7456@valkosipuli.retiisi.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170423214030.14854-1-christophe.jaillet@wanadoo.fr>
 <20170424142335.GR7456@valkosipuli.retiisi.org.uk>
 <030bab0d-0c5d-b65e-a7aa-54662bf42eb1@wanadoo.fr>
In-Reply-To: <030bab0d-0c5d-b65e-a7aa-54662bf42eb1@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: pawel@osciak.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

On Mon, Apr 24, 2017 at 10:25:18PM +0200, Christophe JAILLET wrote:
> Le 24/04/2017 =E0 16:23, Sakari Ailus a =E9crit :
> >Hi Christophe,
> >
> >On Sun, Apr 23, 2017 at 11:40:30PM +0200, Christophe JAILLET wrote:
> >>'call_ptr_memop' can return NULL, so we must test its return value with
> >>'IS_ERR_OR_NULL'. Otherwise, the test 'if (mem_priv)' is meaningless.
> >>
> >>Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> >>---
> >>Note that error checking after 'call_ptr_memop' calls is not consistent
> >>in this file. I guess that 'IS_ERR_OR_NULL' should be used everywhere
> >>and that the corresponding error handling code should be tweaked just as
> >>the code in this function.
> >>---
> >>  drivers/media/v4l2-core/videobuf2-core.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>diff --git a/drivers/media/v4l2-core/videobuf2-core.c b/drivers/media/v=
4l2-core/videobuf2-core.c
> >>index c0175ea7e7ad..d1d3f5dd57b9 100644
> >>--- a/drivers/media/v4l2-core/videobuf2-core.c
> >>+++ b/drivers/media/v4l2-core/videobuf2-core.c
> >>@@ -210,7 +210,7 @@ static int __vb2_buf_mem_alloc(struct vb2_buffer *v=
b)
> >>  		mem_priv =3D call_ptr_memop(vb, alloc,
> >>  				q->alloc_devs[plane] ? : q->dev,
> >>  				q->dma_attrs, size, dma_dir, q->gfp_flags);
> >>-		if (IS_ERR(mem_priv)) {
> >>+		if (IS_ERR_OR_NULL(mem_priv)) {
> >>  			if (mem_priv)
> >>  				ret =3D PTR_ERR(mem_priv);
> >>  			goto free;
> >If NULL will always equate -ENOMEM, shouldn't call_ptr_memop() be changed
> >instead to convert NULL to ERR_PTR(-ENOMEM)?
> >
> I agree with you, but in fact, I don't know if "NULL will always equate
> -ENOMEM"
>=20
> The return value of 'call_ptr_memop' is likely the result of a function
> called via a function pointer. I don't know if this function can return N=
ULL
> or not.
> I don't know the code enough to see if it would be safe and if this
> assertion is correct.
>=20
> So the easiest for me is to just propose a fix to accept NULL.

Quite right. There actually seem to be a few callers that need NULL, e.g.
vb2_plane_vaddr().

Looking at the definition of call_ptr_memop():

#define call_ptr_memop(vb, op, args...)                                 \
        ((vb)->vb2_queue->mem_ops->op ?                                 \
                (vb)->vb2_queue->mem_ops->op(args) : NULL)

strongly suggests that the callers should expect that NULL is a possible
return value. I'd be a little surprised if that was an actual case right
now: it would require one of the ops not to be defined for a memtype. That
said, surprising things do happen as demonstrated by your previous patch.

--=20
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
