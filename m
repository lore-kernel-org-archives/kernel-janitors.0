From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 04 Oct 2012 04:51:50 +0000
Subject: [drm:drm-next 148/301] ERROR: "radeon_legacy_set_backlight_level" [drivers/gpu/drm/radeon/radeon.ko]
Message-Id: <20121004045150.GC18309@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Alex,

FYI, kernel build failed on

tree:   git://people.freedesktop.org/~airlied/linux.git drm-next
head:   268d28371cd326be4dfcd7eba5917bf4b9d30c8f
commit: 37e9b6a62fb775276f8edb5bd2b9f13a3102b9dd [148/301] drm/radeon: rework the backlight control to be an asic callback
config: ia64-defconfig

All error/warnings:

ERROR: "atombios_set_backlight_level" [drivers/gpu/drm/radeon/radeon.ko] undefined!
ERROR: "radeon_legacy_set_backlight_level" [drivers/gpu/drm/radeon/radeon.ko] undefined!
ERROR: "backlight_force_update" [drivers/gpu/drm/radeon/radeon.ko] undefined!

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
