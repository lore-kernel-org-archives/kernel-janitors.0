From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 17 Jul 2013 16:12:31 +0000
Subject: build regressions 2013-07-17
Message-Id: <51e6c26f.zhIaO+HoPsjQL9tA%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
(.text+0x232793): undefined reference to `snd_dmaengine_pcm_register'
(.text+0x2327a2): undefined reference to `snd_dmaengine_pcm_unregister'
sound/built-in.o:(.rodata+0x1b9a60): undefined reference to `snd_dmaengine_pcm_prepare_slave_config'
sound/soc/tegra/tegra_alc5632.c:86:15: error: variable 'tegra_alc5632_hp_jack_gpio' has initializer but incomplete type
sound/soc/tegra/tegra_alc5632.c:87:2: error: unknown field 'name' specified in initializer
sound/soc/tegra/tegra_alc5632.c:88:2: error: unknown field 'report' specified in initializer
sound/soc/tegra/tegra_alc5632.c:89:2: error: unknown field 'debounce_time' specified in initializer
sound/soc/tegra/tegra_alc5632.c:117:3: error: invalid use of undefined type 'struct snd_soc_jack_gpio'
sound/soc/tegra/tegra_alc5632.c:118:3: error: implicit declaration of function 'snd_soc_jack_add_gpios' [-Werror=implicit-function-declaration]
sound/soc/tegra/tegra_alc5632.c:226:2: error: implicit declaration of function 'snd_soc_jack_free_gpios' [-Werror=implicit-function-declaration]
ERROR: "devm_request_threaded_irq" [drivers/spi/spi-xilinx.ko] undefined!
ERROR: "snd_dmaengine_pcm_unregister" undefined!
ERROR: "snd_dmaengine_pcm_prepare_slave_config" undefined!
ERROR: "snd_dmaengine_pcm_register" undefined!
fs/aio.c:196:2: error: implicit declaration of function 'migrate_page_move_mapping' [-Werror=implicit-function-declaration]
ERROR: "ehci_init_driver" undefined!
ERROR: "ehci_init_driver" [drivers/usb/chipidea/ci_hdrc.ko] undefined!

[warnings]
security/integrity/ima/ima_template_lib.c:166: warning: comparison is always true due to limited range of data type
drivers/i2c/busses/i2c-xiic.c:340:2: warning: too many arguments for format [-Wformat-extra-args]
drivers/i2c/busses/i2c-xiic.c:342:2: warning: format '%x' expects argument of type 'unsigned int', but argument 6 has type 'struct i2c_msg *' [-Wformat=]
drivers/i2c/busses/i2c-xiic.c:342:2: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'unsigned int' [-Wformat=]
include/linux/compiler.h:102:18: warning: too many arguments for format [-Wformat-extra-args]
include/linux/compiler.h:102:18: warning: format '%x' expects argument of type 'unsigned int', but argument 6 has type 'struct i2c_msg *' [-Wformat=]
include/linux/compiler.h:102:18: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'unsigned int' [-Wformat=]
sound/soc/tegra/tegra_alc5632.c:87:2: warning: excess elements in struct initializer [enabled by default]
sound/soc/tegra/tegra_alc5632.c:87:2: warning: (near initialization for 'tegra_alc5632_hp_jack_gpio') [enabled by default]
sound/soc/tegra/tegra_alc5632.c:88:2: warning: excess elements in struct initializer [enabled by default]
sound/soc/tegra/tegra_alc5632.c:88:2: warning: (near initialization for 'tegra_alc5632_hp_jack_gpio') [enabled by default]
sound/soc/tegra/tegra_alc5632.c:89:2: warning: excess elements in struct initializer [enabled by default]
sound/soc/tegra/tegra_alc5632.c:89:2: warning: (near initialization for 'tegra_alc5632_hp_jack_gpio') [enabled by default]
security/integrity/ima/ima_crypto.c:172:1: warning: 'ima_calc_field_array_hash_tfm' uses dynamic stack allocation [enabled by default]
include/linux/dynamic_debug.h:64:16: warning: too many arguments for format [-Wformat-extra-args]
include/linux/dynamic_debug.h:64:16: warning: format '%x' expects argument of type 'unsigned int', but argument 6 has type 'struct i2c_msg *' [-Wformat=]
include/linux/dynamic_debug.h:64:16: warning: format '%p' expects argument of type 'void *', but argument 7 has type 'unsigned int' [-Wformat=]

[sparse]
security/integrity/ima/ima_api.c:231:47: sparse: Variable length array is used.
security/integrity/ima/ima_crypto.c:187:12: sparse: symbol 'ima_calc_boot_aggregate_tfm' was not declared. Should it be static?
security/integrity/ima/ima_crypto.c:142:5: sparse: symbol 'ima_calc_field_array_hash_tfm' was not declared. Should it be static?
security/integrity/ima/ima_crypto.c:93:59: sparse: incorrect type in argument 3 (different address spaces) @@    expected struct cred const *<noident> @@    got struct cred conststruct cred const *<noident> @@

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
