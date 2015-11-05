From: Chuck Lever <chuck.lever@oracle.com>
Date: Thu, 05 Nov 2015 14:06:36 +0000
Subject: Re: [patch 1/2] xprtrdma: clean up some curly braces
Message-Id: <F97535F6-6BC8-430E-B346-9BAA41693DE8@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151105083708.GA19405@mwanda>
In-Reply-To: <20151105083708.GA19405@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Trond Myklebust <trond.myklebust@primarydata.com>, Jeff Layton <jlayton@poochiereds.net>, Anna Schumaker <anna.schumaker@netapp.com>, Sagi Grimberg <sagig@mellanox.com>, Steve Wise <swise@opengridcomputing.com>, Doug Ledford <dledford@redhat.com>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, kernel-janitors@vger.kernel.org


> On Nov 5, 2015, at 3:37 AM, Dan Carpenter <dan.carpenter@oracle.com> wrot=
e:
>=20
> It doesn't matter either way, but the curly braces were clearly intended
> here.  It causes a Smatch warning.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Chuck Lever <chuck.lever@oracle.com>


> diff --git a/net/sunrpc/xprtrdma/verbs.c b/net/sunrpc/xprtrdma/verbs.c
> index eadd1655..2cc1014 100644
> --- a/net/sunrpc/xprtrdma/verbs.c
> +++ b/net/sunrpc/xprtrdma/verbs.c
> @@ -852,10 +852,11 @@ retry:
>=20
> 		if (extras) {
> 			rc =3D rpcrdma_ep_post_extra_recv(r_xprt, extras);
> -			if (rc)
> +			if (rc) {
> 				pr_warn("%s: rpcrdma_ep_post_extra_recv: %i\n",
> 					__func__, rc);
> 				rc =3D 0;
> +			}
> 		}
> 	}
>=20

=E2=80=94
Chuck Lever



--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
