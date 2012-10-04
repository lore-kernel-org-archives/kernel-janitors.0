From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 04 Oct 2012 04:51:26 +0000
Subject: [drm:drm-next 139/301] ERROR: "backlight_force_update" [drivers/gpu/drm/radeon/radeon.ko] undefined!
Message-Id: <20121004045126.GB18309@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Luca,

FYI, kernel build failed on

tree:   git://people.freedesktop.org/~airlied/linux.git drm-next
head:   268d28371cd326be4dfcd7eba5917bf4b9d30c8f
commit: fda4b25c55a59ba12378e4b9e4553f6ea57d802d [139/301] drm/radeon: implement handler for ACPI event
config: ia64-defconfig

All error/warnings:

ERROR: "atombios_set_panel_brightness" [drivers/gpu/drm/radeon/radeon.ko] undefined!
ERROR: "backlight_force_update" [drivers/gpu/drm/radeon/radeon.ko] undefined!

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
