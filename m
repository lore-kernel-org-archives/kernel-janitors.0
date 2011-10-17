From: "Latif, Faisal" <faisal.latif@intel.com>
Date: Mon, 17 Oct 2011 18:28:51 +0000
Subject: RE: [patch] RDMA/nes: silence compiler warning
Message-Id: <2EFBCAEF10980645BBCFB605689E08E904EC56F5E0@azsmsx506.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111017072857.GB7812@elgon.mountain>
 <CAL1RGDVe7OKL35G9hdzYNWGZkC+g_HXXXrkRgw2ueTk__vMNPg@mail.gmail.com>
In-Reply-To: <CAL1RGDVe7OKL35G9hdzYNWGZkC+g_HXXXrkRgw2ueTk__vMNPg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: "Hefty, Sean" <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>



> -----Original Message-----
> From: roland@purestorage.com [mailto:roland@purestorage.com] On Behalf
> Of Roland Dreier
> Sent: Monday, October 17, 2011 1:15 PM
> To: Dan Carpenter
> Cc: Latif, Faisal; Hefty, Sean; Hal Rosenstock; linux-
> rdma@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: Re: [patch] RDMA/nes: silence compiler warning
>=20
> On Mon, Oct 17, 2011 at 12:28 AM, Dan Carpenter
> <dan.carpenter@oracle.com> wrote:
> > =A0 =A0 =A0 =A0nes_debug(NES_DBG_CM, "QP%u, Destination IP =3D 0x%08X:0=
x%04X,
> local =3D "
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"0x%08X:0x%04X, rcv_nxt=3D0x%08X, sn=
d_nxt=3D0x%08X, mpa
> + "
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "private data length=3D%zu.\n", nesqp=
->hwqp.qp_id,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "private data length=3D%d.\n", nesqp-=
>hwqp.qp_id,
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ntohl(cm_id->remote_addr.sin_addr.s_=
addr),
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ntohs(cm_id->remote_addr.sin_port),
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ntohl(cm_id->local_addr.sin_addr.s_a=
ddr),
>=20
> By the way, could this debug message be using %pI4 instead of %08X to
> print IP addresses?
>=20
>  - R.

Yes, We should have used %pI4 for this also.

Thanks
Faisal

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
