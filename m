From: Walter Harms <wharms@bfs.de>
Date: Mon, 09 Mar 2020 08:24:04 +0000
Subject: AW: [PATCH] drm/amdgpu/display: Fix an error handling path in 'dm_update_crtc_state()'
Message-Id: <97d88948e2ab4ec19c5a0c6d064df08b@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200308092637.8194-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200308092637.8194-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "harry.wentland@amd.com" <harry.wentland@amd.com>, "sunpeng.li@amd.com" <sunpeng.li@amd.com>, "alexander.deucher@amd.com" <alexander.deucher@amd.com>, "christian.koenig@amd.com" <christian.koenig@amd.com>, "David1.Zhou@amd.com" <David1.Zhou@amd.com>, "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>, "Bhawanpreet.Lakha@amd.com" <Bhawanpreet.Lakha@amd.com>, "mario.kleiner.de@gmail.com" <mario.kleiner.de@gmail.com>, "David.Francis@amd.com" <David.Francis@amd.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


________________________________________
Von: kernel-janitors-owner@vger.kernel.org <kernel-janitors-owner@vger.kern=
el.org> im Auftrag von Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Gesendet: Sonntag, 8. M=E4rz 2020 10:26
An: harry.wentland@amd.com; sunpeng.li@amd.com; alexander.deucher@amd.com; =
christian.koenig@amd.com; David1.Zhou@amd.com; airlied@linux.ie; daniel@ffw=
ll.ch; nicholas.kazlauskas@amd.com; Bhawanpreet.Lakha@amd.com; mario.kleine=
r.de@gmail.com; David.Francis@amd.com
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-k=
ernel@vger.kernel.org; kernel-janitors@vger.kernel.org; Christophe JAILLET
Betreff: [PATCH] drm/amdgpu/display: Fix an error handling path in 'dm_upda=
te_crtc_state()'

'dc_stream_release()' may be called twice. Once here, and once below in the
error handling path if we branch to the 'fail' label.

Set 'new_stream' to NULL, once released to avoid the duplicated release
function call.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Maybe the 'goto fail' at line 7745 should be turned into a 'return ret'
instead. Could be clearer.

No Fixes tag provided because I've not been able to dig deep enough in the
git history.
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 97c1b01c0fc1..9d7773a77c4f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7704,8 +7704,10 @@ static int dm_update_crtc_state(struct amdgpu_displa=
y_manager *dm,

 skip_modeset:
        /* Release extra reference */
-       if (new_stream)
-                dc_stream_release(new_stream);
+       if (new_stream) {
+               dc_stream_release(new_stream);
+               new_stream =3D NULL;
+       }


dc_stream_release() is NULL-checked, so the if can be dropped.

re,
 wh

        /*
         * We want to do dc stream updates that do not require a
--
2.20.1
