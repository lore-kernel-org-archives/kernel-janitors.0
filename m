From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 30 Mar 2013 19:02:24 +0000
Subject: build regressions 2013-03-30
Message-Id: <515736c0.sXbaXhbvjrRdcl0v%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
lib/dump_stack.c:(.text.unlikely+0x0): multiple definition of `dump_stack'
arch/blackfin/kernel/built-in.o:(.text.unlikely+0x10): first defined here
arch/x86/kernel/dumpstack_32.c:89:23: error: 'KERN_EMERGE' undeclared (first use in this function)
init.c:(.text+0x232cb7): undefined reference to `relay_close'
arch/ia64/Kconfig:596: unexpected 'endif' within menu block
arch/ia64/Kconfig:598: unexpected 'endmenu' within if block
arch/ia64/Kconfig:657: syntax error
arch/ia64/Kconfig:587: missing end statement for this entry
arch/ia64/Kconfig:596: unexpected 'endif' within menu block
arch/ia64/Kconfig:598: unexpected 'endmenu' within if block
arch/ia64/Kconfig:657: syntax error
arch/ia64/Kconfig:587: missing end statement for this entry
arch/ia64/Kconfig:596: unexpected 'endif' within menu block
arch/ia64/Kconfig:598: unexpected 'endmenu' within if block
arch/ia64/Kconfig:657: syntax error
arch/ia64/Kconfig:587: missing end statement for this entry
arch/tile/built-in.o:(.text.dump_stack+0x0): first defined here
drivers/cpufreq/cpufreq_ondemand.c:453:1: error: variable 'sampling_rate_gov_sys' has initializer but incomplete type
drivers/cpufreq/cpufreq_ondemand.c:453:1: error: unknown field 'attr' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:453:1: error: extra brace group at end of initializer
drivers/cpufreq/cpufreq_ondemand.c:453:1: error: unknown field 'show' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:453:1: error: unknown field 'store' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:454:1: error: variable 'io_is_busy_gov_sys' has initializer but incomplete type
drivers/cpufreq/cpufreq_ondemand.c:454:1: error: unknown field 'attr' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:454:1: error: extra brace group at end of initializer
drivers/cpufreq/cpufreq_ondemand.c:454:1: error: unknown field 'show' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:454:1: error: unknown field 'store' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:455:1: error: variable 'up_threshold_gov_sys' has initializer but incomplete type
drivers/cpufreq/cpufreq_ondemand.c:455:1: error: unknown field 'attr' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:455:1: error: extra brace group at end of initializer
drivers/cpufreq/cpufreq_ondemand.c:455:1: error: unknown field 'show' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:455:1: error: unknown field 'store' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:456:1: error: variable 'sampling_down_factor_gov_sys' has initializer but incomplete type
drivers/cpufreq/cpufreq_ondemand.c:456:1: error: unknown field 'attr' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:456:1: error: extra brace group at end of initializer
drivers/cpufreq/cpufreq_ondemand.c:456:1: error: unknown field 'show' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:456:1: error: unknown field 'store' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:457:1: error: variable 'ignore_nice_gov_sys' has initializer but incomplete type
drivers/cpufreq/cpufreq_ondemand.c:457:1: error: unknown field 'attr' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:457:1: error: extra brace group at end of initializer
drivers/cpufreq/cpufreq_ondemand.c:457:1: error: unknown field 'show' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:457:1: error: unknown field 'store' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:458:1: error: variable 'powersave_bias_gov_sys' has initializer but incomplete type
drivers/cpufreq/cpufreq_ondemand.c:458:1: error: unknown field 'attr' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:458:1: error: extra brace group at end of initializer
drivers/cpufreq/cpufreq_ondemand.c:458:1: error: unknown field 'show' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:458:1: error: unknown field 'store' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:459:1: error: variable 'sampling_rate_min_gov_sys' has initializer but incomplete type
drivers/cpufreq/cpufreq_ondemand.c:459:1: error: unknown field 'attr' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:459:1: error: extra brace group at end of initializer
drivers/cpufreq/cpufreq_ondemand.c:459:1: error: unknown field 'show' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:459:1: error: unknown field 'store' specified in initializer
drivers/cpufreq/cpufreq_ondemand.c:462:2: error: invalid use of undefined type 'struct global_attr'
drivers/cpufreq/cpufreq_ondemand.c:463:2: error: invalid use of undefined type 'struct global_attr'
drivers/cpufreq/cpufreq_ondemand.c:464:2: error: invalid use of undefined type 'struct global_attr'
drivers/cpufreq/cpufreq_ondemand.c:465:2: error: invalid use of undefined type 'struct global_attr'
drivers/cpufreq/cpufreq_ondemand.c:466:2: error: invalid use of undefined type 'struct global_attr'
drivers/cpufreq/cpufreq_ondemand.c:467:2: error: invalid use of undefined type 'struct global_attr'
drivers/cpufreq/cpufreq_ondemand.c:468:2: error: invalid use of undefined type 'struct global_attr'
make[2]: *** No rule to make target `include/linux/gen_stats.h', needed by `Documentation/DocBook/networking.xml'.
make[2]: *** No rule to make target `kernel/kfifo.c', needed by `Documentation/DocBook/kernel-api.xml'.
make[2]: *** No rule to make target `arch/x86/include/asm/atomic_32.h', needed by `Documentation/DocBook/kernel-api.xml'.
make[2]: *** No rule to make target `kernel/sched.c', needed by `Documentation/DocBook/kernel-api.xml'.
make[2]: *** No rule to make target `drivers/base/sys.c', needed by `Documentation/DocBook/kernel-api.xml'.
make[2]: *** No rule to make target `drivers/serial/serial_core.c', needed by `Documentation/DocBook/kernel-api.xml'.
make[2]: *** No rule to make target `drivers/serial/8250.c', needed by `Documentation/DocBook/kernel-api.xml'.
docproc: drivers/tty/serial/8250/8250.c: No such file or directory
drivers/staging/zcache/ramster/ramster.c:970:2: error: implicit declaration of function 'ramster_debugfs_init' [-Werror=implicit-function-declaration]
drivers/cpufreq/cpufreq_conservative.c:279:1: error: variable 'sampling_rate_gov_sys' has initializer but incomplete type
drivers/cpufreq/cpufreq_conservative.c:279:1: error: unknown field 'attr' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:279:1: error: extra brace group at end of initializer
drivers/cpufreq/cpufreq_conservative.c:279:1: error: unknown field 'show' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:279:1: error: unknown field 'store' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:280:1: error: variable 'sampling_down_factor_gov_sys' has initializer but incomplete type
drivers/cpufreq/cpufreq_conservative.c:280:1: error: unknown field 'attr' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:280:1: error: extra brace group at end of initializer
drivers/cpufreq/cpufreq_conservative.c:280:1: error: unknown field 'show' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:280:1: error: unknown field 'store' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:281:1: error: variable 'up_threshold_gov_sys' has initializer but incomplete type
drivers/cpufreq/cpufreq_conservative.c:281:1: error: unknown field 'attr' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:281:1: error: extra brace group at end of initializer
drivers/cpufreq/cpufreq_conservative.c:281:1: error: unknown field 'show' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:281:1: error: unknown field 'store' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:282:1: error: variable 'down_threshold_gov_sys' has initializer but incomplete type
drivers/cpufreq/cpufreq_conservative.c:282:1: error: unknown field 'attr' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:282:1: error: extra brace group at end of initializer
drivers/cpufreq/cpufreq_conservative.c:282:1: error: unknown field 'show' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:282:1: error: unknown field 'store' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:283:1: error: variable 'ignore_nice_gov_sys' has initializer but incomplete type
drivers/cpufreq/cpufreq_conservative.c:283:1: error: unknown field 'attr' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:283:1: error: extra brace group at end of initializer
drivers/cpufreq/cpufreq_conservative.c:283:1: error: unknown field 'show' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:283:1: error: unknown field 'store' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:284:1: error: variable 'freq_step_gov_sys' has initializer but incomplete type
drivers/cpufreq/cpufreq_conservative.c:284:1: error: unknown field 'attr' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:284:1: error: extra brace group at end of initializer
drivers/cpufreq/cpufreq_conservative.c:284:1: error: unknown field 'show' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:284:1: error: unknown field 'store' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:285:1: error: variable 'sampling_rate_min_gov_sys' has initializer but incomplete type
drivers/cpufreq/cpufreq_conservative.c:285:1: error: unknown field 'attr' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:285:1: error: extra brace group at end of initializer
drivers/cpufreq/cpufreq_conservative.c:285:1: error: unknown field 'show' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:285:1: error: unknown field 'store' specified in initializer
drivers/cpufreq/cpufreq_conservative.c:288:2: error: invalid use of undefined type 'struct global_attr'
drivers/cpufreq/cpufreq_conservative.c:289:2: error: invalid use of undefined type 'struct global_attr'
drivers/cpufreq/cpufreq_conservative.c:290:2: error: invalid use of undefined type 'struct global_attr'
drivers/cpufreq/cpufreq_conservative.c:291:2: error: invalid use of undefined type 'struct global_attr'
drivers/cpufreq/cpufreq_conservative.c:292:2: error: invalid use of undefined type 'struct global_attr'
drivers/cpufreq/cpufreq_conservative.c:293:2: error: invalid use of undefined type 'struct global_attr'
drivers/cpufreq/cpufreq_conservative.c:294:2: error: invalid use of undefined type 'struct global_attr'

