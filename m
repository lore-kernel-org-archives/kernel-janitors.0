From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 20 Sep 2013 17:54:38 +0000
Subject: build regressions 2013-09-20
Message-Id: <523c8bde.dmlMI9TmSpMOox6X%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/kernel/setup.c:602:2: error: implicit declaration of function 'erratum_a15_798181_init' [-Werror=implicit-function-declaration]
drivers/pinctrl/pinctrl-adi2.c:25:25: fatal error: asm/portmux.h: No such file or directory

[warnings]
arch/x86/kernel/cpu/perf_event_intel_ds.c:964:2: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'int' [-Wformat=]

[sparse]
net/nfc/digital_technology.c:272:20: sparse: cast to restricted __be16
net/nfc/digital_technology.c:272:20: sparse: cast to restricted __be16
net/nfc/digital_technology.c:272:20: sparse: cast to restricted __be16
net/nfc/digital_technology.c:272:20: sparse: cast to restricted __be16
net/nfc/digital_technology.c:640:5: sparse: symbol 'digital_tg_send_sensf_res' was not declared. Should it be static?
drivers/gpu/drm/radeon/radeon_drv.c:168:5: sparse: symbol 'radeon_runtime_pm' was not declared. Should it be static?
drivers/gpu/drm/radeon/radeon_atpx_handler.c:62:6: sparse: symbol 'radeon_is_px' was not declared. Should it be static?

[coccinelle]
drivers/pinctrl/pinctrl-adi2.c:326:16-19: ERROR: port is NULL but dereferenced.
drivers/pinctrl/pinctrl-adi2.c:371:16-19: ERROR: port is NULL but dereferenced.
drivers/pinctrl/pinctrl-adi2.c:250:1-18: ERROR: nested lock+irqsave that reuses flags from line 249.
drivers/pinctrl/pinctrl-adi2.c:352:1-18: ERROR: nested lock+irqsave that reuses flags from line 351.
drivers/pinctrl/pinctrl-adi2.c:331:1-18: ERROR: nested lock+irqsave that reuses flags from line 330.
drivers/pinctrl/pinctrl-adi2.c:378:1-18: ERROR: nested lock+irqsave that reuses flags from line 377.
drivers/pinctrl/pinctrl-adi2.c:273:1-18: ERROR: nested lock+irqsave that reuses flags from line 272.
drivers/pinctrl/pinctrl-adi2.c:296:1-18: ERROR: nested lock+irqsave that reuses flags from line 295.
drivers/pinctrl/pinctrl-adi2.c:311:1-18: ERROR: nested lock+irqsave that reuses flags from line 310.

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
