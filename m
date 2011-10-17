From: Roland Dreier <roland@kernel.org>
Date: Mon, 17 Oct 2011 18:14:36 +0000
Subject: Re: [patch] RDMA/nes: silence compiler warning
Message-Id: <CAL1RGDVe7OKL35G9hdzYNWGZkC+g_HXXXrkRgw2ueTk__vMNPg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111017072857.GB7812@elgon.mountain>
In-Reply-To: <20111017072857.GB7812-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Faisal Latif <faisal.latif-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, Oct 17, 2011 at 12:28 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> =A0 =A0 =A0 =A0nes_debug(NES_DBG_CM, "QP%u, Destination IP =3D 0x%08X:0x%=
04X, local =3D "
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"0x%08X:0x%04X, rcv_nxt=3D0x%08X, snd_=
nxt=3D0x%08X, mpa + "
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "private data length=3D%zu.\n", nesqp->=
hwqp.qp_id,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "private data length=3D%d.\n", nesqp->h=
wqp.qp_id,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ntohl(cm_id->remote_addr.sin_addr.s_ad=
dr),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ntohs(cm_id->remote_addr.sin_port),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ntohl(cm_id->local_addr.sin_addr.s_add=
r),

By the way, could this debug message be using %pI4 instead of %08X to
print IP addresses?

 - R.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