[warnings]
drivers/cpufreq/ia64-acpi-cpufreq.c:52:3: warning: format '%lx' expects argument of type 'long unsigned int', but argument 4 has type 's64' [-Wformat]
drivers/cpufreq/ia64-acpi-cpufreq.c:74:3: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 's64' [-Wformat]
drivers/cpufreq/cpufreq_ondemand.c:453:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:453:1: warning: (near initialization for 'sampling_rate_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:453:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:453:1: warning: (near initialization for 'sampling_rate_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:453:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:453:1: warning: (near initialization for 'sampling_rate_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:454:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:454:1: warning: (near initialization for 'io_is_busy_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:454:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:454:1: warning: (near initialization for 'io_is_busy_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:454:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:454:1: warning: (near initialization for 'io_is_busy_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:455:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:455:1: warning: (near initialization for 'up_threshold_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:455:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:455:1: warning: (near initialization for 'up_threshold_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:455:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:455:1: warning: (near initialization for 'up_threshold_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:456:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:456:1: warning: (near initialization for 'sampling_down_factor_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:456:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:456:1: warning: (near initialization for 'sampling_down_factor_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:456:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:456:1: warning: (near initialization for 'sampling_down_factor_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:457:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:457:1: warning: (near initialization for 'ignore_nice_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:457:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:457:1: warning: (near initialization for 'ignore_nice_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:457:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:457:1: warning: (near initialization for 'ignore_nice_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:458:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:458:1: warning: (near initialization for 'powersave_bias_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:458:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:458:1: warning: (near initialization for 'powersave_bias_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:458:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:458:1: warning: (near initialization for 'powersave_bias_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:459:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:459:1: warning: (near initialization for 'sampling_rate_min_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:459:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:459:1: warning: (near initialization for 'sampling_rate_min_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:459:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_ondemand.c:459:1: warning: (near initialization for 'sampling_rate_min_gov_sys') [enabled by default]
Warning(lib/crc32.c:141): No description found for parameter 'tab)[256]'
Warning(lib/crc32.c:141): No description found for parameter 'polynomial'
Warning(lib/crc32.c:209): No description found for parameter 'tab)[256]'
Warning(lib/crc32.c:209): No description found for parameter 'polynomial'
Warning(lib/crc32.c): no structured comments found
Warning(include/drm/drm_fb_helper.h:75): No description found for parameter 'initial_config'
drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_pf.c:113:32: warning: 'pf_info.max_remote_ipv6_addrs' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_pf.c:114:31: warning: 'pf_info.max_local_ipv6_addrs' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_pf.c:106:26: warning: 'pf_info.max_tx_vlan_keys' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_pf.c:107:24: warning: 'pf_info.max_rx_ques' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_pf.c:111:27: warning: 'pf_info.max_rx_buf_rings' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_pf.c:112:30: warning: 'pf_info.max_rx_status_rings' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_pf.c:109:34: warning: 'pf_info.max_rx_lro_flow' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_pf.c:110:21: warning: 'pf_info.max_rx_ip_addr' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_pf.c:104:35: warning: 'pf_info.max_rx_ucast_mac_filters' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_pf.c:105:35: warning: 'pf_info.max_rx_mcast_mac_filters' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_pf.c:103:29: warning: 'pf_info.max_tx_mac_filters' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_pf.c:108:24: warning: 'pf_info.max_tx_ques' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/cpufreq/cpufreq_conservative.c:279:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:279:1: warning: (near initialization for 'sampling_rate_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:279:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:279:1: warning: (near initialization for 'sampling_rate_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:279:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:279:1: warning: (near initialization for 'sampling_rate_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:280:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:280:1: warning: (near initialization for 'sampling_down_factor_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:280:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:280:1: warning: (near initialization for 'sampling_down_factor_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:280:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:280:1: warning: (near initialization for 'sampling_down_factor_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:281:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:281:1: warning: (near initialization for 'up_threshold_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:281:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:281:1: warning: (near initialization for 'up_threshold_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:281:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:281:1: warning: (near initialization for 'up_threshold_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:282:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:282:1: warning: (near initialization for 'down_threshold_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:282:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:282:1: warning: (near initialization for 'down_threshold_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:282:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:282:1: warning: (near initialization for 'down_threshold_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:283:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:283:1: warning: (near initialization for 'ignore_nice_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:283:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:283:1: warning: (near initialization for 'ignore_nice_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:283:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:283:1: warning: (near initialization for 'ignore_nice_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:284:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:284:1: warning: (near initialization for 'freq_step_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:284:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:284:1: warning: (near initialization for 'freq_step_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:284:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:284:1: warning: (near initialization for 'freq_step_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:285:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:285:1: warning: (near initialization for 'sampling_rate_min_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:285:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:285:1: warning: (near initialization for 'sampling_rate_min_gov_sys') [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:285:1: warning: excess elements in struct initializer [enabled by default]
drivers/cpufreq/cpufreq_conservative.c:285:1: warning: (near initialization for 'sampling_rate_min_gov_sys') [enabled by default]

[sparse]
drivers/tty/serial/8250/8250_core.c:2790:32: sparse: incorrect type in assignment (different base types)
drivers/tty/serial/8250/8250_core.c:2792:32: sparse: incorrect type in assignment (different address spaces)
kernel/workqueue.c:4434:61: sparse: expression using sizeof bool
net/ieee802154/6lowpan.c:964:23: sparse: context imbalance in 'lowpan_process_data' - different lock contexts for basic block
drivers/net/ieee802154/at86rf230.c:632:60: sparse: incorrect type in argument 3 (different base types)
drivers/net/ieee802154/at86rf230.c:633:60: sparse: restricted __le16 degrades to integer
drivers/net/ieee802154/at86rf230.c:639:56: sparse: incorrect type in argument 3 (different base types)
drivers/net/ieee802154/at86rf230.c:640:56: sparse: restricted __le16 degrades to integer
drivers/acpi/acpica_sys.c:33:20: sparse: symbol 'acpi_chronos' was not declared. Should it be static?
drivers/block/nvme-core.c:933:35: sparse: restricted __le16 degrades to integer
drivers/block/nvme-core.c:933:66: sparse: incorrect type in initializer (different base types)
drivers/block/nvme-core.c:1224:21: sparse: incorrect type in assignment (different base types)
drivers/block/nvme-core.c:1225:21: sparse: incorrect type in assignment (different base types)
drivers/block/nvme-core.c:1226:21: sparse: incorrect type in assignment (different base types)
drivers/block/nvme-core.c:1227:22: sparse: incorrect type in assignment (different base types)
drivers/block/nvme-core.c:1266:26: sparse: incorrect type in assignment (different base types)
drivers/block/nvme-core.c:1267:26: sparse: incorrect type in assignment (different base types)
drivers/block/nvme-core.c:1268:27: sparse: incorrect type in assignment (different base types)
drivers/block/nvme-core.c:1269:27: sparse: incorrect type in assignment (different base types)
drivers/block/nvme-core.c:1270:27: sparse: incorrect type in assignment (different base types)
drivers/block/nvme-core.c:1271:27: sparse: incorrect type in assignment (different base types)
drivers/block/nvme-core.c:1272:27: sparse: incorrect type in assignment (different base types)
drivers/block/nvme-core.c:1273:27: sparse: incorrect type in assignment (different base types)
drivers/block/nvme-scsi.c:387:51: sparse: typename in expression
drivers/block/nvme-scsi.c:400:35: sparse: typename in expression
drivers/block/nvme-scsi.c:424:41: sparse: typename in expression
drivers/block/nvme-scsi.c:437:41: sparse: typename in expression
drivers/block/nvme-scsi.c:472:34: sparse: typename in expression
drivers/block/nvme-scsi.c:2932:26: sparse: typename in expression
kernel/events/persistent.c:8:1: sparse: symbol '__pcpu_scope_pers_events' was not declared. Should it be static?
kernel/events/persistent.c:8:1: sparse: symbol 'pers_events' was not declared. Should it be static?
kernel/events/persistent.c:30:9: sparse: incorrect type in assignment (different address spaces)
kernel/events/persistent.c:73:17: sparse: incorrect type in assignment (different address spaces)
drivers/gpu/drm/nouveau/core/subdev/vm/nvc0.c:42:10: sparse: symbol 'nvc0_pte_storage_type_map' was not declared. Should it be static?
drivers/block/nvme-scsi.c:387:58: sparse: Expected ) in function call
drivers/block/nvme-scsi.c:387:58: sparse: got sgl
drivers/block/nvme-scsi.c:400:42: sparse: got hdr
drivers/block/nvme-scsi.c:2932:33: sparse: got u_hdr
drivers/block/nvme-scsi.c:387:51: sparse: undefined identifier '__attribute__'
drivers/cpufreq/cpufreq_ondemand.c:462:1: sparse: unknown field name in initializer
drivers/cpufreq/cpufreq_ondemand.c:471:35: sparse: using member 'attr' in incomplete struct global_attr
drivers/cpufreq/cpufreq_conservative.c:286:1: sparse: unknown field name in initializer
drivers/cpufreq/cpufreq_conservative.c:295:35: sparse: using member 'attr' in incomplete struct global_attr
drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c:141:33: sparse: symbol 'stmmac_ptp' was not declared. Should it be static?

[smatch]
drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c:305 qlcnic_sriov_post_bc_msg() warn: inconsistent returns spin_lock:&adapter->ahw->mbx_lock: locked (227,236) unlocked (305)
drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c:305 qlcnic_sriov_post_bc_msg() warn: inconsistent returns spin_lock:&ahw->mbx_lock: locked (305) unlocked (227,236)
drivers/net/ethernet/qlogic/qlcnic/qlcnic_hw.c:563 qlcnic_set_multi() error: potential null dereference 'cur'.  (kzalloc returns null)

[coccinelle]
fs/gfs2/glock.c:323:3-9: preceding lock on line 307
fs/gfs2/glock.c:326:1-7: preceding lock on line 307
fs/inode.c:767:2-11: second lock on line 767
fs/inode.c:795:2-11: second lock on line 795
fs/inode.c:776:1-7: preceding lock on line 767
fs/inode.c:804:1-7: preceding lock on line 795
fs/inode.c:1336:3-9: preceding lock on line 1323
fs/inode.c:1380:3-9: preceding lock on line 1367
mm/huge_memory.c:1145:3-9: preceding lock on line 1136
arch/x86/kvm/mmu.c:2752:2-12: code aligned with following code on line 2760
mm/vmscan.c:3131:8-15: ERROR: PTR_ERR applied after initialization to constant on line 3129
arch/x86/kernel/cpu/mcheck/mce.c:1425:3-24: code aligned with following code on line 1431
fs/xfs/xfs_qm.c:656:2-20: code aligned with following code on line 657
kernel/workqueue.c:1451:22-28: ERROR: invalid reference to the index variable of the iterator on line 1414

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
