From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 24 Oct 2019 19:51:35 +0000
Subject: Re: [PATCH][next] drm/v3d: fix double free of bin
Message-Id: <20191025065135.09175b37@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/xwrizZz4UyloQa1ZZxKFEFk"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191024104801.3122-1-colin.king@canonical.com>
 <20191024123853.GH11828@phenom.ffwll.local>
 <821f0799-1f37-c853-d2c6-dd95883e02d8@canonical.com>
 <CAKMK7uGbMx21+g2kQyGu5H-L7N-guKJhsZ6b1ROnz5+kDRt3LA@mail.gmail.com>
In-Reply-To: <CAKMK7uGbMx21+g2kQyGu5H-L7N-guKJhsZ6b1ROnz5+kDRt3LA@mail.gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Iago Toral Quiroga <itoral@igalia.com>, dri-devel <dri-devel@lists.freedesktop.org>, Colin Ian King <colin.king@canonical.com>, Sean Paul <sean@poorly.run>, Navid Emamdoost <navid.emamdoost@gmail.com>

--Sig_/xwrizZz4UyloQa1ZZxKFEFk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 24 Oct 2019 14:49:36 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
>
> Ok adding Stephen. There's a merge conflict between drm-misc-fixes and
> drm-next (I think) and the merge double-added the kfree(bin). See
> above for the relevant sha1. Dave is already on here as a heads-up,
> but also adding drm-misc maintainers.
>=20
> > >> ---
> > >>  drivers/gpu/drm/v3d/v3d_gem.c | 1 -
> > >>  1 file changed, 1 deletion(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d=
_gem.c
> > >> index 549dde83408b..37515e47b47e 100644
> > >> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> > >> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> > >> @@ -568,7 +568,6 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void=
 *data,
> > >>              ret =3D v3d_job_init(v3d, file_priv, &bin->base,
> > >>                                 v3d_job_free, args->in_sync_bcl);
> > >>              if (ret) {
> > >> -                    kfree(bin);
> > >>                      v3d_job_put(&render->base);
> > >>                      kfree(bin);
> > >>                      return ret;

I will add this as a merge fixup until drm-misc-fixes is merged into
the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/xwrizZz4UyloQa1ZZxKFEFk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2yAMcACgkQAVBC80lX
0Gy2ZggAiZaoH9RPu5iXGznPgZhzyg1plQKDAAPWiIwMq1c3Bivg6umaIroB14qg
LGpurXf9YO+Vj8S06ukixB/b1vAycWSWXfauEZPhe6lF1YGykeZUVDeKCcIoR/oU
we0+KgwxN1r854mdr4+OlzjC9VssQ8c3HiGztCldR0PnenNt/BP7m+4mQtmB2gdL
H+cQREBnDZFHYKVNiDoIybIlyg34/MXC0nt2JGsY/A/UsBIFoLKEePnMc6j7Jh3O
4mkIfZb2SYcUVz0a6Ds0XuqAOVb9IRKiTHMdE1v59cnSS+AcyNog821sMAgtwAYR
lLyleGdyeEodrJ5AFmvnpCvc4bGZ9w==
=RhRC
-----END PGP SIGNATURE-----

--Sig_/xwrizZz4UyloQa1ZZxKFEFk--
