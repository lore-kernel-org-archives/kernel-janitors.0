From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 04 Sep 2013 16:02:55 +0000
Subject: build regressions 2013-09-04
Message-Id: <522759af.cP2x1oSGElq4Qix0%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/x86/oprofile/nmi_int.c:423:30: error: dereferencing pointer to incomplete type
arch/x86/oprofile/nmi_int.c:424:31: error: dereferencing pointer to incomplete type
arch/x86/oprofile/nmi_int.c:425:31: error: dereferencing pointer to incomplete type
arch/x86/oprofile/nmi_int.c:426:31: error: dereferencing pointer to incomplete type
arch/x86/oprofile/nmi_int.c:427:31: error: dereferencing pointer to incomplete type
arch/x86/oprofile/nmi_int.c:428:31: error: dereferencing pointer to incomplete type
arch/x86/oprofile/nmi_int.c:429:31: error: dereferencing pointer to incomplete type
arch/x86/oprofile/nmi_int.c:430:31: error: dereferencing pointer to incomplete type
arch/x86/oprofile/op_model_amd.c:482:30: error: dereferencing pointer to incomplete type
arch/x86/oprofile/op_model_amd.c:483:31: error: dereferencing pointer to incomplete type
arch/x86/oprofile/op_model_amd.c:485:31: error: dereferencing pointer to incomplete type
arch/x86/oprofile/op_model_amd.c:487:31: error: dereferencing pointer to incomplete type
arch/x86/oprofile/op_model_amd.c:492:30: error: dereferencing pointer to incomplete type
arch/x86/oprofile/op_model_amd.c:493:31: error: dereferencing pointer to incomplete type
arch/x86/oprofile/op_model_amd.c:495:31: error: dereferencing pointer to incomplete type
arch/x86/oprofile/op_model_amd.c:498:32: error: dereferencing pointer to incomplete type
arch/x86/oprofile/op_model_amd.c:501:32: error: dereferencing pointer to incomplete type
fs/direct-io.c:545:2: error: arithmetic on pointer to an incomplete type
fs/direct-io.c:545:2: error: arithmetic on pointer to an incomplete type
fs/direct-io.c:545:2: error: arithmetic on pointer to an incomplete type
fs/direct-io.c:545:2: error: arithmetic on pointer to an incomplete type
fs/direct-io.c:545:2: error: arithmetic on pointer to an incomplete type
fs/direct-io.c:545:2: error: arithmetic on pointer to an incomplete type
fs/direct-io.c:545:2: error: arithmetic on pointer to an incomplete type
fs/direct-io.c:545:2: error: arithmetic on pointer to an incomplete type
drivers/gpu/drm/virgl/virgl_object.h:62:31: error: 'struct ttm_buffer_object' has no member named 'reserved'
drivers/gpu/drm/virgl/virgl_object.h:62:31: error: 'struct ttm_buffer_object' has no member named 'reserved'
drivers/gpu/drm/virgl/virgl_object.h:62:31: error: 'struct ttm_buffer_object' has no member named 'reserved'
drivers/gpu/drm/virgl/virgl_object.h:62:31: error: 'struct ttm_buffer_object' has no member named 'reserved'
drivers/gpu/drm/virgl/virgl_3d.c:377:2: error: implicit declaration of function 'virtqueue_add_buf' [-Werror=implicit-function-declaration]
drivers/gpu/drm/virgl/virgl_object.h:62:31: error: 'struct ttm_buffer_object' has no member named 'reserved'
drivers/gpu/drm/virgl/virgl_3d.c:547:2: error: too few arguments to function 'ttm_eu_reserve_buffers'
drivers/gpu/drm/virgl/virgl_3d.c:676:2: error: too few arguments to function 'ttm_eu_fence_buffer_objects'
drivers/gpu/drm/virgl/virgl_3d.c:685:2: error: too few arguments to function 'ttm_eu_backoff_reservation'
drivers/gpu/drm/i915/intel_display.c:7892:29: error: 'struct intel_ring_buffer' has no member named 'scratch'

