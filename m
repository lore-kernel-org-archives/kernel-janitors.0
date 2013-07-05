From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 05 Jul 2013 20:51:25 +0000
Subject: build regressions 2013-07-05
Message-Id: <51d731cd.QB1N/vFlLZnT6ROB%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
ERROR: "acpi_gbl_osi_data" [drivers/gpu/drm/i915/i915.ko] undefined!
technisat-usb2.c:(.text+0xa739bd): undefined reference to `stv090x_set_gpio'
drivers/gpu/drm/i915/i915_dma.c:1665:29: error: 'ACPI_OSI_WIN_8' undeclared (first use in this function)
drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c:1225:1: internal compiler error: in expand_expr_real_1, at expr.c:10478
drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc1.c:804:1: internal compiler error: in expand_expr_real_1, at expr.c:10478
drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc3.c:91:1: internal compiler error: in expand_expr_real_1, at expr.c:10478
drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc8.c:362:1: internal compiler error: in expand_expr_real_1, at expr.c:10478
drivers/gpu/drm/nouveau/core/engine/graph/ctxnvd9.c:531:1: internal compiler error: in expand_expr_real_1, at expr.c:10478
drivers/gpu/drm/nouveau/core/engine/graph/ctxnve4.c:1033:1: internal compiler error: in expand_expr_real_1, at expr.c:10478
drivers/gpu/drm/nouveau/core/engine/graph/ctxnvf0.c:288:1: internal compiler error: in expand_expr_real_1, at expr.c:10478
drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c:1215:1: internal compiler error: in expand_expr_real_1, at expr.c:10478
drivers/gpu/drm/nouveau/core/engine/graph/nvc1.c:143:1: internal compiler error: in expand_expr_real_1, at expr.c:10478
drivers/gpu/drm/nouveau/core/engine/graph/nvc3.c:109:1: internal compiler error: in expand_expr_real_1, at expr.c:10478
drivers/gpu/drm/nouveau/core/engine/graph/nvc8.c:140:1: internal compiler error: in expand_expr_real_1, at expr.c:10478
drivers/gpu/drm/nouveau/core/engine/graph/nvd9.c:164:1: internal compiler error: in expand_expr_real_1, at expr.c:10478
drivers/gpu/drm/nouveau/core/engine/graph/nve4.c:354:1: internal compiler error: in expand_expr_real_1, at expr.c:10478
drivers/gpu/drm/nouveau/core/engine/graph/nvf0.c:176:1: internal compiler error: in expand_expr_real_1, at expr.c:10478
drivers/gpu/drm/nouveau/core/engine/graph/ctxnvd7.c:303:1: internal compiler error: in expand_expr_real_1, at expr.c:10478
drivers/gpu/drm/nouveau/core/engine/graph/nvd7.c:167:1: internal compiler error: in expand_expr_real_1, at expr.c:10478
drivers/gpu/drm/radeon/atombios_encoders.c:230:2: error: implicit declaration of function 'acpi_osi_version' [-Werror=implicit-function-declaration]
drivers/gpu/drm/radeon/atombios_encoders.c:230:28: error: 'ACPI_OSI_WIN_8' undeclared (first use in this function)
drivers/gpu/drm/radeon/atombios_encoders.c:231:3: error: implicit declaration of function 'acpi_video_backlight_unregister' [-Werror=implicit-function-declaration]
drivers/media/platform/vsp1/vsp1_video.c:145:2: error: implicit declaration of function 'media_entity_remote_source' [-Werror=implicit-function-declaration]
xt_TPROXY.c:(.text+0x6b4cb): undefined reference to `udp6_lib_lookup'
xt_TPROXY.c:(.text+0x6b616): undefined reference to `udp6_lib_lookup'
xt_TPROXY.c:(.text+0x6ba01): undefined reference to `udp6_lib_lookup'

[warnings]
WARNING: drivers/usb/gadget/built-in.o(.data+0x1f58): Section mismatch in reference from the variable fotg210_driver to the function .init.text:usb_udc_init()
WARNING: drivers/usb/built-in.o(.data+0x1d1f4): Section mismatch in reference from the variable fotg210_driver to the function .init.text:usb_init()
drivers/media/platform/vsp1/vsp1_video.c:145:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/media/platform/vsp1/vsp1_video.c:191:6: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/media/platform/vsp1/vsp1_video.c:226:7: warning: assignment makes pointer from integer without a cast [enabled by default]
WARNING: vmlinux.o(.data+0x2c8004): Section mismatch in reference from the variable fotg210_driver to the (unknown reference) .init.text:(unknown)
WARNING: drivers/built-in.o(.data+0x120d4c): Section mismatch in reference from the variable fotg210_driver to the function .init.text:irqchip_init()

[sparse]
drivers/acpi/dock.c:839:51: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/radeon/atombios_encoders.c:230:13: sparse: undefined identifier 'acpi_osi_version'
drivers/gpu/drm/radeon/atombios_encoders.c:231:17: sparse: undefined identifier 'acpi_video_backlight_unregister'
drivers/gpu/drm/nouveau/core/engine/graph/fuc/hubnvd7.fuc.h:1:10: sparse: symbol 'nvd7_grhub_data' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/graph/fuc/hubnvd7.fuc.h:208:10: sparse: symbol 'nvd7_grhub_code' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/graph/fuc/gpcnvd7.fuc.h:1:10: sparse: symbol 'nvd7_grgpc_data' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/graph/fuc/gpcnvd7.fuc.h:43:10: sparse: symbol 'nvd7_grgpc_code' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/graph/fuc/hubnvf0.fuc.h:1:10: sparse: symbol 'nvf0_grhub_data' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/graph/fuc/hubnvf0.fuc.h:208:10: sparse: symbol 'nvf0_grhub_code' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/graph/fuc/gpcnvf0.fuc.h:1:10: sparse: symbol 'nvf0_grgpc_data' was not declared. Should it be static?
drivers/gpu/drm/nouveau/core/engine/graph/fuc/gpcnvf0.fuc.h:43:10: sparse: symbol 'nvf0_grgpc_code' was not declared. Should it be static?
drivers/media/platform/vsp1/vsp1_video.c:145:18: sparse: undefined identifier 'media_entity_remote_source'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
