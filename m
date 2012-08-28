From: "J. Bruce Fields" <bfields@fieldses.org>
Date: Tue, 28 Aug 2012 01:44:36 +0000
Subject: Re: [PATCH 1/6] fs/nfsd/nfs4idmap.c: adjust inconsistent IS_ERR and PTR_ERR
Message-Id: <20120828014436.GB20035@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345924629-16584-1-git-send-email-Julia.Lawall@lip6.fr>
 <1345924629-16584-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345924629-16584-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Aug 25, 2012 at 09:57:04PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> Change the call to PTR_ERR to access the value just tested by IS_ERR.

Applying for 3.7, thanks.--b.

>=20
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @@
> expression e,e1;
> @@
>=20
> (
> if (IS_ERR(e)) { ... PTR_ERR(e) ... }
> |
> if (IS_ERR(e=E1)) { ... PTR_ERR(e) ... }
> |
> *if (IS_ERR(e))
>  { ...
> *  PTR_ERR(e1)
>    ... }
> )
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> ---
>  fs/nfsd/nfs4idmap.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fs/nfsd/nfs4idmap.c b/fs/nfsd/nfs4idmap.c
> index fdc91a6..11df4ac 100644
> --- a/fs/nfsd/nfs4idmap.c
> +++ b/fs/nfsd/nfs4idmap.c
> @@ -478,7 +478,7 @@ nfsd_idmap_init(struct net *net)
>  		goto destroy_idtoname_cache;
>  	nn->nametoid_cache =3D cache_create_net(&nametoid_cache_template, net);
>  	if (IS_ERR(nn->nametoid_cache)) {
> -		rv =3D PTR_ERR(nn->idtoname_cache);
> +		rv =3D PTR_ERR(nn->nametoid_cache);
>  		goto unregister_idtoname_cache;
>  	}
>  	rv =3D cache_register_net(nn->nametoid_cache, net);
>=20
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
