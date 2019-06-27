From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Thu, 27 Jun 2019 02:24:46 +0000
Subject: [PATCH V5] drm/drm_vblank: Change EINVAL by the correct errno
Message-Id: <20190627022446.fkuomcgiuu3bj3kb@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ygl3ejqndwnzekz3"
List-Id: <kernel-janitors.vger.kernel.org>
To: Keith Packard <keithp@keithp.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org


--ygl3ejqndwnzekz3
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
* Wayland-core
* Weston
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
Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/drm_vblank.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 603ab105125d..bd4ac834d3ef 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1582,7 +1582,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, voi=
d *data,
 	unsigned int flags, pipe, high_pipe;
=20
 	if (!dev->irq_enabled)
-		return -EINVAL;
+		return -EOPNOTSUPP;
=20
 	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
 		return -EINVAL;
@@ -1823,7 +1823,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *de=
v, void *data,
 		return -EOPNOTSUPP;
=20
 	if (!dev->irq_enabled)
-		return -EINVAL;
+		return -EOPNOTSUPP;
=20
 	crtc =3D drm_crtc_find(dev, file_priv, get_seq->crtc_id);
 	if (!crtc)
@@ -1881,7 +1881,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *=
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
2.21.0

--ygl3ejqndwnzekz3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0UKO0ACgkQWJzP/com
vP9DYBAAl3K8kqqVa/P2GDZvxDrE3XCKPipZhDER9QiBIHjjIeEFvMavxBEVvm+T
4fmVKfta/9xYLDcoBvzk8ZxJhpsB8xSrbEZbRcBHKQ+VtF2JU6ArKbqU5TnNBHyZ
HY4eL0Ju6v9E0A8HmutOfIPZPgJT4DFihHhT2hqqjNldkB2CvfOnny6msf7FytGI
piD1wPcYwYNN03ZRcXEW5ocyWByA0mY1aTGCVS1ogYkdDtgz/t7+r9I+Yx6oCWOL
uwhgYCMskG2/PAHm/4xx+qPjwnrN/2TCAW07udDI3Mz0BpxTXlKH+iXC6K5Frt7g
IK/kN6PHk7JCzsz+1uQMOcH+hJJHfgrLSEyUZtpE02vCe1KYHiE7FpY2D5kHj4s1
4l5fButamxNI6mHkg1uBigkfF3R06OSuBJE+q3np0EDf7TE4LsLu91KENCdEa1SF
r3FzrFyW/IZRNWFgNs2ZxbYysUHwogDFkWjvRIxCKnUGGe5Gdg3g2pOsPfJ+yGal
8Bk0OsTgvVn0J9wwS+R8ldOu/Z6Qdd4wwaQpAESYQnogjAA3U5Hy0dMHV46WlycY
6+rWBgr6AdiHKuRgXa2Ga3XphXBZCGD/2AtQmm3M8Jl51GdgPErONbMalazsl5Pb
cTJ7rX4j+lYzlvL+saFge2VhXsi8IV6JICcrQ3eDzrjJnBzPdVY=
=t8eI
-----END PGP SIGNATURE-----

--ygl3ejqndwnzekz3--
