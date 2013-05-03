From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 03 May 2013 16:39:20 +0000
Subject: build regressions 2013-05-03
Message-Id: <5183e838.1EwWxs5pFiHw9CvO%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/wait.c:213: error: unknown field 'flags' specified in initializer
kernel/wait.c:244: error: unknown field 'flags' specified in initializer
kernel/wait.c:252: error: unknown field 'flags' specified in initializer
kernel/wait.c:354: error: unknown field 'atomic_val' specified in initializer
fs/inode.c:1717: error: unknown field 'flags' specified in initializer
fs/inode.c:1859: error: unknown field 'flags' specified in initializer
fs/fs-writeback.c:340: error: unknown field 'flags' specified in initializer
fs/jbd/transaction.c:637: error: unknown field 'flags' specified in initializer
fs/jbd2/transaction.c:751: error: unknown field 'flags' specified in initializer
fs/jbd2/journal.c:2489: error: unknown field 'flags' specified in initializer
mm/filemap.c:539: error: unknown field 'flags' specified in initializer
mm/filemap.c:549: error: unknown field 'flags' specified in initializer
mm/filemap.c:620: error: unknown field 'flags' specified in initializer
mm/filemap.c:629: error: unknown field 'flags' specified in initializer
net/sunrpc/sched.c:290: error: unknown field 'flags' specified in initializer
kernel/sched/core.c:2589:41: error: 'struct cfs_rq' has no member named 'runnable_load_avg'
drivers/acpi/acpi_processor.c:177:2: error: implicit declaration of function 'acpi_map_lsapic' [-Werror=implicit-function-declaration]
drivers/acpi/acpi_processor.c:181:2: error: implicit declaration of function 'arch_register_cpu' [-Werror=implicit-function-declaration]
drivers/acpi/acpi_processor.c:183:3: error: implicit declaration of function 'acpi_unmap_lsapic' [-Werror=implicit-function-declaration]
drivers/acpi/acpi_processor.c:440:2: error: implicit declaration of function 'arch_unregister_cpu' [-Werror=implicit-function-declaration]
drivers/base/cpu.c:33:14: error: 'cpu' undeclared (first use in this function)
net/ipv6/af_inet6.c:106:2: error: incompatible type for argument 1 of 'in_egroup_p'
net/ipv6/af_inet6.c:107:3: error: incompatible type for argument 1 of 'in_egroup_p'
net/ipv6/af_inet6.c:111:2: error: incompatible type for argument 1 of 'in_egroup_p'
net/ipv6/af_inet6.c:111:2: error: incompatible type for argument 1 of 'in_egroup_p'
net/ipv6/af_inet6.c:111:2: error: incompatible type for argument 1 of 'in_egroup_p'
kernel/sched/core.c:7692:18: error: invalid operands to binary != (have 'kuid_t' and 'kuid_t')
kernel/sched/core.c:7692:46: error: invalid operands to binary != (have 'kuid_t' and 'kuid_t')
fs/proc/base.c:984:7: error: incompatible types when assigning to type 'uid_t' from type 'kuid_t'
fs/proc/base.c:992:28: error: invalid operands to binary = (have 'kuid_t' and 'int')
net/ipv4/af_inet.c:277:2: error: incompatible type for argument 1 of 'in_egroup_p'
net/ipv4/af_inet.c:278:3: error: incompatible type for argument 1 of 'in_egroup_p'
net/ipv4/af_inet.c:282:2: error: incompatible type for argument 1 of 'in_egroup_p'
security/commoncap.c:85:2: error: incompatible type for argument 1 of 'in_egroup_p'
security/commoncap.c:87:2: error: incompatible type for argument 1 of 'in_egroup_p'
suspend.c:(.text+0x25775): undefined reference to `rtc_time_to_tm'
drivers/gator/gator_main.c:25:28: fatal error: asm/stacktrace.h: No such file or directory
fs/fscache/object.c:322:2: error: implicit declaration of function 'prefetch' [-Werror=implicit-function-declaration]
drivers/base/power/main.c:1114:2: error: implicit declaration of function 'get_current' [-Werror=implicit-function-declaration]
drivers/staging/android/ashmem.h:37:2: error: unknown type name 'compat_size_t'
drivers/staging/android/ashmem.h:38:2: error: unknown type name 'compat_size_t'
drivers/staging/android/ashmem.c:693:7: error: 'compat_size_t' undeclared (first use in this function)
(.text+0x575d2): undefined reference to `in6addr_any'
(.text+0x575d9): undefined reference to `in6addr_any'
(.text+0x57720): undefined reference to `rt6_lookup'

