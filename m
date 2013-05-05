From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 05 May 2013 12:50:30 +0000
Subject: build regressions 2013-05-04
Message-Id: <51865596.AUxJNA0HZ4yopazD%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/dma/dmatest.c:575: error: implicit declaration of function 'arm_iommu_detach_device'
kernel/rcutree_plugin.h:1709:2: error: implicit declaration of function 'is_nocb_cpu' [-Werror=implicit-function-declaration]
drivers/gator/gator.h:80:3: error: #error Kernels prior to 2.6.32 not supported
drivers/gator/gator_events_block.c:31:39: error: expected ')' before 'struct'
drivers/gator/gator_events_block.c:82:3: error: implicit declaration of function 'GATOR_REGISTER_TRACE' [-Werror=implicit-function-declaration]
drivers/gator/gator_events_block.c:82:28: error: 'block_rq_complete' undeclared (first use in this function)
drivers/gator/gator_events_block.c:98:3: error: implicit declaration of function 'GATOR_UNREGISTER_TRACE' [-Werror=implicit-function-declaration]
drivers/gator/gator_events_block.c:98:26: error: 'block_rq_complete' undeclared (first use in this function)
drivers/gator/gator.h:80:3: error: #error Kernels prior to 2.6.32 not supported
drivers/gator/gator.h:80:3: error: #error Kernels prior to 2.6.32 not supported
drivers/gator/gator_events_meminfo.c:34:41: error: expected ')' before 'struct'
drivers/gator/gator_events_meminfo.c:43:37: error: expected ')' before 'struct'
drivers/gator/gator_events_meminfo.c:51:35: error: expected ')' before 'struct'
drivers/gator/gator_events_meminfo.c:100:2: error: implicit declaration of function 'GATOR_REGISTER_TRACE' [-Werror=implicit-function-declaration]
drivers/gator/gator_events_meminfo.c:100:27: error: 'mm_page_free_direct' undeclared (first use in this function)
drivers/gator/gator_events_meminfo.c:106:27: error: 'mm_pagevec_free' undeclared (first use in this function)
drivers/gator/gator_events_meminfo.c:111:27: error: 'mm_page_alloc' undeclared (first use in this function)
drivers/gator/gator_events_meminfo.c:119:2: error: implicit declaration of function 'GATOR_UNREGISTER_TRACE' [-Werror=implicit-function-declaration]
drivers/gator/gator_events_meminfo.c:139:26: error: 'mm_page_free_direct' undeclared (first use in this function)
drivers/gator/gator_events_meminfo.c:140:26: error: 'mm_pagevec_free' undeclared (first use in this function)
drivers/gator/gator_events_meminfo.c:145:26: error: 'mm_page_alloc' undeclared (first use in this function)
drivers/gator/gator.h:80:3: error: #error Kernels prior to 2.6.32 not supported
drivers/gator/gator_events_net.c:36:16: error: too few arguments to function 'dev_get_stats'
drivers/gator/gator.h:80:3: error: #error Kernels prior to 2.6.32 not supported
drivers/gator/gator_events_sched.c:22:34: error: expected ')' before 'struct'
drivers/gator/gator_events_sched.c:55:3: error: implicit declaration of function 'GATOR_REGISTER_TRACE' [-Werror=implicit-function-declaration]
drivers/gator/gator_events_sched.c:55:28: error: 'sched_switch' undeclared (first use in this function)
drivers/gator/gator_events_sched.c:71:3: error: implicit declaration of function 'GATOR_UNREGISTER_TRACE' [-Werror=implicit-function-declaration]
drivers/gator/gator_events_sched.c:71:26: error: 'sched_switch' undeclared (first use in this function)
drivers/gator/gator.h:80:3: error: #error Kernels prior to 2.6.32 not supported
drivers/gator/gator_events_irq.c:25:6: error: expected ')' before 'int'
drivers/gator/gator_events_irq.c:31:34: error: expected ')' before 'struct'
drivers/gator/gator_events_irq.c:89:3: error: implicit declaration of function 'GATOR_REGISTER_TRACE' [-Werror=implicit-function-declaration]
drivers/gator/gator_events_irq.c:89:28: error: 'irq_handler_exit' undeclared (first use in this function)
drivers/gator/gator_events_irq.c:92:28: error: 'softirq_exit' undeclared (first use in this function)
drivers/gator/gator_events_irq.c:101:3: error: implicit declaration of function 'GATOR_UNREGISTER_TRACE' [-Werror=implicit-function-declaration]
drivers/gator/gator_events_irq.c:111:26: error: 'irq_handler_exit' undeclared (first use in this function)
drivers/gator/gator_events_irq.c:113:26: error: 'softirq_exit' undeclared (first use in this function)
drivers/gator/gator_main.c:32:2: error: #error kernels prior to 2.6.32 are not supported
drivers/gator/gator_trace_sched.c:140:34: error: expected ')' before 'struct'
drivers/gator/gator_trace_sched.c:148:40: error: expected ')' before 'struct'
drivers/gator/gator_trace_sched.c:162:2: error: implicit declaration of function 'GATOR_REGISTER_TRACE' [-Werror=implicit-function-declaration]
drivers/gator/gator_trace_sched.c:162:27: error: 'sched_switch' undeclared (first use in this function)
drivers/gator/gator_trace_sched.c:164:27: error: 'sched_process_exit' undeclared (first use in this function)
drivers/gator/gator_trace_sched.c:176:2: error: implicit declaration of function 'GATOR_UNREGISTER_TRACE' [-Werror=implicit-function-declaration]
drivers/gator/gator_trace_sched.c:205:25: error: 'sched_switch' undeclared (first use in this function)
drivers/gator/gator_trace_sched.c:206:25: error: 'sched_process_exit' undeclared (first use in this function)

[warnings]
arch/x86/kernel/cpu/perf_event_intel_lbr.c:323:4: warning: 'return' with a value, in function returning void [enabled by default]
drivers/cpufreq/cpufreq_interactive.c:250:15: warning: 'now' is used uninitialized in this function [-Wuninitialized]
drivers/gpu/drm/i915/intel_display.c:5909:27: warning: unused variable 'dev_priv' [-Wunused-variable]

[coccinelle]
drivers/i2c/busses/i2c-s3c2410.c:1050:2-8: Replace memcpy with struct assignment
drivers/i2c/busses/i2c-s3c2410.c:1050:2-8: Replace memcpy with struct assignment

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
