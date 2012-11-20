From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 20 Nov 2012 20:32:08 +0000
Subject: build regressions 2012-11-20
Message-Id: <50abe8c8.7OPlKdq5Yq4xKJIz%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/gpio/gpiolib-of.c:244:11: error: too few arguments to function 'gpiochip_add_pin_range'
drivers/mfd/sta2x11-mfd.c:169:2: error: unknown field 'lock' specified in initializer
drivers/mfd/sta2x11-mfd.c:170:2: error: unknown field 'unlock' specified in initializer
drivers/mfd/sta2x11-mfd.c:290:15: error: 'struct regmap_config' has no member named 'lock_arg'
sound/soc/codecs/wm8994.c:675:160: error: expected expression before '.' token
drivers/power/charger-manager.c:1212:2: error: implicit declaration of function 'extcon_register_interest' [-Werror=implicit-function-declaration]
drivers/power/charger-manager.c:1637:4: error: implicit declaration of function 'extcon_unregister_interest' [-Werror=implicit-function-declaration]
sound/soc/codecs/ab8500-codec.c:1893:2: error: 'SOC_CONTROL_IO_XR_SX' undeclared here (not in a function)
sound/soc/codecs/cs42l51.c:142:2: error: 'SOC_CONTROL_IO_SX' undeclared here (not in a function)
sound/soc/codecs/cs42l52.c:407:2: error: 'SOC_CONTROL_IO_SX' undeclared here (not in a function)
sound/soc/codecs/cs42l73.c:401:2: error: 'SOC_CONTROL_IO_SX' undeclared here (not in a function)
sound/soc/codecs/cs42l73.c:428:2: error: request for member 'private_value' in something not a structure or union
sound/soc/codecs/wm5100.c:712:1: error: expected expression before '.' token
sound/soc/codecs/wm5102.c:682:1: error: expected expression before '.' token
sound/soc/codecs/wm5110.c:141:1: error: expected expression before '.' token
sound/soc/codecs/wm8962.c:1760:1: error: expected expression before '.' token
sound/soc/codecs/wm8996.c:539:1: error: expected expression before '.' token
include/linux/power/charger-manager.h:89:34: error: field 'extcon_dev' has incomplete type

[warnings]
WARNING: drivers/mfd/built-in.o(.data+0x1258): Section mismatch in reference from the variable mfd_setup_data to the variable .devinit.data:sta2x11_mfd0_bar0
WARNING: drivers/mfd/built-in.o(.data+0x1260): Section mismatch in reference from the variable mfd_setup_data to the variable .devinit.data:sta2x11_mfd0_bar1
WARNING: drivers/mfd/built-in.o(.data+0x1268): Section mismatch in reference from the variable mfd_setup_data to the variable .devinit.data:sta2x11_mfd1_bar0
WARNING: drivers/mfd/built-in.o(.data+0x1270): Section mismatch in reference from the variable mfd_setup_data to the variable .devinit.data:sta2x11_mfd1_bar1
drivers/mfd/sta2x11-mfd.c:169:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/mfd/sta2x11-mfd.c:169:2: warning: (near initialization for 'sta2x11_sctl_regmap_config.writeable_reg') [enabled by default]
drivers/mfd/sta2x11-mfd.c:170:2: warning: (near initialization for 'sta2x11_sctl_regmap_config.readable_reg') [enabled by default]
drivers/mfd/sta2x11-mfd.c:207:2: warning: (near initialization for 'sta2x11_apbreg_regmap_config.writeable_reg') [enabled by default]
drivers/mfd/sta2x11-mfd.c:208:2: warning: (near initialization for 'sta2x11_apbreg_regmap_config.readable_reg') [enabled by default]
drivers/mfd/sta2x11-mfd.c:246:2: warning: (near initialization for 'sta2x11_apb_soc_regs_regmap_config.writeable_reg') [enabled by default]
drivers/mfd/sta2x11-mfd.c:247:2: warning: (near initialization for 'sta2x11_apb_soc_regs_regmap_config.readable_reg') [enabled by default]
drivers/mfd/sta2x11-mfd.c:220:2: warning: (near initialization for 'sta2x11_scr_regmap_config.writeable_reg') [enabled by default]
drivers/mfd/sta2x11-mfd.c:221:2: warning: (near initialization for 'sta2x11_scr_regmap_config.readable_reg') [enabled by default]
sound/soc/codecs/wm8994.c:675:256: warning: excess elements in struct initializer [enabled by default]
drivers/md/md.c:7582:6: warning: passing argument 2 of 'constant_test_bit' from incompatible pointer type [enabled by default]
drivers/md/md.c:7582:6: warning: passing argument 2 of 'variable_test_bit' from incompatible pointer type [enabled by default]
drivers/md/md.c:7583:7: warning: passing argument 2 of 'test_bit' from incompatible pointer type [enabled by default]
drivers/gpu/drm/qxl/qxl_cmd.c:179:4: warning: passing argument 2 of 'qxl_bo_kmap' from incompatible pointer type [enabled by default]
drivers/gpu/drm/qxl/qxl_ioctl.c:272:27: warning: unused variable 'param' [-Wunused-variable]
drivers/gpu/drm/qxl/qxl_ioctl.c:271:21: warning: unused variable 'qdev' [-Wunused-variable]
sound/soc/codecs/wm5102.c:682:1: warning: excess elements in struct initializer [enabled by default]
sound/soc/codecs/wm5102.c:682:1: warning: (near initialization for 'wm5102_snd_controls[56]') [enabled by default]
sound/soc/codecs/wm5110.c:141:1: warning: excess elements in struct initializer [enabled by default]
sound/soc/codecs/wm5110.c:141:1: warning: (near initialization for 'wm5110_snd_controls[67]') [enabled by default]
WARNING: drivers/built-in.o(.text+0xc2ab3): Section mismatch in reference from the function twlreg_probe() to the (unknown reference) .devinit.rodata:(unknown)

