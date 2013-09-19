From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 19 Sep 2013 23:20:38 +0000
Subject: build regressions 2013-09-19
Message-Id: <523b86c6.RpDgSQC/bEG+6cFB%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/blackfin/mach-common/ints-priority.c:827:2: error: implicit declaration of function 'gpio_pm_wakeup_ctrl' [-Werror=implicit-function-declaration]
arch/blackfin/include/asm/irq_handler.h:15:19: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'init_arch_irq'
arch/blackfin/include/asm/irq_handler.h:17:20: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'program_IAR'
arch/blackfin/include/asm/irq_handler.h:19:20: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'init_mach_irq'
mm/mempolicy.c:2252:27: error: 'lastpid' undeclared (first use in this function)
sound/soc/davinci/davinci-pcm.c:807:2: error: implicit declaration of function 'dma_alloc_writecombine' [-Werror=implicit-function-declaration]
sound/soc/davinci/davinci-pcm.c:836:3: error: implicit declaration of function 'dma_free_writecombine' [-Werror=implicit-function-declaration]
sound/soc/soc-fw.c:89:9: error: 'snd_soc_info_enum_ext' undeclared here (not in a function)

[warnings]
Warning(include/linux/interrupt.h:120): No description found for parameter 'active_cpus'
Warning(kernel/irq/manage.c:1637): No description found for parameter 'mask'
Warning(kernel/irq/manage.c:1687): No description found for parameter 'mask'
Warning(kernel/irq/manage.c:1637): No description found for parameter 'mask'
Warning(kernel/irq/manage.c:1687): No description found for parameter 'mask'
sound/soc/davinci/davinci-mcasp.c:1050:25: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
sound/soc/davinci/davinci-pcm.c:273:47: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
sound/soc/davinci/davinci-pcm.c:285:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
sound/soc/davinci/davinci-pcm.c:296:27: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
sound/soc/davinci/davinci-pcm.c:807:12: warning: assignment makes pointer from integer without a cast [enabled by default]

[sparse]
sound/soc/davinci/davinci-mcasp.c:1092:73: sparse: incorrect type in argument 1 (different base types) @@    expected restricted __be32 const [usertype] *p @@    got icted __be32 const [usertype] *p @@
fs/sysfs/dir.c:418:6: sparse: context imbalance in 'sysfs_addrm_start' - wrong count at exit
fs/sysfs/dir.c:586:9: sparse: context imbalance in 'sysfs_addrm_finish' - wrong count at exit
drivers/phy/phy-omap-pipe3.c:84:16: sparse: Using plain integer as NULL pointer
mm/mempolicy.c:2252:14: sparse: undefined identifier 'lastpid'

[coccinelle]
sound/soc/davinci/davinci-evm.c:169:45-46: codec_dai_name: first occurrence line 174, second occurrence line 183
sound/soc/davinci/davinci-evm.c:169:45-46: codec_name: first occurrence line 176, second occurrence line 184
sound/soc/davinci/davinci-evm.c:169:45-46: cpu_dai_name: first occurrence line 173, second occurrence line 182
sound/soc/davinci/davinci-evm.c:169:45-46: name: first occurrence line 171, second occurrence line 180
sound/soc/davinci/davinci-evm.c:169:45-46: platform_name: first occurrence line 178, second occurrence line 185
sound/soc/davinci/davinci-evm.c:169:45-46: stream_name: first occurrence line 172, second occurrence line 181

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