[warnings]
kernel/wait.c:213: warning: missing braces around initializer
kernel/wait.c:213: warning: (near initialization for 'wait.key.<anonymous>')
kernel/wait.c:244: warning: missing braces around initializer
kernel/wait.c:244: warning: (near initialization for 'wait.key.<anonymous>')
kernel/wait.c:252: warning: missing braces around initializer
kernel/wait.c:252: warning: (near initialization for 'key.<anonymous>')
kernel/wait.c:354: warning: missing braces around initializer
kernel/wait.c:354: warning: (near initialization for 'wait.key.<anonymous>')
fs/inode.c:1717: warning: missing braces around initializer
fs/inode.c:1717: warning: (near initialization for 'wait.key.<anonymous>')
fs/inode.c:1859: warning: missing braces around initializer
fs/inode.c:1859: warning: (near initialization for 'q.key.<anonymous>')
fs/fs-writeback.c:340: warning: missing braces around initializer
fs/fs-writeback.c:340: warning: (near initialization for 'wq.key.<anonymous>')
fs/jbd/transaction.c:637: warning: missing braces around initializer
fs/jbd/transaction.c:637: warning: (near initialization for 'wait.key.<anonymous>')
fs/jbd2/transaction.c:751: warning: missing braces around initializer
fs/jbd2/transaction.c:751: warning: (near initialization for 'wait.key.<anonymous>')
fs/jbd2/journal.c:2489: warning: missing braces around initializer
fs/jbd2/journal.c:2489: warning: (near initialization for 'wait.key.<anonymous>')
mm/filemap.c:539: warning: missing braces around initializer
mm/filemap.c:539: warning: (near initialization for 'wait.key.<anonymous>')
mm/filemap.c:549: warning: missing braces around initializer
mm/filemap.c:549: warning: (near initialization for 'wait.key.<anonymous>')
mm/filemap.c:620: warning: missing braces around initializer
mm/filemap.c:620: warning: (near initialization for 'wait.key.<anonymous>')
mm/filemap.c:629: warning: missing braces around initializer
mm/filemap.c:629: warning: (near initialization for 'wait.key.<anonymous>')
net/sunrpc/sched.c:290: warning: missing braces around initializer
net/sunrpc/sched.c:290: warning: (near initialization for 'k.<anonymous>')
WARNING: drivers/acpi/processor.o(.data+0x0): Section mismatch in reference from the variable acpi_cpu_notifier to the function .cpuinit.text:acpi_cpu_soft_notify()
WARNING: drivers/acpi/acpi.o(.data+0x49c): Section mismatch in reference from the variable processor_handler to the function .cpuinit.text:acpi_processor_add()
include/net/ipv6.h:401:23: warning: 'in6' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/hid/hid-magicmouse.c:561:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/hid/hid-magicmouse.c:561:2: warning: (near initialization for 'magicmouse_driver.input_configured') [enabled by default]
drivers/hid/hid-ntrig.c:1025:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/hid/hid-ntrig.c:1025:2: warning: (near initialization for 'ntrig_driver.input_configured') [enabled by default]
mm/vmscan.c:169:8: warning: unused variable 'name' [-Wunused-variable]
fs/proc/base.c:992:2: warning: 'uid' may be used uninitialized in this function [-Wmaybe-uninitialized]
usr/include/linux/netfilter/xt_socket.h:14: userspace cannot reference function or variable defined in the kernel
WARNING: vmlinux.o(.text+0x1e87c2): Section mismatch in reference from the function cpu_subsys_online() to the function .cpuinit.text:cpu_up()
net/ipv6/af_inet6.c:108:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/af_inet.c:279:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/base/power/main.c:1114:11: warning: assignment makes pointer from integer without a cast [enabled by default]

[coccinelle]
drivers/spi/spi_opencores.c:608:6-29: INFO: devm_request_mem_region followed by ioremap on line 613 can be replaced by devm_request_and_ioremap
drivers/spi/spi_opencores.c:520:21-22: ERROR: iterator variable bound on line 510 cannot be NULL
drivers/char/scet.c:266:6-29: INFO: devm_request_mem_region followed by ioremap on line 272 can be replaced by devm_request_and_ioremap
drivers/usb/host/ohs900-hcd.c:1610:6-29: INFO: devm_request_mem_region followed by ioremap on line 1617 can be replaced by devm_request_and_ioremap
drivers/usb/host/ohs900-hcd.c:1610:6-29: INFO: devm_request_mem_region followed by ioremap on line 1617 can be replaced by devm_request_and_ioremap

[cppcheck]
drivers/gator/gator_events_mali_400.c:15: information: Include file: "linux/mali_linux_trace.h" not found.
drivers/gator/gator_main.c:36: error: gator requires the kernel to have CONFIG_GENERIC_TRACER or CONFIG_TRACING defined
drivers/gator/gator_main.c:40: error: gator requires the kernel to have CONFIG_PROFILING defined
drivers/gator/gator_main.c:44: error: gator requires the kernel to have CONFIG_HIGH_RES_TIMERS defined to support PC sampling
drivers/gator/gator_trace_gpu.c:17: information: Include file: "linux/mali_linux_trace.h" not found.
drivers/gator/gator_events_mali_400.c:15: information: Include file: "linux/mali_linux_trace.h" not found.
drivers/gator/gator_main.c:36: error: gator requires the kernel to have CONFIG_GENERIC_TRACER or CONFIG_TRACING defined
drivers/gator/gator_main.c:40: error: gator requires the kernel to have CONFIG_PROFILING defined
drivers/gator/gator_main.c:44: error: gator requires the kernel to have CONFIG_HIGH_RES_TIMERS defined to support PC sampling
drivers/gator/gator_trace_gpu.c:17: information: Include file: "linux/mali_linux_trace.h" not found.

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
