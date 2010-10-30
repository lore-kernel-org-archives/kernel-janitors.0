From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sat, 30 Oct 2010 14:50:42 +0000
Subject: Re: [PATCH] net: core: scm: fix information leak to userland
Message-Id: <20101030145042.GB25135@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288448796-6147-1-git-send-email-segooon@gmail.com>
 <1288449205.2680.968.camel@edumazet-laptop>
In-Reply-To: <1288449205.2680.968.camel@edumazet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, "Eric W. Biederman" <ebiederm@xmission.com>, Tejun Heo <tj@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Oct 30, 2010 at 16:33 +0200, Eric Dumazet wrote:
> Le samedi 30 octobre 2010 =E0 18:26 +0400, Vasiliy Kulikov a =E9crit :
> > Structure cmsghdr is copied to userland with padding bytes
> > unitialized on architectures where __kernel_size_t is unsigned long.
> > It leads to leaking of contents of kernel stack memory.
> >=20
> > Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> > ---
> >  Compile tested.
> >=20
> >  net/core/scm.c |    1 +
> >  1 files changed, 1 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/net/core/scm.c b/net/core/scm.c
> > index 413cab8..a4a9b70 100644
> > --- a/net/core/scm.c
> > +++ b/net/core/scm.c
> > @@ -233,6 +233,7 @@ int put_cmsg(struct msghdr * msg, int level, int ty=
pe, int len, void *data)
> >  		msg->msg_flags |=3D MSG_CTRUNC;
> >  		cmlen =3D msg->msg_controllen;
> >  	}
> > +	memset(&cmhdr, 0, sizeof(cmhdr));
> >  	cmhdr.cmsg_level =3D level;
> >  	cmhdr.cmsg_type =3D type;
> >  	cmhdr.cmsg_len =3D cmlen;
>=20
>=20
> ???
>=20
> struct cmsghdr {
>         __kernel_size_t cmsg_len;       /* data byte count, including hdr=
 */
>         int             cmsg_level;     /* originating protocol */
>         int             cmsg_type;      /* protocol-specific type */
> };
>=20
> Could you explain where are the padding bytes ?

Ah, sorry, nowhere :)  int is stored quite OK after long.  Please ignore th=
is patch.

Thanks,

--=20
Vasiliy
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
