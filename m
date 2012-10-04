From: Luca Tettamanti <kronos.it@gmail.com>
Date: Thu, 04 Oct 2012 12:34:08 +0000
Subject: Re: [drm:drm-next 139/301] ERROR: "backlight_force_update" [drivers/gpu/drm/radeon/radeon.ko] undefi
Message-Id: <CAKPcRGotYu_mD3bSCR3b_d0Y6MGymbzLMaOrwx8_W1OyNOB9Hg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121004045126.GB18309@localhost>
In-Reply-To: <20121004045126.GB18309@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Oct 4, 2012 at 6:51 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Luca,
>
> FYI, kernel build failed on
>
> tree:   git://people.freedesktop.org/~airlied/linux.git drm-next
> head:   268d28371cd326be4dfcd7eba5917bf4b9d30c8f
> commit: fda4b25c55a59ba12378e4b9e4553f6ea57d802d [139/301] drm/radeon: implement handler for ACPI event
> config: ia64-defconfig
>
> All error/warnings:
>
> ERROR: "atombios_set_panel_brightness" [drivers/gpu/drm/radeon/radeon.ko] undefined!
> ERROR: "backlight_force_update" [drivers/gpu/drm/radeon/radeon.ko] undefined!

I'm not sure how to deal with this. The cause for both is that
BACKLIGHT_CLASS_DEVICE is not enabled: backlight_force_update is
easily fixed, atombios_set_panel_brightness however is removed in
following patches.
Should I send a patch against drm-next for backlight_force_update (and
leave bisecting broken without BACKLIGHT_CLASS_DEVICE) or is it
possible to amend this commit before it's merged by Linus?

Luca
