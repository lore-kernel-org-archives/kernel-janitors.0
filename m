From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 15 Oct 2012 11:40:32 +0000
Subject: Re: [drm:drm-next 186/301] ERROR: "radeon_legacy_get_backlight_level" [drivers/gpu/drm/radeon/radeon
Message-Id: <20121015114032.GA15555@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121004094041.GB3444@localhost>
In-Reply-To: <20121004094041.GB3444@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

ping

On Thu, Oct 04, 2012 at 05:40:41PM +0800, Fengguang Wu wrote:
> Hi Alex,
> 
> FYI, kernel build failed on
> 
> tree:   git://people.freedesktop.org/~airlied/linux.git drm-next
> head:   268d28371cd326be4dfcd7eba5917bf4b9d30c8f
> commit: 6d92f81dcf2d40b8ebb947bba5435642b830f649 [186/301] drm/radeon: add get_backlight_level callback
> config: ia64-defconfig
> 
> All error/warnings:
> 
> ERROR: "radeon_legacy_get_backlight_level" [drivers/gpu/drm/radeon/radeon.ko] undefined!
> ERROR: "atombios_set_backlight_level" [drivers/gpu/drm/radeon/radeon.ko] undefined!
> ERROR: "atombios_get_backlight_level" [drivers/gpu/drm/radeon/radeon.ko] undefined!
> ERROR: "radeon_legacy_set_backlight_level" [drivers/gpu/drm/radeon/radeon.ko] undefined!
> ERROR: "backlight_force_update" [drivers/gpu/drm/radeon/radeon.ko] undefined!
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Center
> Fengguang Wu, Yuanhan Liu                              Intel Corporation
