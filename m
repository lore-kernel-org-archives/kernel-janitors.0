From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 30 Aug 2013 05:13:31 +0000
Subject: build regressions 2013-08-29
Message-Id: <522029fb.72Vm8sCZ05cd9fnb%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/linux/kernel.h:50:30: error: 'ret' may be used uninitialized in this function [-Werror=maybe-uninitialized]
drivers/gpu/drm/i915/i915_gem_gtt.c:691:5: error: 'ret' may be used uninitialized in this function [-Werror=maybe-uninitialized]
drivers/gpu/drm/i915/i915_sysfs.c:417:17: error: 'val' may be used uninitialized in this function [-Werror=maybe-uninitialized]
drivers/gpu/drm/i915/intel_display.c:911:20: error: 'state_string' defined but not used [-Werror=unused-function]
drivers/gpu/drm/i915/intel_ddi.c:401:21: error: unused variable 'intel_crtc' [-Werror=unused-variable]

[sparse]
drivers/staging/dgap/dgap_driver.c:520:73: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] priority @@    got resint [signed] priority @@
drivers/staging/dgap/dgap_driver.c:528:68: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] priority @@    got resint [signed] priority @@
drivers/staging/dgap/dgap_driver.c:466:28: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_driver.c:472:28: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_driver.c:705:29: sparse: incorrect type in assignment (different address spaces) @@    expected unsigned char [usertype] *re_map_membase @@    got igned char [usertype] *re_map_membase @@
drivers/staging/dgap/dgap_driver.c:713:26: sparse: incorrect type in assignment (different address spaces) @@    expected unsigned char [usertype] *re_map_port @@    got igned char [usertype] *re_map_port @@
drivers/staging/dgap/dgap_driver.c:717:28: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_driver.c:945:33: sparse: incorrect type in argument 2 (different base types) @@    expected restricted gfp_t [usertype] flags @@    got t [usertype] flags @@
drivers/staging/dgap/dgap_fep5.c:1030:24: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1046:31: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1048:41: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1049:28: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1056:37: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1058:37: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1063:24: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1073:32: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1074:32: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1696:24: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1697:24: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1781:45: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1953:24: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:80:67: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] priority @@    got restricted gfp_int [signed] priority @@
drivers/staging/dgap/dgap_fep5.c:135:74: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] priority @@    got restricted gfp_int [signed] priority @@
drivers/staging/dgap/dgap_fep5.c:136:78: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] priority @@    got restricted gfp_int [signed] priority @@
drivers/staging/dgap/dgap_fep5.c:168:29: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2>*dst @@    got sn:2>*dst @@
drivers/staging/dgap/dgap_fep5.c:201:43: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:213:28: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got unsigvoid volatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:214:25: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:217:27: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:234:27: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:245:39: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:246:39: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:295:42: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got unsigvoid volatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:301:34: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:302:27: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:327:27: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:337:35: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:348:39: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:349:39: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:379:27: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:382:34: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:398:49: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:399:49: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:400:44: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:401:44: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:432:25: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got volatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:439:22: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2>*dst @@    got sn:2>*dst @@
drivers/staging/dgap/dgap_fep5.c:442:25: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:483:26: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:484:43: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:509:78: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:510:79: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:511:77: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:520:59: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:521:73: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:539:86: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:604:39: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got void const volatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:625:32: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:626:32: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:642:47: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:794:55: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:798:65: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:852:24: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:866:22: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:867:41: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:868:24: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:869:24: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:873:24: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:883:32: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:884:32: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:941:24: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:955:22: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:956:41: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:957:29: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:961:24: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:971:32: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:972:32: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1114:24: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1134:29: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2>*dst @@    got noderef] <asn:2>*dst @@
drivers/staging/dgap/dgap_fep5.c:1144:21: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2>*dst @@    got noderef] <asn:2>*dst @@
drivers/staging/dgap/dgap_fep5.c:1147:24: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1184:29: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1256:19: sparse: Using plain integer as NULL pointer
drivers/staging/dgap/dgap_fep5.c:1271:34: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1272:34: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1275:34: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1276:34: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_fep5.c:1538:33: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1118:33: sparse: Using plain integer as NULL pointer
drivers/staging/dgap/dgap_tty.c:1150:32: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1151:32: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:3387:50: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:3388:50: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:3389:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:3395:42: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:3440:42: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:3441:42: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:2686:25: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:2736:36: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1829:24: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1830:24: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1785:37: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1791:37: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1593:25: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1594:25: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1597:25: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1600:27: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1601:27: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1638:45: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:3133:26: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1690:29: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:2404:27: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:2144:27: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1939:24: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1940:24: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1785:37: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1791:37: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1976:32: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1987:32: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1785:37: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1791:37: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:2040:29: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2>*dst @@    got noderef] <asn:2>*dst @@
drivers/staging/dgap/dgap_tty.c:2055:29: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2>*dst @@    got noderef] <asn:2>*dst @@
drivers/staging/dgap/dgap_tty.c:2065:32: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1785:37: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:1791:37: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:2079:32: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:2083:37: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:2088:40: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:236:96: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] priority @@    got resint [signed] priority @@
drivers/staging/dgap/dgap_tty.c:269:95: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] priority @@    got resint [signed] priority @@
drivers/staging/dgap/dgap_tty.c:341:35: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got olatile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:383:91: sparse: incorrect type in argument 2 (different base types) @@    expected int [signed] priority @@    got restricted gfp_int [signed] priority @@
drivers/staging/dgap/dgap_tty.c:443:42: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:444:42: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:463:43: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:472:35: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:479:39: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:481:41: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:483:31: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:604:56: sparse: Using plain integer as NULL pointer
drivers/staging/dgap/dgap_tty.c:720:24: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:722:24: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:728:29: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:746:32: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:747:29: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:757:29: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:768:27: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:771:29: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:808:40: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:814:29: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:839:58: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*src @@    got sn:2>*src @@
drivers/staging/dgap/dgap_tty.c:850:24: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got latile [noderef] <asn:2>*addr @@
drivers/staging/dgap/dgap_tty.c:851:21: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got atile [noderef] <asn:2>*addr @@
fs/aio.c:1284:43: sparse: cast removes address space of expression
fs/aio.c:1288:44: sparse: cast removes address space of expression
fs/aio.c:1393:38: sparse: incorrect type in argument 3 (different address spaces) @@    expected char [noderef] <asn:1>*buf @@    got sn:1>*buf @@

[coccinelle]
drivers/scsi/esas2r/esas2r_flash.c:1376:1-7: Replace memcpy with struct assignment
drivers/scsi/esas2r/esas2r_flash.c:1358:1-7: Replace memcpy with struct assignment

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
