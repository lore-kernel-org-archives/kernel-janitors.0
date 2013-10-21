From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 21 Oct 2013 10:54:57 +0000
Subject: build regressions 2013-10-20
Message-Id: <52650801.Zw4mNUu+2twMymUw%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/tty/serial/xilinx_uartps.c:436:7: error: 'PRE_RATE_CHANGE' undeclared (first use in this function)
drivers/tty/serial/xilinx_uartps.c:446:36: error: dereferencing pointer to incomplete type
drivers/tty/serial/xilinx_uartps.c:461:7: error: 'POST_RATE_CHANGE' undeclared (first use in this function)
drivers/tty/serial/xilinx_uartps.c:470:24: error: dereferencing pointer to incomplete type
drivers/tty/serial/xilinx_uartps.c:475:7: error: 'ABORT_RATE_CHANGE' undeclared (first use in this function)
drivers/tty/serial/xilinx_uartps.c:1272:2: error: implicit declaration of function 'clk_notifier_register' [-Werror=implicit-function-declaration]
drivers/tty/serial/xilinx_uartps.c:1305:2: error: implicit declaration of function 'clk_notifier_unregister' [-Werror=implicit-function-declaration]
drivers/tty/serial/xilinx_uartps.c:1227:21: error: 'xuartps_uart_driver' undeclared (first use in this function)
drivers/tty/serial/xilinx_uartps.c:1308:27: error: 'xuartps_uart_driver' undeclared (first use in this function)
drivers/gpio/devres.c:72:3: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
drivers/gpio/devres.c:75:2: error: implicit declaration of function 'IS_ERR' [-Werror=implicit-function-declaration]
drivers/gpio/devres.c:26:2: error: implicit declaration of function 'gpiod_put' [-Werror=implicit-function-declaration]
drivers/gpio/devres.c:48:2: error: implicit declaration of function 'devm_gpiod_get_index' [-Werror=implicit-function-declaration]
drivers/gpio/devres.c:62:32: error: conflicting types for 'devm_gpiod_get_index'
drivers/gpio/devres.c:74:2: error: implicit declaration of function 'gpiod_get_index' [-Werror=implicit-function-declaration]

[warnings]
Warning(mm/page_alloc.c:706): No description found for parameter 'order'
Warning(mm/page_alloc.c:816): No description found for parameter 'order'
drivers/tty/serial/xilinx_uartps.c:1309:1: warning: control reaches end of non-void function [-Wreturn-type]
net/ipv4/syncookies.c:41:2: warning: passing argument 4 of '__net_get_random_once' from incompatible pointer type [enabled by default]
net/ipv6/syncookies.c:68:2: warning: passing argument 4 of '__net_get_random_once' from incompatible pointer type [enabled by default]
net/ipv6/udp.c:67:2: warning: passing argument 4 of '__net_get_random_once' from incompatible pointer type [enabled by default]
net/ipv6/udp.c:69:2: warning: passing argument 4 of '__net_get_random_once' from incompatible pointer type [enabled by default]
net/ipv4/tcp_fastopen.c:27:6: warning: passing argument 4 of '__net_get_random_once' from incompatible pointer type [enabled by default]
include/linux/jump_label.h:182:40: warning: passing argument 4 of '__net_get_random_once' from incompatible pointer type [enabled by default]
drivers/gpio/devres.c:48:2: warning: return makes pointer from integer without a cast [enabled by default]
drivers/gpio/devres.c:74:7: warning: assignment makes pointer from integer without a cast [enabled by default]
include/linux/net.h:243:14: warning: 'struct static_key' declared inside parameter list [enabled by default]
include/linux/net.h:243:14: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]

[sparse]
kernel/time/tick-sched.c:396:9: sparse: cast to non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast from non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast to non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast from non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast to non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast from non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast to non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast from non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast to non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast from non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast to non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast from non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast to non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast from non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast to non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast from non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast to non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast from non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast to non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast from non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast to non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast from non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast to non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast from non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast to non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast from non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast to non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast from non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast to non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast from non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast to non-scalar
kernel/time/tick-sched.c:396:9: sparse: cast from non-scalar
drivers/gpio/devres.c:83:16: sparse: Using plain integer as NULL pointer
drivers/net/bonding/bond_options.c:68:31: sparse: incompatible types in comparison expression (different address spaces)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
