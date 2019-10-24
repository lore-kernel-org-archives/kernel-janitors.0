From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 24 Oct 2019 22:09:56 +0000
Subject: Re: [PATCH] drm/v3d: Fix double free in v3d_submit_cl_ioctl()
Message-Id: <20191025090956.0bd40095@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/4bVL9=DKNMyJYmPOU7U_Uo9"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191024205306.GA14416@mwanda>
In-Reply-To: <20191024205306.GA14416@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

--Sig_/4bVL9=DKNMyJYmPOU7U_Uo9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Thu, 24 Oct 2019 23:53:06 +0300 Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
>
> Originally this error path used to leak "bin" but then we accidentally
> applied two separate commits to fix it and ended up with a double free.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Hi Stephen,
>=20
> I think this one is actually just a linux-next issue and the Fixes tag
> would point to commit f8593384f83f ("Merge remote-tracking branch
> 'drm/drm-next'").
>=20
> The original commits are 0d352a3a8a1f ("drm/v3d: don't leak bin job if
> v3d_job_init fails.") and commit 29cd13cfd762 ("drm/v3d: Fix memory leak
> in v3d_submit_cl_ioctl").
>=20
> I'm not totally sure how you guys address this normally but presumably
> you are experts at dealing with merge issues.  :)
>=20
>  drivers/gpu/drm/v3d/v3d_gem.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 549dde83408b..37515e47b47e 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -568,7 +568,6 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *dat=
a,
>  		ret =3D v3d_job_init(v3d, file_priv, &bin->base,
>  				   v3d_job_free, args->in_sync_bcl);
>  		if (ret) {
> -			kfree(bin);
>  			v3d_job_put(&render->base);
>  			kfree(bin);
>  			return ret;

I will just apply this as part of the drm tree merge until Dave merges
the drm-misc-fixes tree and fixes this up.

--=20
Cheers,
Stephen Rothwell

--Sig_/4bVL9=DKNMyJYmPOU7U_Uo9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2yITQACgkQAVBC80lX
0Gyd1Qf+PWEOF9qVO5Oz4D2TfN8Rw7FAJzMQ0OsgJocCWOaCH86/U9vQHCPIutvG
JOZLbYWP0v8pmE3XEGptNvUekQkGx3Gv6DZpxd/4dcf4Vb7PeWCpqt8d3sOpIRIu
oImlR7EbrSULvhR5OkP2KHycdv8Dn++J3xHB9hu/RDR/Krux7wqO8su/+/XeoApW
3AJ8ngwnlMYi6lkVXPx1AAXSY5PPiydcSdMR0bjbJ19jze42OADd8lNbaNaG5Hup
O39J5G3gHaKZOWVb8dH3FJoMkf1INplG+R+hx55fRoKQZEE7L0QNaUv8UqnkiIBn
2htAbc7tE3h3nBRgTDnpbJRDWYYUWA==
=JGmF
-----END PGP SIGNATURE-----

--Sig_/4bVL9=DKNMyJYmPOU7U_Uo9--