[warnings]
fs/direct-io.c:545: warning: value computed is not used
drivers/gpu/drm/nouveau/core/engine/disp/dacnv50.c:64:2: warning: format '%x' expects a matching 'unsigned int' argument [-Wformat=]
drivers/gpu/drm/virgl/virgl_fb.c:71:6: warning: unused variable 'size' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_object.c:165:14: warning: assignment makes integer from pointer without a cast [enabled by default]
drivers/gpu/drm/virgl/virgl_object.c:161:9: warning: unused variable 'i' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_object.c:161:6: warning: unused variable 'r' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_object.c:160:23: warning: unused variable 'qdev' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_object.c:172:9: warning: unused variable 'i' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_object.c:172:6: warning: unused variable 'r' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_object.c:219:6: warning: unused variable 'i' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_object.c:218:19: warning: unused variable 'sg' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_3d.c:141:2: warning: 'idr_pre_get' is deprecated (declared at include/linux/idr.h:151) [-Wdeprecated-declarations]
drivers/gpu/drm/virgl/virgl_3d.c:145:2: warning: 'idr_get_new_above' is deprecated (declared at include/linux/idr.h:166) [-Wdeprecated-declarations]
include/linux/typecheck.h:11:18: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/gpu/drm/virgl/virgl_display.c:172:23: warning: unused variable 'qdev' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_display.c:187:6: warning: unused variable 'ret' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_display.c:285:23: warning: unused variable 'qdev' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_display.c:339:6: warning: unused variable 'connected' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_display.c:338:23: warning: unused variable 'qdev' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_display.c:335:23: warning: unused variable 'output' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_display.c:418:23: warning: unused variable 'qdev' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_display.c:447:6: warning: unused variable 'max_allowed' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_display.c:446:25: warning: unused variable 'gobj' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_display.c:445:6: warning: unused variable 'ret' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_debugfs.c:46:6: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'long long int' [-Wformat=]
drivers/gpu/drm/virgl/virgl_fb.c:334:11: warning: unused variable 'res_handle' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_gem.c:155:3: warning: 'return' with a value, in function returning void [enabled by default]
drivers/gpu/drm/virgl/virgl_gem.c:159:2: warning: 'return' with a value, in function returning void [enabled by default]
drivers/gpu/drm/virgl/virgl_ioctl.c:144:23: warning: unused variable 'qdev' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_3d.c:587:8: warning: unused variable 'osyncobj' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_ioctl.c:209:1: warning: label 'fail_pg_obj' defined but not used [-Wunused-label]
drivers/gpu/drm/virgl/virgl_3d.c:420:36: warning: unused variable 'vbuf' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_3d.c:419:38: warning: unused variable 'old_idx' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_3d.c:419:6: warning: unused variable 'idx' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_display.c:173:26: warning: unused variable 'old_fb' [-Wunused-variable]
drivers/cpuidle/cpuidle.c:172:1: warning: data definition has no type or storage class [enabled by default]
drivers/cpuidle/cpuidle.c:172:1: warning: type defaults to 'int' in declaration of 'FTRACE_UNSAFE_RCU' [-Wimplicit-int]
drivers/cpuidle/cpuidle.c:172:1: warning: parameter names (without types) in function declaration [enabled by default]
kernel/rcutree.c:377:1: warning: data definition has no type or storage class [enabled by default]
kernel/rcutree.c:377:1: warning: type defaults to 'int' in declaration of 'FTRACE_UNSAFE_RCU' [-Wimplicit-int]
kernel/rcutree.c:377:1: warning: parameter names (without types) in function declaration [enabled by default]
kernel/rcutree.c:397:1: warning: data definition has no type or storage class [enabled by default]
kernel/rcutree.c:397:1: warning: type defaults to 'int' in declaration of 'FTRACE_UNSAFE_RCU' [-Wimplicit-int]
kernel/rcutree.c:397:1: warning: parameter names (without types) in function declaration [enabled by default]
kernel/rcutree.c:519:1: warning: data definition has no type or storage class [enabled by default]
kernel/rcutree.c:519:1: warning: type defaults to 'int' in declaration of 'FTRACE_UNSAFE_RCU' [-Wimplicit-int]
kernel/rcutree.c:519:1: warning: parameter names (without types) in function declaration [enabled by default]
kernel/rcutree.c:560:1: warning: data definition has no type or storage class [enabled by default]
kernel/rcutree.c:560:1: warning: type defaults to 'int' in declaration of 'FTRACE_UNSAFE_RCU' [-Wimplicit-int]
kernel/rcutree.c:560:1: warning: parameter names (without types) in function declaration [enabled by default]
kernel/rcutree.c:634:1: warning: data definition has no type or storage class [enabled by default]
kernel/rcutree.c:634:1: warning: type defaults to 'int' in declaration of 'FTRACE_UNSAFE_RCU' [-Wimplicit-int]
kernel/rcutree.c:634:1: warning: parameter names (without types) in function declaration [enabled by default]
net/sunrpc/auth_gss/auth_gss.c:1357:3: warning: format '%d' expects argument of type 'int', but argument 2 has type 'kuid_t' [-Wformat]
drivers/gpu/drm/virgl/virgl_3d.c:638:107: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/gpu/drm/virgl/virgl_3d.c:116:11: warning: unused variable 'val' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_3d.c:115:11: warning: unused variable 'pending' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_3d.c:195:3: warning: format '%d' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
drivers/gpu/drm/virgl/virgl_3d.c:233:20: warning: unused variable 'vq' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_3d.c:631:11: warning: unused variable 'i' [-Wunused-variable]
drivers/gpu/drm/virgl/virgl_3d.c:547:2: warning: passing argument 1 of 'ttm_eu_reserve_buffers' from incompatible pointer type [enabled by default]
drivers/gpu/drm/virgl/virgl_3d.c:676:2: warning: passing argument 1 of 'ttm_eu_fence_buffer_objects' from incompatible pointer type [enabled by default]
drivers/gpu/drm/virgl/virgl_3d.c:676:2: warning: passing argument 2 of 'ttm_eu_fence_buffer_objects' from incompatible pointer type [enabled by default]
drivers/gpu/drm/virgl/virgl_3d.c:685:2: warning: passing argument 1 of 'ttm_eu_backoff_reservation' from incompatible pointer type [enabled by default]
net/sunrpc/auth_generic.c:241:4: warning: format '%d' expects argument of type 'int', but argument 2 has type 'kuid_t' [-Wformat=]
kernel/rcutiny.c:176:1: warning: data definition has no type or storage class [enabled by default]
kernel/rcutiny.c:176:1: warning: type defaults to 'int' in declaration of 'FTRACE_UNSAFE_RCU' [-Wimplicit-int]
kernel/rcutiny.c:176:1: warning: parameter names (without types) in function declaration [enabled by default]
kernel/cpu/idle.c:65:1: warning: data definition has no type or storage class [enabled by default]
kernel/cpu/idle.c:65:1: warning: type defaults to 'int' in declaration of 'FTRACE_UNSAFE_RCU' [-Wimplicit-int]
kernel/cpu/idle.c:65:1: warning: parameter names (without types) in function declaration [enabled by default]
arch/x86/kernel/process.c:320:1: warning: data definition has no type or storage class [enabled by default]
arch/x86/kernel/process.c:320:1: warning: type defaults to 'int' in declaration of 'FTRACE_UNSAFE_RCU' [-Wimplicit-int]
arch/x86/kernel/process.c:320:1: warning: parameter names (without types) in function declaration [enabled by default]
include/linux/ratelimit.h:22:9: warning: format '%d' expects argument of type 'int', but argument 2 has type 'kuid_t' [-Wformat=]
include/linux/compiler.h:137:17: warning: format '%x' expects a matching 'unsigned int' argument [-Wformat=]
include/linux/compiler.h:102:18: warning: format '%d' expects argument of type 'int', but argument 2 has type 'kuid_t' [-Wformat=]
include/linux/compiler.h:137:17: warning: format '%d' expects argument of type 'int', but argument 2 has type 'kuid_t' [-Wformat=]

