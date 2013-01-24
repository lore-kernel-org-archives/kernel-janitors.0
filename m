From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 24 Jan 2013 16:46:27 +0000
Subject: build regressions 2013-01-24
Message-Id: <51016563.FUsmlg9X4sSXhZv/%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/tty/serial/serial-tegra.c:46:22: fatal error: mach/clk.h: No such file or directory
rmi_i2c.c:(.text+0xfbe822): undefined reference to `rmi_unregister_phys_device'
rmi_i2c.c:(.text+0xfbe9c8): undefined reference to `rmi_register_phys_device'
rmi_bus.c:(.init.text+0x59165): undefined reference to `rmi_register_f01_handler'
rmi_bus.c:(.init.text+0x591ad): undefined reference to `rmi_unregister_f01_handler'
net/ipv6/inet6_connection_sock.c:37:12: error: incompatible types when initializing type 'int' using type 'kuid_t'
net/ipv6/inet6_connection_sock.c:54:30: error: incompatible type for argument 1 of 'uid_eq'
arch/x86/kvm/emulate.c:970: Error: unsupported for `push'
net/ipv4/inet_connection_sock.c:232:16: error: incompatible types when assigning to type 'kuid_t' from type 'int'
drivers/input/rmi4/rmi_driver.c:1194:8: error: 'rmi_driver_suspend' undeclared here (not in a function)
drivers/input/rmi4/rmi_driver.c:1194:8: error: 'rmi_driver_resume' undeclared here (not in a function)
drivers/staging/comedi/drivers/pcl812.c:883:3: error: implicit declaration of function 'set_dma_mode' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl812.c:883:30: error: 'DMA_MODE_READ' undeclared (first use in this function)
drivers/staging/comedi/drivers/pcl812.c:884:3: error: implicit declaration of function 'claim_dma_lock' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl812.c:885:3: error: implicit declaration of function 'clear_dma_ff' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl812.c:886:3: error: implicit declaration of function 'set_dma_addr' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl812.c:887:3: error: implicit declaration of function 'set_dma_count' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl812.c:888:3: error: implicit declaration of function 'release_dma_lock' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl812.c:889:3: error: implicit declaration of function 'enable_dma' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl812.c:1025:2: error: implicit declaration of function 'disable_dma' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl812.c:1089:3: error: implicit declaration of function 'get_dma_residue' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl818.c:574:2: error: implicit declaration of function 'disable_dma' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl818.c:577:3: error: implicit declaration of function 'set_dma_mode' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl818.c:577:30: error: 'DMA_MODE_READ' undeclared (first use in this function)
drivers/staging/comedi/drivers/pcl818.c:578:3: error: implicit declaration of function 'claim_dma_lock' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl818.c:579:3: error: implicit declaration of function 'set_dma_addr' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl818.c:582:4: error: implicit declaration of function 'set_dma_count' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl818.c:587:3: error: implicit declaration of function 'release_dma_lock' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl818.c:588:3: error: implicit declaration of function 'enable_dma' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl818.c:894:2: error: implicit declaration of function 'clear_dma_ff' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl816.c:370:2: error: implicit declaration of function 'disable_dma' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl816.c:376:3: error: implicit declaration of function 'set_dma_mode' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl816.c:376:30: error: 'DMA_MODE_READ' undeclared (first use in this function)
drivers/staging/comedi/drivers/pcl816.c:377:3: error: implicit declaration of function 'claim_dma_lock' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl816.c:379:3: error: implicit declaration of function 'set_dma_addr' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl816.c:382:4: error: implicit declaration of function 'set_dma_count' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl816.c:387:3: error: implicit declaration of function 'release_dma_lock' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl816.c:388:3: error: implicit declaration of function 'enable_dma' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl816.c:673:3: error: implicit declaration of function 'clear_dma_ff' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/pcl816.c:712:3: error: implicit declaration of function 'get_dma_residue' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/das1800.c:581:3: error: implicit declaration of function 'claim_dma_lock' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/das1800.c:582:3: error: implicit declaration of function 'disable_dma' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/das1800.c:583:3: error: implicit declaration of function 'set_dma_mode' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/das1800.c:583:31: error: 'DMA_MODE_READ' undeclared (first use in this function)
drivers/staging/comedi/drivers/das1800.c:588:3: error: implicit declaration of function 'release_dma_lock' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/das1800.c:975:2: error: implicit declaration of function 'set_dma_addr' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/das1800.c:977:2: error: implicit declaration of function 'set_dma_count' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/das1800.c:978:2: error: implicit declaration of function 'enable_dma' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/das1800.c:1036:2: error: implicit declaration of function 'clear_dma_ff' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/das1800.c:1039:2: error: implicit declaration of function 'get_dma_residue' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/das16.c:957:2: error: implicit declaration of function 'claim_dma_lock' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/das16.c:958:2: error: implicit declaration of function 'disable_dma' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/das16.c:961:2: error: implicit declaration of function 'clear_dma_ff' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/das16.c:963:2: error: implicit declaration of function 'set_dma_addr' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/das16.c:967:2: error: implicit declaration of function 'set_dma_count' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/das16.c:968:2: error: implicit declaration of function 'enable_dma' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/das16.c:969:2: error: implicit declaration of function 'release_dma_lock' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/das16.c:1179:2: error: implicit declaration of function 'get_dma_residue' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/das16.c:1484:3: error: implicit declaration of function 'set_dma_mode' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/das16.c:1484:35: error: 'DMA_MODE_READ' undeclared (first use in this function)
drivers/staging/comedi/drivers/ni_at_a2150.c:253:2: error: implicit declaration of function 'claim_dma_lock' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/ni_at_a2150.c:254:2: error: implicit declaration of function 'disable_dma' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/ni_at_a2150.c:257:2: error: implicit declaration of function 'clear_dma_ff' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/ni_at_a2150.c:265:2: error: implicit declaration of function 'get_dma_residue' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/ni_at_a2150.c:302:3: error: implicit declaration of function 'set_dma_addr' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/ni_at_a2150.c:303:3: error: implicit declaration of function 'set_dma_count' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/ni_at_a2150.c:304:3: error: implicit declaration of function 'enable_dma' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/ni_at_a2150.c:306:2: error: implicit declaration of function 'release_dma_lock' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/ni_at_a2150.c:396:3: error: implicit declaration of function 'set_dma_mode' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/ni_at_a2150.c:396:21: error: 'DMA_MODE_READ' undeclared (first use in this function)
drivers/staging/comedi/drivers/dt282x.c:460:2: error: implicit declaration of function 'disable_dma' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/dt282x.c:546:2: error: implicit declaration of function 'set_dma_mode' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/dt282x.c:546:25: error: 'DMA_MODE_READ' undeclared (first use in this function)
drivers/staging/comedi/drivers/dt282x.c:547:2: error: implicit declaration of function 'claim_dma_lock' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/dt282x.c:548:2: error: implicit declaration of function 'clear_dma_ff' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/dt282x.c:549:2: error: implicit declaration of function 'set_dma_addr' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/dt282x.c:550:2: error: implicit declaration of function 'set_dma_count' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/dt282x.c:551:2: error: implicit declaration of function 'release_dma_lock' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/dt282x.c:553:2: error: implicit declaration of function 'enable_dma' [-Werror=implicit-function-declaration]
drivers/staging/comedi/drivers/dt282x.c:568:25: error: 'DMA_MODE_WRITE' undeclared (first use in this function)
mm/nommu.c:1909:11: error: 'nr_swap_pages' undeclared (first use in this function)
arch/mips/include/uapi/asm/socket.h:94:2: error: #endif without #if
arch/sparc/mm/init_32.c:60:23: error: invalid operands to binary << (have 'atomic_long_t' and 'int')
drivers/leds/leds-lp5521.c:615:6: error: 'lp5521_led_attribute_group' undeclared (first use in this function)
drivers/leds/leds-lp5523.c:670:6: error: 'lp5523_led_attribute_group' undeclared (first use in this function)
kernel/sched/core.c:8152:25: error: 'struct task_group' has no member named 'se'
evm_crypto.c:(.text+0x3b0): multiple definition of `asymmetric_verify'
security/integrity/evm/evm_main.o:evm_main.c:(.text+0x580): first defined here
security/integrity/ima/ima_fs.o:ima_fs.c:(.text+0x433): first defined here

