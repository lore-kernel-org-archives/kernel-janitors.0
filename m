From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Date: Mon, 15 Oct 2012 12:55:47 +0000
Subject: RE: [drm:drm-next 186/301] ERROR: "radeon_legacy_get_backlight_level" [drivers/gpu/drm/radeon/radeon
Message-Id: <A3397C8B8B789E45844E7EC5DEAD89D02DA9749F@sausexdag04.amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121004094041.GB3444@localhost>
In-Reply-To: <20121004094041.GB3444@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

> -----Original Message-----
> From: Fengguang Wu [mailto:fengguang.wu@intel.com]
> Sent: Monday, October 15, 2012 7:41 AM
> To: Deucher, Alexander
> Cc: kernel-janitors@vger.kernel.org; Peter H=FCwe
> Subject: Re: [drm:drm-next 186/301] ERROR:
> "radeon_legacy_get_backlight_level" [drivers/gpu/drm/radeon/radeon.ko]
> undefined!
>=20
> ping

The fix is in my patch queue, but I was out of town last week.  I'll send t=
he pull request to Dave this week.

Alex


>=20
> On Thu, Oct 04, 2012 at 05:40:41PM +0800, Fengguang Wu wrote:
> > Hi Alex,
> >
> > FYI, kernel build failed on
> >
> > tree:   git://people.freedesktop.org/~airlied/linux.git drm-next
> > head:   268d28371cd326be4dfcd7eba5917bf4b9d30c8f
> > commit: 6d92f81dcf2d40b8ebb947bba5435642b830f649 [186/301]
> drm/radeon: add get_backlight_level callback
> > config: ia64-defconfig
> >
> > All error/warnings:
> >
> > ERROR: "radeon_legacy_get_backlight_level"
> [drivers/gpu/drm/radeon/radeon.ko] undefined!
> > ERROR: "atombios_set_backlight_level"
> [drivers/gpu/drm/radeon/radeon.ko] undefined!
> > ERROR: "atombios_get_backlight_level"
> [drivers/gpu/drm/radeon/radeon.ko] undefined!
> > ERROR: "radeon_legacy_set_backlight_level"
> [drivers/gpu/drm/radeon/radeon.ko] undefined!
> > ERROR: "backlight_force_update" [drivers/gpu/drm/radeon/radeon.ko]
> undefined!
> >
> > ---
> > 0-DAY kernel build testing backend         Open Source Technology Center
> > Fengguang Wu, Yuanhan Liu                              Intel Corporation


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
