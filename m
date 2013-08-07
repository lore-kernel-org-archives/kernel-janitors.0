From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 07 Aug 2013 19:14:29 +0000
Subject: build regressions 2013-08-07
Message-Id: <52029c95.QyeVpBt/kwGgtFWB%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/arm/mach-versatile/core.c:748:2: error: unknown field 'get_signal' specified in initializer
arch/arm/mach-versatile/core.c:749:2: error: unknown field 'put_signal' specified in initializer
sound/soc/fsl/fsl_ssi.c:916:3: error: implicit declaration of function 'snd_soc_set_ac97_ops_of_reset' [-Werror=implicit-function-declaration]
clk-composite.c:(.text+0x56bb4): undefined reference to `drm_agp_clear'
ak8975.c:(.text+0x655a0): undefined reference to `drm_agp_clear'
drivers/regulator/helpers.o:(__tracepoints+0x54): multiple definition of `__tracepoint_regulator_disable'
drivers/regulator/core.o:(__tracepoints+0x54): first defined here
drivers/regulator/helpers.o:(__tracepoints+0x0): multiple definition of `__tracepoint_regulator_set_voltage_complete'
drivers/regulator/core.o:(__tracepoints+0x0): first defined here
drivers/regulator/helpers.o:(__tracepoints+0xa8): multiple definition of `__tracepoint_regulator_enable'
drivers/regulator/core.o:(__tracepoints+0xa8): first defined here
drivers/regulator/helpers.o:(__tracepoints+0x70): multiple definition of `__tracepoint_regulator_enable_complete'
drivers/regulator/core.o:(__tracepoints+0x70): first defined here
drivers/regulator/helpers.o:(__tracepoints+0x1c): multiple definition of `__tracepoint_regulator_set_voltage'
drivers/regulator/core.o:(__tracepoints+0x1c): first defined here
drivers/regulator/helpers.o:(__tracepoints+0x8c): multiple definition of `__tracepoint_regulator_enable_delay'
drivers/regulator/core.o:(__tracepoints+0x8c): first defined here
drivers/regulator/helpers.o:(__tracepoints+0x38): multiple definition of `__tracepoint_regulator_disable_complete'
drivers/regulator/core.o:(__tracepoints+0x38): first defined here
ERROR: "drm_agp_clear" undefined!
/bin/bash: line 1: 56742 Segmentation fault      /usr/local/gcc-4.8.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld -m elf64ppc -r -o drivers/regulator/built-in.o drivers/regulator/core.o drivers/regulator/dummy.o drivers/regulator/fixed-helper.o drivers/regulator/helpers.o drivers/regulator/of_regulator.o
arch/s390/pci/pci.c:412:17: error: 'aibv' undeclared (first use in this function)
drivers/regulator/core.c:639:3: error: 'dev_attr_name' undeclared here (not in a function)
drivers/regulator/core.c:640:3: error: 'dev_attr_num_users' undeclared here (not in a function)
drivers/regulator/core.c:641:3: error: 'dev_attr_type' undeclared here (not in a function)
drivers/regulator/core.c:655:2: error: unknown field 'dev_groups' specified in initializer
drivers/regulator/core.c:655:16: error: 'regulator_dev_groups' undeclared here (not in a function)
drivers/regulator/core.c:655:2: error: initializer element is not constant
drivers/gpu/drm/i915/i915_gem_stolen.c:426:2: error: implicit declaration of function 'drm_mm_put_block' [-Werror=implicit-function-declaration]
(.text+0x904a0): undefined reference to `drm_agp_clear'

[warnings]
arch/x86/kernel/paravirt.c:66:0: warning: "DEF_NATIVE" redefined [enabled by default]
arch/x86/kernel/paravirt.c:66:0: warning: "DEF_NATIVE" redefined [enabled by default]
arch/x86/xen/enlighten.c:1250:2: warning: initialization from incompatible pointer type [enabled by default]
arch/x86/xen/enlighten.c:1250:2: warning: (near initialization for 'xen_cpu_ops.iret') [enabled by default]
arch/x86/xen/enlighten.c:1251:2: warning: initialization from incompatible pointer type [enabled by default]
arch/x86/xen/enlighten.c:1251:2: warning: (near initialization for 'xen_cpu_ops.irq_enable_sysexit') [enabled by default]
drivers/net/ethernet/calxeda/xgmac.c:855:6: warning: unused variable 'i' [-Wunused-variable]
drivers/regulator/core.c:333:8: warning: type defaults to 'int' in declaration of 'DEVICE_ATTR_RO' [-Wimplicit-int]
drivers/regulator/core.c:333:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/regulator/core.c:499:8: warning: type defaults to 'int' in declaration of 'DEVICE_ATTR_RO' [-Wimplicit-int]
drivers/regulator/core.c:499:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/regulator/core.c:514:8: warning: type defaults to 'int' in declaration of 'DEVICE_ATTR_RO' [-Wimplicit-int]
drivers/regulator/core.c:514:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/regulator/core.c:644:1: warning: data definition has no type or storage class [enabled by default]
drivers/regulator/core.c:644:1: warning: type defaults to 'int' in declaration of 'ATTRIBUTE_GROUPS' [-Wimplicit-int]
drivers/regulator/core.c:644:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/regulator/core.c:638:26: warning: 'regulator_dev_attrs' defined but not used [-Wunused-variable]

[sparse]
arch/x86/kernel/paravirt.c:66:9: sparse: preprocessor token DEF_NATIVE redefined
arch/x86/lib/inat-tables.c:978:19: sparse: symbol 'inat_group_table_11' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:996:19: sparse: symbol 'inat_group_table_22_1' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:999:19: sparse: symbol 'inat_group_table_22_2' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:1007:19: sparse: symbol 'inat_group_table_4' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:1043:19: sparse: symbol 'inat_group_table_16' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:1049:19: sparse: symbol 'inat_group_table_16_1' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:1057:19: sparse: symbol 'inat_group_table_19' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:1063:19: sparse: symbol 'inat_group_table_19_2' was not declared. Should it be static?
arch/x86/lib/inat-tables.c:1079:19: sparse: symbol 'inat_group_table_23' was not declared. Should it be static?
arch/x86/kernel/kprobes/core.c:664:33: sparse: symbol 'trampoline_handler' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