[warnings]
drivers/gpu/drm/i915/i915_gem.c:3170:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' [-Wformat]
drivers/media/tuners/tda18218.c:306:3: warning: 'val' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/x86/platform/olpc/olpc-xo15-sci.c:232:3: warning: initialization from incompatible pointer type [enabled by default]
arch/x86/platform/olpc/olpc-xo15-sci.c:232:3: warning: (near initialization for 'xo15_sci_drv.ops.remove') [enabled by default]
drivers/char/tpm/tpm_ibmvtpm.c:401:8: warning: return type defaults to 'int' [-Wreturn-type]
drivers/char/tpm/tpm_ibmvtpm.c:449:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/char/tpm/tpm_ibmvtpm.c:449:2: warning: (near initialization for 'tpm_ibmvtpm.req_canceled') [enabled by default]
arch/tile/mm/pgtable.c:47:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 13 has type 'atomic_long_t' [-Wformat]
drivers/leds/leds-lp5521.c:698:2: warning: passing argument 1 of 'lp5521_post_init_device' from incompatible pointer type [enabled by default]
drivers/leds/leds-lp5523.c:893:2: warning: passing argument 1 of 'lp5523_post_init_device' from incompatible pointer type [enabled by default]
drivers/md/dm-raid.c:399:53: warning: 'rebuilds_per_group' may be used uninitialized in this function [-Wmaybe-uninitialized]
WARNING: vmlinux.o(.text+0x43773): Section mismatch in reference from the function acpi_unmap_lsapic() to the variable .cpuinit.data:__apicid_to_node
drivers/leds/leds-lp5521.c:915:1: warning: label 'fail1' defined but not used [-Wunused-label]
drivers/leds/leds-lp5521.c:703:31: warning: 'old_chip' may be used uninitialized in this function [-Wuninitialized]
drivers/leds/leds-lp5523.c:962:31: warning: 'old_chip' may be used uninitialized in this function [-Wuninitialized]
drivers/leds/leds-lp55xx-common.c:62:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/leds/leds-lp5521.c:711:1: warning: label 'err' defined but not used [-Wunused-label]
drivers/leds/leds-lp5523.c:903:1: warning: label 'err' defined but not used [-Wunused-label]
drivers/leds/leds-lp5523.c:947:1: warning: label 'fail1' defined but not used [-Wunused-label]
drivers/leds/leds-lp5523.c:716:23: warning: unused variable 'old_chip' [-Wunused-variable]
drivers/leds/leds-lp5521.c:392:16: warning: 'status' may be used uninitialized in this function [-Wmaybe-uninitialized]
security/integrity/integrity.h:109:9: warning: 'struct key' declared inside parameter list [enabled by default]
security/integrity/integrity.h:109:9: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
security/integrity/digsig_asymmetric.c:102:2: warning: passing argument 2 of 'mpi_read_from_buffer' from incompatible pointer type [enabled by default]
drivers/md/dm-integrity.c:278:2: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 4 has type 'sector_t' [-Wformat]
mm/memory_hotplug.c:1092:30: warning: the comparison will always evaluate as 'false' for the address of 'contig_page_data' will never be NULL [-Waddress]

