From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 27 Feb 2009 00:54:37 +0000
Subject: Re: [PATCH 1/3] drivers/gpu/drm: fix sparse warnings: make symbols
Message-Id: <154e089b0902261654y2c54f36cv1f281a5ef2224200@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090118152725.4179.40835.stgit@vmbox.hanneseder.net>
	 <20090118152840.4179.3536.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090118152840.4179.3536.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: dri-devel@lists.sourceforge.net, Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

[Added To]

On Sun, Jan 18, 2009 at 4:28 PM, Hannes Eder <hannes@hanneseder.net> wrote:
> Fix this sparse warnings:
>
> =A0drivers/gpu/drm/drm_crtc.c:270:17: warning: symbol 'drm_crtc_from_fb' =
was not declared. Should it be static?
> =A0drivers/gpu/drm/drm_crtc.c:810:5: warning: symbol 'drm_mode_group_init=
' was not declared. Should it be static?
> =A0drivers/gpu/drm/drm_crtc.c:913:6: warning: symbol 'drm_crtc_convert_to=
_umode' was not declared. Should it be static?
> =A0drivers/gpu/drm/drm_crtc.c:945:6: warning: symbol 'drm_crtc_convert_um=
ode' was not declared. Should it be static?
> =A0drivers/gpu/drm/drm_edid.c:252:25: warning: symbol 'drm_mode_std' was =
not declared. Should it be static?
> =A0drivers/gpu/drm/drm_modes.c:446:6: warning: symbol 'list_sort' was not=
 declared. Should it be static?
>
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
> =A0drivers/gpu/drm/drm_crtc.c =A0| =A0 15 ++++++++-------
> =A0drivers/gpu/drm/drm_edid.c =A0| =A0 =A04 ++--
> =A0drivers/gpu/drm/drm_modes.c | =A0 =A04 ++--
> =A03 files changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 5b2cbb7..d378306 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -267,8 +267,8 @@ EXPORT_SYMBOL(drm_mode_object_find);
> =A0* RETURNS:
> =A0* Pointer to the CRTC or NULL if it wasn't found.
> =A0*/
> -struct drm_crtc *drm_crtc_from_fb(struct drm_device *dev,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct =
drm_framebuffer *fb)
> +static struct drm_crtc *drm_crtc_from_fb(struct drm_device *dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0struct drm_framebuffer *fb)
> =A0{
> =A0 =A0 =A0 =A0struct drm_crtc *crtc;
>
> @@ -807,7 +807,8 @@ void drm_mode_config_init(struct drm_device *dev)
> =A0}
> =A0EXPORT_SYMBOL(drm_mode_config_init);
>
> -int drm_mode_group_init(struct drm_device *dev, struct drm_mode_group *g=
roup)
> +static int drm_mode_group_init(struct drm_device *dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct drm_m=
ode_group *group)
> =A0{
> =A0 =A0 =A0 =A0uint32_t total_objects =3D 0;
>
> @@ -910,8 +911,8 @@ EXPORT_SYMBOL(drm_mode_config_cleanup);
> =A0* Convert a drm_display_mode into a drm_mode_modeinfo structure to ret=
urn to
> =A0* the user.
> =A0*/
> -void drm_crtc_convert_to_umode(struct drm_mode_modeinfo *out,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct drm_d=
isplay_mode *in)
> +static void drm_crtc_convert_to_umode(struct drm_mode_modeinfo *out,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 struct drm_display_mode *in)
> =A0{
> =A0 =A0 =A0 =A0out->clock =3D in->clock;
> =A0 =A0 =A0 =A0out->hdisplay =3D in->hdisplay;
> @@ -942,8 +943,8 @@ void drm_crtc_convert_to_umode(struct drm_mode_modein=
fo *out,
> =A0* Convert a drm_mode_modeinfo into a drm_display_mode structure to ret=
urn to
> =A0* the caller.
> =A0*/
> -void drm_crtc_convert_umode(struct drm_display_mode *out,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct drm_mode_mod=
einfo *in)
> +static void drm_crtc_convert_umode(struct drm_display_mode *out,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0stru=
ct drm_mode_modeinfo *in)
> =A0{
> =A0 =A0 =A0 =A0out->clock =3D in->clock;
> =A0 =A0 =A0 =A0out->hdisplay =3D in->hdisplay;
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 0fbb0da..47737b2 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -249,8 +249,8 @@ static void edid_fixup_preferred(struct drm_connector=
 *connector,
> =A0* Punts for now, but should eventually use the FB layer's CVT based mo=
de
> =A0* generation code.
> =A0*/
> -struct drm_display_mode *drm_mode_std(struct drm_device *dev,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 struct std_timing *t)
> +static struct drm_display_mode *drm_mode_std(struct drm_device *dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0struct std_timing *t)
> =A0{
> =A0 =A0 =A0 =A0struct drm_display_mode *mode;
> =A0 =A0 =A0 =A0int hsize =3D t->hsize * 8 + 248, vsize;
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index c9b80fd..7c36f16 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -443,8 +443,8 @@ static int drm_mode_compare(struct list_head *lh_a, s=
truct list_head *lh_b)
>
> =A0/* FIXME: what we don't have a list sort function? */
> =A0/* list sort from Mark J Roberts (mjr@znex.org) */
> -void list_sort(struct list_head *head,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0int (*cmp)(struct list_head *a, struct list_=
head *b))
> +static void list_sort(struct list_head *head,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int (*cmp)(struct list_head *a,=
 struct list_head *b))
> =A0{
> =A0 =A0 =A0 =A0struct list_head *p, *q, *e, *list, *tail, *oldhead;
> =A0 =A0 =A0 =A0int insize, nmerges, psize, qsize, i;
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
