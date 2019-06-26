From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Wed, 26 Jun 2019 02:00:05 +0000
Subject: Re: [PATCH V4] drm/drm_vblank: Change EINVAL by the correct errno
Message-Id: <20190626020005.vb5gmqcvkyzgcjee@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="o7ebaymw2qc26tic"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190619020750.swzerehjbvx6sbk2@smtp.gmail.com>
 <20190619074856.GJ12905@phenom.ffwll.local>
 <20190619075059.GK12905@phenom.ffwll.local>
In-Reply-To: <20190619075059.GK12905@phenom.ffwll.local>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, intel-gfx@lists.freedesktop.org


--o7ebaymw2qc26tic
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/19, Daniel Vetter wrote:
> On Wed, Jun 19, 2019 at 09:48:56AM +0200, Daniel Vetter wrote:
> > On Tue, Jun 18, 2019 at 11:07:50PM -0300, Rodrigo Siqueira wrote:
> > > For historical reason, the function drm_wait_vblank_ioctl always retu=
rn
> > > -EINVAL if something gets wrong. This scenario limits the flexibility
> > > for the userspace make detailed verification of the problem and take
> > > some action. In particular, the validation of =E2=80=9Cif (!dev->irq_=
enabled)=E2=80=9D
> > > in the drm_wait_vblank_ioctl is responsible for checking if the driver
> > > support vblank or not. If the driver does not support VBlank, the
> > > function drm_wait_vblank_ioctl returns EINVAL which does not represent
> > > the real issue; this patch changes this behavior by return EOPNOTSUPP.
> > > Additionally, some operations are unsupported by this function, and
> > > returns EINVAL; this patch also changes the return value to EOPNOTSUPP
> > > in this case. Lastly, the function drm_wait_vblank_ioctl is invoked by
> > > libdrm, which is used by many compositors; because of this, it is
> > > important to check if this change breaks any compositor. In this sens=
e,
> > > the following projects were examined:
> > >=20
> > > * Drm-hwcomposer
> > > * Kwin
> > > * Sway
> > > * Wlroots
> > > * Wayland-core
> > > * Weston
> > > * Xorg (67 different drivers)
> > >=20
> > > For each repository the verification happened in three steps:
> > >=20
> > > * Update the main branch
> > > * Look for any occurrence "drmWaitVBlank" with the command:
> > >   git grep -n "drmWaitVBlank"
> > > * Look in the git history of the project with the command:
> > >   git log -SdrmWaitVBlank
> > >=20
> > > Finally, none of the above projects validate the use of EINVAL which
> > > make safe, at least for these projects, to change the return values.
> > >=20
> > > Change since V3:
> > >  - Return EINVAL for _DRM_VBLANK_SIGNAL (Daniel)
> > >=20
> > > Change since V2:
> > >  Daniel Vetter and Chris Wilson
> > >  - Replace ENOTTY by EOPNOTSUPP
> > >  - Return EINVAL if the parameters are wrong
> > >=20
> >=20
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >=20
> > Apologies for the confusion on the last time around. btw if someone tel=
ls
> > you "r-b (or a-b) with these changes", then just apply the r-b/a-b tag
> > next time around. Otherwise people will re-review the same thing over a=
nd
> > over again.
>=20
> btw when resending patches it's good practice to add anyone who commented
> on it (or who commented on the igt test for the same patch and other way
> round) onto the explicit Cc: list of the patch. That way it's easier for
> them to follow the patch evolution and do a quick r-b once they're happy.

Thanks for these valuable tips.
Do you think that is a good idea to resend this patch CC's everybody? Or
is it ok if I just apply it?
=20
> If you don't do that then much bigger chances your patch gets ignored.
> -Daniel
> >=20
> > > Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > ---
> > >  drivers/gpu/drm/drm_vblank.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblan=
k.c
> > > index 603ab105125d..bed233361614 100644
> > > --- a/drivers/gpu/drm/drm_vblank.c
> > > +++ b/drivers/gpu/drm/drm_vblank.c
> > > @@ -1582,7 +1582,7 @@ int drm_wait_vblank_ioctl(struct drm_device *de=
v, void *data,
> > >  	unsigned int flags, pipe, high_pipe;
> > > =20
> > >  	if (!dev->irq_enabled)
> > > -		return -EINVAL;
> > > +		return -EOPNOTSUPP;
> > > =20
> > >  	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
> > >  		return -EINVAL;
> > > --=20
> > > 2.21.0
> >=20
> > --=20
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--=20
Rodrigo Siqueira
https://siqueira.tech

--o7ebaymw2qc26tic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0S0aQACgkQWJzP/com
vP9OChAAhjuLcUgtK3blJvPIR0GbBQ2YKI5GBvyvsD2cAeC3QEh7a/X+5S9BcncG
AC/MTchAA76y0nXrgOKMDHD7E6y1wle9Ox+tJg4WsBpiya5f+Z6S8CllyLzfRFzS
DpIiC2ouqfYJzsecJXj9gveMbblf4YlCE22Cbn0gLajB61yOpuJ8HJK3KhFK6Zjp
KRD6sNXAuYkrWUPzsfNjOBt55r48DH2DfVtiMzANTo5qgs1yofYn1cwuYIsRqR+x
ULgg0wKUWxJXuXIWqkk4H7KD0QmZuEwtpMHMxSC85UldTnJ7fxEHiQXA661163x+
KAMlBLLUtK4LeGU5g2dbP3/ir3xLR5DuX07tZ1EXV8b5SGFzSKqrT1AEFYj2cpH1
TG62Zc0J2DqX+JuvuISAUkOd0OgKsdC1bDxEMiEy0kZpHLsnl8YOAkLYZBhf58Dy
O0RamNxYvfIEM9wcUm/wcxHtQVPAPYtqKRe2G1gOHSCHtDmRHF+Hpm8LAJcSRKdF
FTm6HY/Qbk/Nwx7gSzlVdEqB/qrc8Keqw2f8q/rHCL+zqalsIPM3P55yBWJxroGp
FM2dNRs6hN2XWRVNGpbZgaJ4im5IwzPCeIt+e+4EHu2AxPNa6jA55bW/JBOGLLOd
J9BhpzIwTExBxHySR9M97PUNMsKPYeTXG6D+La98edR5uRCDT1U=
=ksZ9
-----END PGP SIGNATURE-----

--o7ebaymw2qc26tic--
