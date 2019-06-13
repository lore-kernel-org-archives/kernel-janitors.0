From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Thu, 13 Jun 2019 02:10:54 +0000
Subject: [RESEND PATCH V3] drm/drm_vblank: Change EINVAL by the correct errno
Message-Id: <20190613021054.cdewdb3azy6zuoyw@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="jmacjpd643vk5d4c"
List-Id: <kernel-janitors.vger.kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org


--jmacjpd643vk5d4c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

For historical reason, the function drm_wait_vblank_ioctl always return
-EINVAL if something gets wrong. This scenario limits the flexibility
for the userspace make detailed verification of the problem and take
some action. In particular, the validation of =E2=80=9Cif (!dev->irq_enable=
d)=E2=80=9D
in the drm_wait_vblank_ioctl is responsible for checking if the driver
support vblank or not. If the driver does not support VBlank, the
function drm_wait_vblank_ioctl returns EINVAL which does not represent
the real issue; this patch changes this behavior by return EOPNOTSUPP.
Additionally, some operations are unsupported by this function, and
returns EINVAL; this patch also changes the return value to EOPNOTSUPP
in this case. Lastly, the function drm_wait_vblank_ioctl is invoked by
libdrm, which is used by many compositors; because of this, it is
important to check if this change breaks any compositor. In this sense,
the following projects were examined:

* Drm-hwcomposer
* Kwin
* Sway
* Wlroots
* Wayland-core
* Weston
* Xorg (67 different drivers)

For each repository the verification happened in three steps:

* Update the main branch
* Look for any occurrence "drmWaitVBlank" with the command:
  git grep -n "drmWaitVBlank"
* Look in the git history of the project with the command:
  git log -SdrmWaitVBlank

Finally, none of the above projects validate the use of EINVAL which
make safe, at least for these projects, to change the return values.

Change since V2:
 Daniel Vetter and Chris Wilson
 - Replace ENOTTY by EOPNOTSUPP
 - Return EINVAL if the parameters are wrong

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
Update:
  Now IGT has a way to validate if a driver has vblank support or not.
  See: https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/2d244aed6916=
5753f3adbbd6468db073dc1acf9A

 drivers/gpu/drm/drm_vblank.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 0d704bddb1a6..d76a783a7d4b 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1578,10 +1578,10 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, v=
oid *data,
 	unsigned int flags, pipe, high_pipe;
=20
 	if (!dev->irq_enabled)
-		return -EINVAL;
+		return -EOPNOTSUPP;
=20
 	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
-		return -EINVAL;
+		return -EOPNOTSUPP;
=20
 	if (vblwait->request.type &
 	    ~(_DRM_VBLANK_TYPES_MASK | _DRM_VBLANK_FLAGS_MASK |
--=20
2.21.0

--jmacjpd643vk5d4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0BsK0ACgkQWJzP/com
vP/4gA/7Biiupy7WhSPymKnZ+eYD/VkGhQ4xZ5o56UC7EC2582d/qLV3AGUW5R0C
syX2HCKmxfNdpOBOa/75VOVjl9w6NS+Le/gnuVL07H9uW7zUefwWCEXNR7l1o22Z
htFjEkqX8CYCzm9WMA+iUqgcpp0Em+/6FkTqLcTIBQqXsBFNOdnK1UNG8H1yI0jY
r/Zl2a1Me6B3JtS3vLmBSRLh7xez+fOiX2pXbT1t+WZUlC+TGcIqn14WVaAXgJuw
XKYzQxl+FJadL291ezbozPXNy29ljZ5PNOvxnhcG4SA9b55WGWM4Zh6GjeLcQqgY
LaogzlZpe/QfTyk23C0efRUoXEFLhvB92IDWoeGo+brZG3y6ynQkGY7Xra0q1tem
i0u9QGoFmfbAvlNXvJwZ7Q1ZOHqUGxKvfg0AZO3S0hwV0wb/lFAN2INT2uRMCapj
VBipChDqv/9q+BLvMfyIMmpeAguVgA21iVtHHS61GvtBkj3tZVUFqlKcicQVe9rL
nyemMYkrzoeozU+6gVShDJXDonB8Vf7tWB0tqKIsrtfqQsIQ0avY/IMl/Bo++gV3
9EstV2YuONvhuL6ad2V5tq+ErwrQC0jaya8GWeO0TFGfiEO8XqvWmlnSvaw3+nuw
UEtMVj3H7eM4zJpUPNm0NoQwUpy6meETdn9pqbmn0JzEeQzs1Xs=
=Oj71
-----END PGP SIGNATURE-----

--jmacjpd643vk5d4c--