[sparse]
net/ipv4/udp.c:432:60: sparse: cast from restricted __be16
net/ipv4/udp.c:432:60: sparse: incorrect type in argument 1 (different base types)
drivers/input/rmi4/rmi_bus.c:93:20: sparse: symbol 'rmi_device_type' was not declared. Should it be static?
drivers/input/rmi4/rmi_bus.c:139:5: sparse: symbol 'rmi_register_physical_device' was not declared. Should it be static?
drivers/input/rmi4/rmi_bus.c:206:20: sparse: symbol 'rmi_function_type' was not declared. Should it be static?
drivers/char/hw_random/exynos-rng.c:126:30: sparse: incorrect type in argument 1 (different address spaces)
drivers/input/rmi4/rmi_bus.c:184:6: sparse: symbol 'rmi_unregister_physical_device' was not declared. Should it be static?
kernel/rcupdate.c:428:5: sparse: symbol 'rcu_cpu_stall_timeout' was not declared. Should it be static?

[smatch]
drivers/char/tpm/tpm_i2c_stm_st33.c:485 tpm_stm_i2c_send() warn: unsigned 'ret' is never less than zero.
drivers/char/tpm/tpm_i2c_stm_st33.c:723 tpm_st33_i2c_probe() warn: unsigned 'err' is never less than zero.
kernel/trace/trace_functions.c:75 function_trace_call() warn: unsigned 'bit' is never less than zero.
drivers/thermal/intel_powerclamp.c:275 get_compensation() error: buffer overflow 'cal_data' 50 <= 50

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
