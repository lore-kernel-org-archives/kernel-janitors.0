From: "Scheurer, Amber" <amber@ti.com>
Date: Wed, 10 Apr 2019 14:05:34 +0000
Subject: RE: [EXTERNAL] Re: [PATCH] media: omap_vout: potential buffer overflow in vidioc_dqbuf()
Message-Id: <18d5658c970a454b9a0e71fb24055c1f@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190409112924.GA13643@kadam>
 <eb4fe291-85b5-540b-c210-5e9fb051f2cc@xs4all.nl>
 <20190410111415.GB31633@kadam>
In-Reply-To: <20190410111415.GB31633@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Philipp Zabel <p.zabel@pengutronix.de>, "Parrot, Benoit" <bparrot@ti.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>

I think you might have the wrong Amber copied on this email.=20

Amber

-----Original Message-----
From: Dan Carpenter [mailto:dan.carpenter@oracle.com]=20
Sent: Wednesday, April 10, 2019 6:14 AM
To: Hans Verkuil
Cc: Mauro Carvalho Chehab; Scheurer, Amber; Niklas S=F6derlund; Philipp Zab=
el; Parrot, Benoit; linux-media@vger.kernel.org; kernel-janitors@vger.kerne=
l.org; Andrzej Hajda
Subject: [EXTERNAL] Re: [PATCH] media: omap_vout: potential buffer overflow=
 in vidioc_dqbuf()

On Wed, Apr 10, 2019 at 12:50:31PM +0200, Hans Verkuil wrote:
> On 4/9/19 1:29 PM, Dan Carpenter wrote:
> > diff --git a/drivers/media/platform/omap/omap_vout.c b/drivers/media/pl=
atform/omap/omap_vout.c
> > index 37f0d7146dfa..15e38990e85a 100644
> > --- a/drivers/media/platform/omap/omap_vout.c
> > +++ b/drivers/media/platform/omap/omap_vout.c
> > @@ -1527,8 +1527,6 @@ static int vidioc_dqbuf(struct file *file, void *=
fh, struct v4l2_buffer *b)
> >  	unsigned long size;
> >  	struct videobuf_buffer *vb;
> > =20
> > -	vb =3D q->bufs[b->index];
> > -
> >  	if (!vout->streaming)
> >  		return -EINVAL;
> > =20
> > @@ -1539,6 +1537,8 @@ static int vidioc_dqbuf(struct file *file, void *=
fh, struct v4l2_buffer *b)
> >  		/* Call videobuf_dqbuf for  blocking mode */
> >  		ret =3D videobuf_dqbuf(q, (struct v4l2_buffer *)b, 0);
>=20
> We need a:
>=20
> 	if (ret)
> 		return ret;
>=20
> here. Or alternatively, add 'if (!ret)' around the next five lines.
>=20
> b->index is only valid if the videobuf_dqbuf call returned 0.
>=20

Doh.  Thanks.

regards,
dan carpenter
