From: Dmitry Torokhov <dtor@insightbb.com>
Date: Mon, 18 Sep 2006 01:19:19 +0000
Subject: Re: [KJ] kmalloc to kzalloc patches for drivers/atm
Message-Id: <200609172119.20555.dtor@insightbb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10609171753i63697c8et3e6e1c5706b60d5f@mail.gmail.com>
In-Reply-To: <6b4e42d10609171753i63697c8et3e6e1c5706b60d5f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Om Narasimhan <om.turyx@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, linux-atm-general@lists.sourceforge.net

On Sunday 17 September 2006 20:53, Om Narasimhan wrote:
> --- a/drivers/atm/firestream.c
> +++ b/drivers/atm/firestream.c
> @@ -1784,7 +1784,7 @@ static int __devinit fs_init (struct fs_
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0write_fs (dev, RAM, (1 <<=
 (28 - FS155_VPI_BITS - FS155_VCI_BITS)) - 1);
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0dev->nchannels =3D FS155_=
NR_CHANNELS;
> =A0=A0=A0=A0=A0=A0=A0=A0}
> -=A0=A0=A0=A0=A0=A0=A0dev->atm_vccs =3D kmalloc (dev->nchannels * sizeof =
(struct atm_vcc *),
> +=A0=A0=A0=A0=A0=A0=A0dev->atm_vccs =3D kzalloc (dev->nchannels * sizeof =
(struct atm_vcc *),
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 GFP_KERNEL);
> =A0=A0=A0=A0=A0=A0=A0=A0fs_dprintk (FS_DEBUG_ALLOC, "Alloc atmvccs: %p(%Z=
d)\n",
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0 =A0dev->atm_vccs, de=
v->nchannels * sizeof (struct atm_vcc *));
>=20

kcalloc would be better here because you are allocating several objects
at once.

--=20
Dmitry

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
