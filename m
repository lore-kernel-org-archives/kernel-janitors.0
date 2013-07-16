From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 16 Jul 2013 16:50:49 +0000
Subject: build regressions 2013-07-16
Message-Id: <51e579e9.cbKtpW5BaImqFpco%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
sound/soc/fsl/fsl_ssi.c:706:26: error: 'NO_IRQ' undeclared (first use in this function)
sound/soc/fsl/fsl_ssi.c:181:2: error: implicit declaration of function 'read_ssi' [-Werror=implicit-function-declaration]
sound/soc/fsl/fsl_ssi.c:296:3: error: implicit declaration of function 'write_ssi' [-Werror=implicit-function-declaration]
sound/soc/fsl/fsl_ssi.c:331:3: error: implicit declaration of function 'write_ssi_mask' [-Werror=implicit-function-declaration]
sound/soc/codecs/wm8903.c:1958:9: error: implicit declaration of function 'irq_get_irq_data' [-Werror=implicit-function-declaration]
sound/soc/tegra/tegra_alc5632.c:16:28: fatal error: asm/mach-types.h: No such file or directory
sound/soc/tegra/tegra_rt5640.c:92:15: error: variable 'tegra_rt5640_hp_jack_gpio' has initializer but incomplete type
sound/soc/tegra/tegra_rt5640.c:93:2: error: unknown field 'name' specified in initializer
sound/soc/tegra/tegra_rt5640.c:94:2: error: unknown field 'report' specified in initializer
sound/soc/tegra/tegra_rt5640.c:95:2: error: unknown field 'debounce_time' specified in initializer
sound/soc/tegra/tegra_rt5640.c:96:2: error: unknown field 'invert' specified in initializer
sound/soc/tegra/tegra_rt5640.c:121:3: error: invalid use of undefined type 'struct snd_soc_jack_gpio'
sound/soc/tegra/tegra_rt5640.c:122:3: error: implicit declaration of function 'snd_soc_jack_add_gpios' [-Werror=implicit-function-declaration]
sound/soc/tegra/tegra_rt5640.c:226:2: error: implicit declaration of function 'snd_soc_jack_free_gpios' [-Werror=implicit-function-declaration]
sound/soc/tegra/trimslice.c:27:28: fatal error: asm/mach-types.h: No such file or directory
sound/soc/tegra/tegra_wm8753.c:31:28: fatal error: asm/mach-types.h: No such file or directory
sound/soc/tegra/tegra_wm8903.c:113:15: error: variable 'tegra_wm8903_hp_jack_gpio' has initializer but incomplete type
sound/soc/tegra/tegra_wm8903.c:114:2: error: unknown field 'name' specified in initializer
sound/soc/tegra/tegra_wm8903.c:115:2: error: unknown field 'report' specified in initializer
sound/soc/tegra/tegra_wm8903.c:116:2: error: unknown field 'debounce_time' specified in initializer
sound/soc/tegra/tegra_wm8903.c:117:2: error: unknown field 'invert' specified in initializer
sound/soc/tegra/tegra_wm8903.c:180:3: error: invalid use of undefined type 'struct snd_soc_jack_gpio'
sound/soc/tegra/tegra_wm8903.c:186:3: error: implicit declaration of function 'snd_soc_jack_add_gpios' [-Werror=implicit-function-declaration]
sound/soc/tegra/tegra_wm8903.c:371:2: error: implicit declaration of function 'snd_soc_jack_free_gpios' [-Werror=implicit-function-declaration]
fs/btrfs/check-integrity.c:1017:30: error: expected ')' before ';' token
fs/btrfs/check-integrity.c:1482:64: error: expected ')' before ';' token
drivers/regulator/s2mps11.c:431:2: error: implicit declaration of function 'of_find_node_by_name' [-Werror=implicit-function-declaration]

