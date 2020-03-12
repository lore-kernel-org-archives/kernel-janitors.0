From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Mar 2020 13:38:42 +0000
Subject: Re: [PATCH] drm/amdgpu/display: Fix an error handling path in 'dm_update_crtc_state()'
Message-Id: <20200312133842.GI11561@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200308092637.8194-1-christophe.jaillet@wanadoo.fr>
 <97d88948e2ab4ec19c5a0c6d064df08b@bfs.de>
In-Reply-To: <97d88948e2ab4ec19c5a0c6d064df08b@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Walter Harms <wharms@bfs.de>
Cc: "David1.Zhou@amd.com" <David1.Zhou@amd.com>, "mario.kleiner.de@gmail.com" <mario.kleiner.de@gmail.com>, "sunpeng.li@amd.com" <sunpeng.li@amd.com>, "Bhawanpreet.Lakha@amd.com" <Bhawanpreet.Lakha@amd.com>, "David.Francis@amd.com" <David.Francis@amd.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>, "airlied@linux.ie" <airlied@linux.ie>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "alexander.deucher@amd.com" <alexander.deucher@amd.com>, "harry.wentland@amd.com" <harry.wentland@amd.com>, "christian.koenig@amd.com" <christian.koenig@amd.com>

On Mon, Mar 09, 2020 at 08:24:04AM +0000, Walter Harms wrote:
>=20
> ________________________________________
> Von: kernel-janitors-owner@vger.kernel.org <kernel-janitors-owner@vger.ke=
rnel.org> im Auftrag von Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Gesendet: Sonntag, 8. M=E4rz 2020 10:26
> An: harry.wentland@amd.com; sunpeng.li@amd.com; alexander.deucher@amd.com=
; christian.koenig@amd.com; David1.Zhou@amd.com; airlied@linux.ie; daniel@f=
fwll.ch; nicholas.kazlauskas@amd.com; Bhawanpreet.Lakha@amd.com; mario.klei=
ner.de@gmail.com; David.Francis@amd.com
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux=
-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org; Christophe JAILLET
> Betreff: [PATCH] drm/amdgpu/display: Fix an error handling path in 'dm_up=
date_crtc_state()'
>=20
> 'dc_stream_release()' may be called twice. Once here, and once below in t=
he
> error handling path if we branch to the 'fail' label.
>=20
> Set 'new_stream' to NULL, once released to avoid the duplicated release
> function call.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Maybe the 'goto fail' at line 7745 should be turned into a 'return ret'
> instead. Could be clearer.
>=20
> No Fixes tag provided because I've not been able to dig deep enough in the
> git history.
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 97c1b01c0fc1..9d7773a77c4f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7704,8 +7704,10 @@ static int dm_update_crtc_state(struct amdgpu_disp=
lay_manager *dm,
>=20
>  skip_modeset:
>         /* Release extra reference */
> -       if (new_stream)
> -                dc_stream_release(new_stream);
> +       if (new_stream) {
> +               dc_stream_release(new_stream);
> +               new_stream =3D NULL;
> +       }
>=20
>=20
> dc_stream_release() is NULL-checked, so the if can be dropped.
>=20
> re,
>  wh

Walter, it's really hard to separate your reply from the quoted email.
What's going on with that?  Could you configure your email client to
use "> " for the quoted bit?

regards,
dan carpenter