[sparse]
drivers/gpio/gpio-viperboard.c:271:20: sparse: incorrect type in assignment (different base types)
drivers/gpio/gpio-viperboard.c:313:27: sparse: cast to restricted __be16
drivers/i2c/busses/i2c-viperboard.c:129:35: sparse: incorrect type in assignment (different base types)
drivers/mfd/sta2x11-mfd.c:142:13: sparse: context imbalance in 'sta2x11_regmap_lock' - wrong count at exit
drivers/mfd/sta2x11-mfd.c:148:13: sparse: context imbalance in 'sta2x11_regmap_unlock' - unexpected unlock
sound/soc/codecs/cs42l73.c:428:9: sparse: expected structure or union
drivers/md/md.c:5297:6: sparse: symbol '__md_stop' was not declared. Should it be static?
drivers/gpu/drm/qxl/qxl_cmd.c:179:48: sparse: incorrect type in argument 2 (different base types)
drivers/gpu/drm/qxl/qxl_draw.c:66:18: sparse: context imbalance in 'qxl_release_alloc' - different lock contexts for basic block
sound/soc/codecs/wm8962.c:1760:1: sparse: Expected } at end of initializer
sound/soc/codecs/wm8962.c:1760:1: sparse: got .
sound/soc/codecs/wm8994.c:675:1: sparse: Expected } at end of initializer
sound/soc/codecs/wm8994.c:675:1: sparse: got .
sound/soc/codecs/wm8996.c:539:1: sparse: Expected } at end of initializer
sound/soc/codecs/wm8996.c:539:1: sparse: got .
sound/soc/codecs/ab8500-codec.c:1893:9: sparse: undefined identifier 'SOC_CONTROL_IO_XR_SX'
sound/soc/codecs/cs42l51.c:142:9: sparse: undefined identifier 'SOC_CONTROL_IO_SX'
sound/soc/codecs/cs42l52.c:407:9: sparse: undefined identifier 'SOC_CONTROL_IO_SX'
sound/soc/codecs/cs42l73.c:401:9: sparse: undefined identifier 'SOC_CONTROL_IO_SX'
sound/soc/codecs/wm5100.c:712:1: sparse: Expected } at end of initializer
sound/soc/codecs/wm5100.c:712:1: sparse: got .
sound/soc/codecs/wm5102.c:690:1: sparse: Expected } at end of initializer
sound/soc/codecs/wm5102.c:690:1: sparse: got .
sound/soc/codecs/wm5110.c:141:1: sparse: Expected } at end of initializer
sound/soc/codecs/wm5110.c:141:1: sparse: got .
drivers/power/charger-manager.c:1212:15: sparse: undefined identifier 'extcon_register_interest'
drivers/power/charger-manager.c:1637:25: sparse: undefined identifier 'extcon_unregister_interest'

[smatch]
drivers/mfd/viperboard.c:69 vprbrd_probe() error: doing dma on the stack (buf)
drivers/mfd/sta2x11-mfd.c:111 __sta2x11_mfd_mask() warn: variable dereferenced before check 'mfd' (see line 109)
drivers/i2c/busses/i2c-viperboard.c:259 vprbrd_i2c_write() error: __builtin_memcpy() 'wmsg->data' too small (502 vs 503)
drivers/i2c/busses/i2c-viperboard.c:262 vprbrd_i2c_write() error: usb_bulk_msg() 'wmsg' too small (512 vs 513)
drivers/gpu/drm/qxl/qxl_ioctl.c:293 qxl_clientcap_ioctl() warn: buffer overflow 'qdev->rom->client_capabilities' 58 <= 58
drivers/gpu/drm/qxl/qxl_cmd.c:177 qxl_garbage_collect() error: potentially derefencing uninitialized 'info'.

[coccinelle]
drivers/video/backlight/pwm_bl.c:200:1-3: WARNING: PTR_RET can be used
drivers/gpio/gpiolib.c:1230:16-25: ERROR: reference preceded by free on line 1224

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
