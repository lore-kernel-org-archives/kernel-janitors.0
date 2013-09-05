From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 05 Sep 2013 20:10:00 +0000
Subject: build regressions 2013-09-05
Message-Id: <5228e518.vH794z9u2hNeHKqq%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5228b239.i3r49DwYOMMsJ+V4%fengguang.wu@intel.com>
In-Reply-To: <5228b239.i3r49DwYOMMsJ+V4%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/usb/phy/phy-am335x.c:56:4: error: too many arguments to function 'usb_phy_gen_create_phy'
drivers/acpi/osl.c:575:27: error: 'NR_FIX_BTMAPS' undeclared (first use in this function)
net/sunrpc/sched.c:1011:16: error: 'struct rpc_task' has no member named 'tk_pid'

[warnings]
drivers/usb/phy/phy-generic.c:263: warning: 'flags' is used uninitialized in this function
kernel/sched/core.c:3226:1: warning: data definition has no type or storage class [enabled by default]
kernel/sched/core.c:3226:1: warning: type defaults to 'int' in declaration of 'FTRACE_UNSAFE_RCU' [-Wimplicit-int]
kernel/sched/core.c:3226:1: warning: parameter names (without types) in function declaration [enabled by default]

[sparse]
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
include/linux/slab.h:433:53: sparse: restricted gfp_t degrades to integer
drivers/acpi/osl.c:674:32: sparse: incorrect type in assignment (different address spaces) @@    expected char *dest_p @@    got void [noderef] <achar *dest_p @@
drivers/acpi/osl.c:696:31: sparse: incorrect type in assignment (different address spaces) @@    expected char *src_p @@    got void [noderef] <achar *src_p @@
drivers/usb/phy/phy-am335x.c:55:37: sparse: too many arguments for function usb_phy_gen_create_phy
fs/cifs/fscache.c:243:6: sparse: symbol '__cifs_fscache_uncache_page' was not declared. Should it be static?

[coccinelle]
drivers/regulator/max77693.c:275:10-17: ERROR: PTR_ERR applied after initialization to constant on line 274
drivers/regulator/max8997.c:1213:10-17: ERROR: PTR_ERR applied after initialization to constant on line 1212

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
