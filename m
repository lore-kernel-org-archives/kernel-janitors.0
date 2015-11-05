From: Chuck Lever <chuck.lever@oracle.com>
Date: Thu, 05 Nov 2015 14:08:57 +0000
Subject: Re: [patch 2/2] xprtrdma: checking for NULL instead of IS_ERR()
Message-Id: <D1BD3A48-A199-45F4-97E3-0FF18BAB4C5F@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151105083952.GB19405@mwanda>
In-Reply-To: <20151105083952.GB19405@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Trond Myklebust <trond.myklebust@primarydata.com>, Jeff Layton <jlayton@poochiereds.net>, Anna Schumaker <anna.schumaker@netapp.com>, Sagi Grimberg <sagig@mellanox.com>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, kernel-janitors@vger.kernel.org


> On Nov 5, 2015, at 3:39 AM, Dan Carpenter <dan.carpenter@oracle.com> wrot=
e:
>=20
> The rpcrdma_create_req() function returns error pointers or success.  It
> never returns NULL.
>=20
> Fixes: f531a5dbc451 ('xprtrdma: Pre-allocate backward rpc_rqst and send/r=
eceive buffers')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Chuck Lever <chuck.lever@oracle.com>


> diff --git a/net/sunrpc/xprtrdma/backchannel.c b/net/sunrpc/xprtrdma/back=
channel.c
> index 2dcb44f..97554ca 100644
> --- a/net/sunrpc/xprtrdma/backchannel.c
> +++ b/net/sunrpc/xprtrdma/backchannel.c
> @@ -42,8 +42,8 @@ static int rpcrdma_bc_setup_rqst(struct rpcrdma_xprt *r=
_xprt,
> 	size_t size;
>=20
> 	req =3D rpcrdma_create_req(r_xprt);
> -	if (!req)
> -		return -ENOMEM;
> +	if (IS_ERR(req))
> +		return PTR_ERR(req);
> 	req->rl_backchannel =3D true;
>=20
> 	size =3D RPCRDMA_INLINE_WRITE_THRESHOLD(rqst);

=E2=80=94
Chuck Lever



--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