[warnings]
fs/btrfs/check-integrity.c:1020: warning: too few arguments for format
fs/btrfs/check-integrity.c:1485: warning: too few arguments for format
sound/soc/codecs/wm8903.c:1958:30: warning: initialization makes pointer from integer without a cast [enabled by default]
sound/soc/tegra/tegra_rt5640.c:93:2: warning: excess elements in struct initializer [enabled by default]
sound/soc/tegra/tegra_rt5640.c:93:2: warning: (near initialization for 'tegra_rt5640_hp_jack_gpio') [enabled by default]
sound/soc/tegra/tegra_rt5640.c:94:2: warning: excess elements in struct initializer [enabled by default]
sound/soc/tegra/tegra_rt5640.c:94:2: warning: (near initialization for 'tegra_rt5640_hp_jack_gpio') [enabled by default]
sound/soc/tegra/tegra_rt5640.c:95:2: warning: excess elements in struct initializer [enabled by default]
sound/soc/tegra/tegra_rt5640.c:95:2: warning: (near initialization for 'tegra_rt5640_hp_jack_gpio') [enabled by default]
sound/soc/tegra/tegra_rt5640.c:96:2: warning: excess elements in struct initializer [enabled by default]
sound/soc/tegra/tegra_rt5640.c:96:2: warning: (near initialization for 'tegra_rt5640_hp_jack_gpio') [enabled by default]
sound/soc/tegra/tegra_wm8903.c:114:2: warning: excess elements in struct initializer [enabled by default]
sound/soc/tegra/tegra_wm8903.c:114:2: warning: (near initialization for 'tegra_wm8903_hp_jack_gpio') [enabled by default]
sound/soc/tegra/tegra_wm8903.c:115:2: warning: excess elements in struct initializer [enabled by default]
sound/soc/tegra/tegra_wm8903.c:115:2: warning: (near initialization for 'tegra_wm8903_hp_jack_gpio') [enabled by default]
sound/soc/tegra/tegra_wm8903.c:116:2: warning: excess elements in struct initializer [enabled by default]
sound/soc/tegra/tegra_wm8903.c:116:2: warning: (near initialization for 'tegra_wm8903_hp_jack_gpio') [enabled by default]
sound/soc/tegra/tegra_wm8903.c:117:2: warning: excess elements in struct initializer [enabled by default]
sound/soc/tegra/tegra_wm8903.c:117:2: warning: (near initialization for 'tegra_wm8903_hp_jack_gpio') [enabled by default]
drivers/spi/spi-bitbang.c:375:2: warning: passing argument 1 of 'spi_finalize_current_message' from incompatible pointer type [enabled by default]
fs/btrfs/check-integrity.c:1020:13: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
fs/btrfs/check-integrity.c:1485:10: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
fs/btrfs/check-integrity.c:1485:10: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
drivers/regulator/s2mps11.c:431:9: warning: assignment makes pointer from integer without a cast [enabled by default]

[sparse]
drivers/net/wireless/iwlwifi/mvm/power.c:255:42: sparse: incorrect type in assignment (different base types) @@    expected unsigned char [unsigned] [usertype] lprx_rssi_threshold @@    got d char [unsigned] [usertype] lprx_rssi_threshold @@
sound/soc/omap/omap-pcm.c:160:21: sparse: undefined identifier 'dma_alloc_writecombine'
sound/soc/omap/omap-pcm.c:184:17: sparse: undefined identifier 'dma_free_writecombine'
fs/nfsd/nfssvc.c:120:10: sparse: Initializer entry defined twice
fs/btrfs/check-integrity.c:1017:65: sparse: Expected ) in function call
fs/btrfs/check-integrity.c:1017:65: sparse: got ;
fs/btrfs/check-integrity.c:1020:65: sparse: Expected ; at end of statement
fs/btrfs/check-integrity.c:1020:65: sparse: got )

[coccinelle]
drivers/usb/host/isp116x-hcd.c:175:3-49: code aligned with following code on line 177
drivers/usb/host/isp116x-hcd.c:128:3-48: code aligned with following code on line 130
sound/soc/omap/omap-dmic.c:500:2-8: ERROR: missing clk_put; clk_get on line 467 and execution via conditional on line 499

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