[sparse]
drivers/net/usb/sr9700.c:198:21: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [addressable] [usertype] res @@    got e] res @@
drivers/net/usb/sr9700.c:200:21: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [addressable] [usertype] res @@    got e] res @@
drivers/net/usb/sr9700.c:205:16: sparse: incorrect type in return expression (different base types) @@    expected int @@    got restricted __le16 [addressable] [usertypint @@
drivers/gpu/drm/virgl/virgl_drv.c:47:5: sparse: symbol 'virgl_modeset' was not declared. Should it be static?
drivers/gpu/drm/virgl/virgl_kms.c:31:5: sparse: symbol 'virgl_device_init' was not declared. Should it be static?
drivers/gpu/drm/virgl/virgl_kms.c:75:6: sparse: symbol 'virgl_device_fini' was not declared. Should it be static?
drivers/gpu/drm/virgl/virgl_ttm.c:295:15: sparse: symbol 'virgl_ttm_tt_create' was not declared. Should it be static?
drivers/gpu/drm/virgl/virgl_object.h:34:60: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/virgl/virgl_object.h:34:60: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/virgl/virgl_fb.c:381:27: sparse: incorrect type in assignment (different address spaces) @@    expected char [noderef] <asn:2>*screen_base @@    got sn:2>*screen_base @@
drivers/gpu/drm/virgl/virgl_object.c:165:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned long long [unsigned] [long] [long long] [usertype] <noident> @@    got type] <noident> @@
drivers/gpu/drm/virgl/virgl_object.h:34:60: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/virgl/virgl_object.h:34:60: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/virgl/virgl_3d.c:229:25: sparse: symbol 'allocate_vbuf' was not declared. Should it be static?
drivers/gpu/drm/virgl/virgl_3d.c:638:21: sparse: incompatible types in comparison expression (different type sizes)
drivers/gpu/drm/virgl/virgl_ioctl.c:56:5: sparse: symbol 'virgl_map_ioctl' was not declared. Should it be static?
drivers/gpu/drm/virgl/virgl_ioctl.c:73:5: sparse: symbol 'virgl_execbuffer_ioctl' was not declared. Should it be static?
drivers/gpu/drm/virgl/virgl_object.h:34:60: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/virgl/virgl_object.h:34:60: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/virgl/virgl_display.c:128:5: sparse: symbol 'virgl_framebuffer_surface_dirty' was not declared. Should it be static?
drivers/gpu/drm/virgl/virgl_display.c:223:6: sparse: symbol 'virgl_crtc_load_lut' was not declared. Should it be static?
drivers/gpu/drm/virgl/virgl_display.c:297:20: sparse: symbol 'virgl_best_encoder' was not declared. Should it be static?
drivers/gpu/drm/virgl/virgl_3d.c:966:55: sparse: incompatible types in comparison expression (different signedness)
drivers/gpu/drm/virgl/virgl_3d.c:472:79: sparse: Using plain integer as NULL pointer
drivers/gpu/drm/virgl/virgl_3d.c:670:13: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const [noderef] <asn:1>*from @@    got sn:1>*from @@
drivers/gpu/drm/virgl/virgl_gem.c:155:24: sparse: return expression in void function
drivers/gpu/drm/virgl/virgl_ioctl.c:433:5: sparse: symbol 'virgl_max_ioctls' was not declared. Should it be static?
drivers/gpu/drm/virgl/virgl_display.c:331:5: sparse: symbol 'qdev_crtc_init' was not declared. Should it be static?
drivers/gpu/drm/virgl/virgl_display.c:475:5: sparse: symbol 'qdev_output_init' was not declared. Should it be static?

[coccinelle]
drivers/gpu/drm/virgl/virgl_3d.c:455:48-49: feature_table_size: first occurrence line 457, second occurrence line 461
drivers/regulator/max77686.c:487:10-17: ERROR: PTR_ERR applied after initialization to constant on line 486

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
