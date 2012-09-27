From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Sep 2012 11:59:03 +0000
Subject: ERROR: "__divdf3" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
Message-Id: <20120927115903.GA17017@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Martin,

FYI, kernel build failed on

6310a32252e4160ce5492ad9b98c9f2778fec43b drm/nouveau/therm: calculate the pwm divisor on nv50+
powerpc-allmodconfig

All error/warnings:

ERROR: "__divdf3" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
ERROR: ".__floatsidf" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
ERROR: "__fixdfsi" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
ERROR: ".__divdf3" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
ERROR: "__floatsidf" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
ERROR: ".__fixdfsi" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
