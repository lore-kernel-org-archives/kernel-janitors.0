From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 24 Oct 2012 23:42:11 +0000
Subject: build regressions 2012-10-24
Message-Id: <20121024234211.GB6798@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
bgrt.c:(.text+0xccec1): undefined reference to `bgrt_tab'
kernel/rcupdate.c:424:38: error: expected ')' before 'int'
kernel/rcutree_trace.c:179:27: error: 'struct rcu_state' has no member named 'expedited_start'
kernel/rcutree_trace.c:180:27: error: 'struct rcu_state' has no member named 'expedited_done'
kernel/rcutree_trace.c:181:27: error: 'struct rcu_state' has no member named 'expedited_wrap'
kernel/rcutree_trace.c:182:27: error: 'struct rcu_state' has no member named 'expedited_tryfail'
kernel/rcutree_trace.c:183:27: error: 'struct rcu_state' has no member named 'expedited_workdone1'
kernel/rcutree_trace.c:184:27: error: 'struct rcu_state' has no member named 'expedited_workdone2'
kernel/rcutree_trace.c:185:27: error: 'struct rcu_state' has no member named 'expedited_normal'
kernel/rcutree_trace.c:186:27: error: 'struct rcu_state' has no member named 'expedited_stoppedcpus'
kernel/rcutree_trace.c:187:27: error: 'struct rcu_state' has no member named 'expedited_done_tries'
kernel/rcutree_trace.c:188:27: error: 'struct rcu_state' has no member named 'expedited_done_lost'
kernel/rcutree_trace.c:189:27: error: 'struct rcu_state' has no member named 'expedited_done_exit'
kernel/printk/printk_syslog.c:108:3: error: implicit declaration of function 'copy_to_user' [-Werror=implicit-function-declaration]
kernel/printk/printk_syslog.c:245:3: error: implicit declaration of function 'access_ok' [-Werror=implicit-function-declaration]
arch/powerpc/platforms/wsp/chroma.c:55:1: error: type defaults to 'int' in declaration of '__define_initcall' [-Werror=implicit-int]
arch/powerpc/platforms/wsp/chroma.c:55:1: error: '__machine_initcall_chroma_md_wsp_probe_devices' defined but not used [-Werror=unused-function]
arch/powerpc/platforms/wsp/psr2.c:66:1: error: type defaults to 'int' in declaration of '__define_initcall' [-Werror=implicit-int]
arch/powerpc/platforms/wsp/psr2.c:66:1: error: '__machine_initcall_psr2_md_wsp_probe_devices' defined but not used [-Werror=unused-function]
arch/powerpc/platforms/85xx/p5040_ds.c:85:1: error: macro "__define_initcall" passed 3 arguments, but takes just 2
arch/powerpc/platforms/85xx/p5020_ds.c:94:1: error: type defaults to 'int' in declaration of '__define_initcall' [-Werror=implicit-int]
arch/powerpc/platforms/85xx/p5020_ds.c:94:1: error: '__machine_initcall_p5020_ds_corenet_ds_publish_devices' defined but not used [-Werror=unused-function]
arch/powerpc/platforms/85xx/p5020_ds.c:97:1: error: '__machine_initcall_p5020_ds_swiotlb_setup_bus_notifier' defined but not used [-Werror=unused-function]
arch/powerpc/platforms/85xx/p5040_ds.c:85:1: error: type defaults to 'int' in declaration of '__define_initcall' [-Werror=implicit-int]
arch/powerpc/platforms/85xx/p5040_ds.c:85:1: error: '__machine_initcall_p5040_ds_corenet_ds_publish_devices' defined but not used [-Werror=unused-function]
arch/powerpc/platforms/85xx/p5040_ds.c:88:1: error: '__machine_initcall_p5040_ds_swiotlb_setup_bus_notifier' defined but not used [-Werror=unused-function]
arch/powerpc/platforms/embedded6xx/linkstation.c:35:1: error: type defaults to 'int' in declaration of '__define_initcall' [-Werror=implicit-int]
arch/powerpc/platforms/embedded6xx/linkstation.c:35:1: error: '__machine_initcall_linkstation_declare_of_platform_devices' defined but not used [-Werror=unused-function]
arch/powerpc/platforms/embedded6xx/ls_uart.c:142:1: error: type defaults to 'int' in declaration of '__define_initcall' [-Werror=implicit-int]
arch/powerpc/platforms/embedded6xx/ls_uart.c:142:1: error: '__machine_initcall_linkstation_ls_uarts_init' defined but not used [-Werror=unused-function]
kernel/printk/devkmsg.c:74:2: error: implicit declaration of function 'printk_emit' [-Werror=implicit-function-declaration]

[warnings]
kernel/rcutree.c:2322:2: warning: passing argument 1 of 'atomic_read' from incompatible pointer type [enabled by default]
kernel/sched/debug.c:233:2: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'u64' [-Wformat]
drivers/base/power/qos.c:385: warning: 'ret' is used uninitialized in this function
drivers/media/i2c/adv7604.c:406:9: warning: initialization makes integer from pointer without a cast [enabled by default]
drivers/media/i2c/adv7604.c:406:9: warning: (near initialization for 'msg[0].transferred') [enabled by default]
arch/m68k/mm/init.c:228:2: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'int' [-Wformat]
kernel/sched/debug.c:233:2: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'long long int' [-Wformat]
drivers/staging/wlan-ng/cfg80211.c:735:2: warning: (near initialization for 'prism2_usb_cfg_ops.set_tx_power') [enabled by default]
drivers/staging/wlan-ng/cfg80211.c:736:2: warning: (near initialization for 'prism2_usb_cfg_ops.get_tx_power') [enabled by default]
drivers/staging/rtl8192e/rtllib.h:3020:3: warning: '______f' is static but declared in inline function 'rtllib_get_hdrlen' which is not static [enabled by default]
drivers/staging/rtl8192e/rtllib.h:3004:2: warning: '______f' is static but declared in inline function 'rtllib_is_valid_mode' which is not static [enabled by default]
drivers/staging/rtl8192e/rtllib.h:2979:3: warning: '______f' is static but declared in inline function 'rtllib_is_empty_essid' which is not static [enabled by default]
drivers/staging/rtl8192e/rtllib_softmac.c:2522:19: warning: 'aid' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/staging/rtl8192e/rtllib_softmac.c:2591:5: warning: 'challenge' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
kernel/rcutorture.c:585:1: sparse: symbol 'srcu_ctl_srcu_array' was not declared. Should it be static?

[smatch]
drivers/staging/comedi/drivers/cb_pcidda.c:660 cb_pcidda_attach_pci() warn: variable dereferenced before check 'pcidev' (see line 659)

[coccinelle]
kernel/rcutree_trace.c:437:3-17: code aligned with following code on line 439
drivers/staging/comedi/drivers/dt3000.c:679:36-37: duplicated argument to & or |

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
