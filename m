From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 27 Feb 2009 00:55:30 +0000
Subject: Re: [PATCH 3/3] drivers/gpu/drm: comment out dead code
Message-Id: <154e089b0902261655j17cf1fc3vaf254d0c2af74616@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090118152725.4179.40835.stgit@vmbox.hanneseder.net>
	 <20090118152856.4179.91855.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090118152856.4179.91855.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: dri-devel@lists.sourceforge.net, Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

[Added To]

On Sun, Jan 18, 2009 at 4:28 PM, Hannes Eder <hannes@hanneseder.net> wrote:
> The functions:
>
> =A0drm_crtc_from_fb
> =A0drm_mode_validate_clocks
>
> are not used, so comment them out.
>
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
> =A0drivers/gpu/drm/drm_crtc.c =A0| =A0 =A02 ++
> =A0drivers/gpu/drm/drm_modes.c | =A0 =A02 ++
> =A02 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index d378306..c44bbde 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -254,6 +254,7 @@ void *drm_mode_object_find(struct drm_device *dev, ui=
nt32_t id, uint32_t type)
> =A0}
> =A0EXPORT_SYMBOL(drm_mode_object_find);
>
> +#ifdef UNUSED
> =A0/**
> =A0* drm_crtc_from_fb - find the CRTC structure associated with an fb
> =A0* @dev: DRM device
> @@ -278,6 +279,7 @@ static struct drm_crtc *drm_crtc_from_fb(struct drm_d=
evice *dev,
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0return NULL;
> =A0}
> +#endif /* UNUSED */
>
> =A0/**
> =A0* drm_framebuffer_init - initialize a framebuffer
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index c0cfe39..8ebcf51 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -341,6 +341,7 @@ void drm_mode_validate_size(struct drm_device *dev,
> =A0}
> =A0EXPORT_SYMBOL(drm_mode_validate_size);
>
> +#ifdef UNUSED
> =A0/**
> =A0* drm_mode_validate_clocks - validate modes against clock limits
> =A0* @dev: DRM device
> @@ -376,6 +377,7 @@ static void drm_mode_validate_clocks(struct drm_devic=
e *dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mode->status =3D MODE_CLOC=
K_RANGE;
> =A0 =A0 =A0 =A0}
> =A0}
> +#endif /* UNUSED */
>
> =A0/**
> =A0* drm_mode_prune_invalid - remove invalid modes from mode list
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
