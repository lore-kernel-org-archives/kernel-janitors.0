From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Wed, 02 Oct 2019 14:05:16 +0000
Subject: [PATCH V6] drm/drm_vblank: Change EINVAL by the correct errno
Message-Id: <20191002140516.adeyj3htylimmlmg@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="rl7p723dixcepzft"
List-Id: <kernel-janitors.vger.kernel.org>
To: Keith Packard <keithp@keithp.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org


--rl7p723dixcepzft
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

For historical reasons, the function drm_wait_vblank_ioctl always return
-EINVAL if something gets wrong. This scenario limits the flexibility
for the userspace to make detailed verification of any problem and take
some action. In particular, the validation of =E2=80=9Cif (!dev->irq_enable=
d)=E2=80=9D
in the drm_wait_vblank_ioctl is responsible for checking if the driver
support vblank or not. If the driver does not support VBlank, the
function drm_wait_vblank_ioctl returns EINVAL, which does not represent
the real issue; this patch changes this behavior by return EOPNOTSUPP.
Additionally, drm_crtc_get_sequence_ioctl and
drm_crtc_queue_sequence_ioctl, also returns EINVAL if vblank is not
supported; this patch also changes the return value to EOPNOTSUPP in
these functions. Lastly, these functions are invoked by libdrm, which is
used by many compositors; because of this, it is important to check if
this change breaks any compositor. In this sense, the following projects
were examined:

* Drm-hwcomposer
* Kwin
* Sway
* Wlroots
* Wayland
* Weston
* Mutter
* Xorg (67 different drivers)

For each repository the verification happened in three steps:

* Update the main branch
* Look for any occurrence of "drmCrtcQueueSequence",
  "drmCrtcGetSequence", and "drmWaitVBlank" with the command git grep -n
  "STRING".
* Look in the git history of the project with the command
git log -S<STRING>

None of the above projects validate the use of EINVAL when using
drmWaitVBlank(), which make safe, at least for these projects, to change
the return values. On the other hand, mesa and xserver project uses
drmCrtcQueueSequence() and drmCrtcGetSequence(); this change is harmless
for both projects.

Change since V5 (Pekka Paalanen):
 - Check if the change also affects Mutter

Change since V4 (Daniel):
 - Also return EOPNOTSUPP in drm_crtc_[get|queue]_sequence_ioctl

Change since V3:
 - Return EINVAL for _DRM_VBLANK_SIGNAL (Daniel)

Change since V2:
 Daniel Vetter and Chris Wilson
 - Replace ENOTTY by EOPNOTSUPP
 - Return EINVAL if the parameters are wrong

Cc: Keith Packard <keithp@keithp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/drm_vblank.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 9c6899758bc9..71cf2633ac58 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1610,7 +1610,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, voi=
d *data,
 	unsigned int flags, pipe, high_pipe;
=20
 	if (!dev->irq_enabled)
-		return -EINVAL;
+		return -EOPNOTSUPP;
=20
 	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
 		return -EINVAL;
@@ -1876,7 +1876,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *de=
v, void *data,
 		return -EOPNOTSUPP;
=20
 	if (!dev->irq_enabled)
-		return -EINVAL;
+		return -EOPNOTSUPP;
=20
 	crtc =3D drm_crtc_find(dev, file_priv, get_seq->crtc_id);
 	if (!crtc)
@@ -1934,7 +1934,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *=
dev, void *data,
 		return -EOPNOTSUPP;
=20
 	if (!dev->irq_enabled)
-		return -EINVAL;
+		return -EOPNOTSUPP;
=20
 	crtc =3D drm_crtc_find(dev, file_priv, queue_seq->crtc_id);
 	if (!crtc)
--=20
2.23.0

--rl7p723dixcepzft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl2UrpsACgkQWJzP/com
vP9Bgw/7B/I5MWK+6MLQD5y+0VUQythB5k6k9wovD2C56y3E0D5IOxknr7iX5xTb
nNCZCFN8Ks4Zd3lhBRxcHMbetf+CwhvaWSRBhpxfptOSCeJK18WKADoULmTfgii3
DUeQsN5Ohr79ftYn89vb8TrsoGnAYXFFaCtlfT6IE7iUYw8kAAgIKJ5ngexvwMlt
MNvluV1MJVaE6kEet73dUbcW25kCwksR+tuSk1GK5w5F1reX6n3m8FAkdMSdVyPU
DcRHEv3q3D7d3jCGmFfj16MiqxQFBhyN7rjk36kZxNysfLm/mzyfxTl7LiCkUDkI
jmfZvIww+HHuU3I9D/4yORqfcuGNVHwVdT0IgzYx+RdpOmYej7SlhW2Nur/oP0Du
vKbyKtoXFGQ2tBAAWVEyPeLeVYUgO3Yczn7qHbbnQflnDGCLhof3V64CtvXjzvCK
vMrrwTqC8lDF7l9Fm84AFX1whua8+pU7xS99NNyPzmXMLkT37kgDaAHUBzrCKoHM
mwilQUmgiDLw7n8HTmCYkomWIGK4G3sMii/df4vqQoOEeyYjG3CrzGuXYzNBYamy
bXqpI2jQUy/hYLg2l9/vgVAvBatIeWEcGsej/+NhssUB4vTMlA1YUqwobJUnnA6e
5PsyKjJus9M5WJDCfJSfn+DSYUpA2+t/MRWwiS0xZGCl4ebAc90=
=nh5K
-----END PGP SIGNATURE-----

--rl7p723dixcepzft--
