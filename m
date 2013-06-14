From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 14 Jun 2013 17:07:14 +0000
Subject: build regressions 2013-06-14
Message-Id: <51bb4dc2.cGfZfQpfGgOqUJ/d%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
/c/kernel-tests/src/stable/include/linux/pinctrl/consumer.h:221:19: error: static declaration of 'pinctrl_pm_select_default_state' follows non-static declaration
/c/kernel-tests/src/stable/include/linux/pinctrl/consumer.h:226:19: error: static declaration of 'pinctrl_pm_select_sleep_state' follows non-static declaration
/c/kernel-tests/src/stable/include/linux/pinctrl/consumer.h:231:19: error: static declaration of 'pinctrl_pm_select_idle_state' follows non-static declaration
/c/kernel-tests/src/stable/include/linux/pinctrl/consumer.h:231:19: error: static declaration of 'pinctrl_pm_select_active_state' follows non-static declaration
include/linux/acpi.h:583: error: expected declaration specifiers or '...' before 'acpi_adr_space_type'
include/linux/acpi.h:584: error: expected declaration specifiers or '...' before 'acpi_adr_space_handler'
include/linux/acpi.h:585: error: expected declaration specifiers or '...' before 'acpi_adr_space_setup'
include/linux/acpi.h:587: error: expected declaration specifiers or '...' before 'acpi_adr_space_type'
include/linux/acpi.h:583:5: error: unknown type name 'acpi_adr_space_type'
include/linux/acpi.h:584:5: error: unknown type name 'acpi_adr_space_handler'
include/linux/acpi.h:585:5: error: unknown type name 'acpi_adr_space_setup'
include/linux/acpi.h:587:8: error: unknown type name 'acpi_adr_space_type'
ttusb2.c:(.text+0x5affab): undefined reference to `tda826x_attach'
dib0700_devices.c:(.text+0x5b3d40): undefined reference to `dib0090_register'
dib0700_devices.c:(.text+0x5b3e13): undefined reference to `dib0090_register'
dib0700_devices.c:(.text+0x5b3ee6): undefined reference to `dib0090_register'
dib0700_devices.c:(.text+0x5b3fb9): undefined reference to `dib0090_register'
dib0700_devices.c:(.text+0x5b408c): undefined reference to `dib0090_register'
dib0700_devices.c:(.text+0x5b42f7): undefined reference to `dib0090_pwm_gain_reset'
dib0700_devices.c:(.text+0x5b430d): undefined reference to `dib0090_get_wbd_target'
dib0700_devices.c:(.text+0x5b6430): undefined reference to `dib0090_set_dc_servo'
dib0700_devices.c:(.text+0x5b64bd): undefined reference to `dib0090_get_wbd_target'
dib0700_devices.c:(.text+0x5b6c83): undefined reference to `dib9000_set_gpio'
dib0700_devices.c:(.text+0x5b6cbe): undefined reference to `dib9000_set_gpio'
dib0700_devices.c:(.text+0x5b6f6e): undefined reference to `dib9000_i2c_enumeration'
dib0700_devices.c:(.text+0x5b6ff9): undefined reference to `dib9000_attach'
dib0700_devices.c:(.text+0x5b72c0): undefined reference to `dib9000_i2c_enumeration'
dib0700_devices.c:(.text+0x5b72e4): undefined reference to `dib9000_attach'
dib0700_devices.c:(.text+0x5b7340): undefined reference to `dib9000_get_i2c_master'
dib0700_devices.c:(.text+0x5b7364): undefined reference to `dib9000_i2c_enumeration'
dib0700_devices.c:(.text+0x5b7383): undefined reference to `dib9000_attach'
dib0700_devices.c:(.text+0x5b73a0): undefined reference to `dib9000_set_slave_frontend'
dib0700_devices.c:(.text+0x5b7410): undefined reference to `dib9000_fw_pid_filter'
dib0700_devices.c:(.text+0x5b744a): undefined reference to `dib9000_fw_pid_filter_ctrl'
dib0700_devices.c:(.text+0x5b7bb8): undefined reference to `mt2266_attach'
dib0700_devices.c:(.text+0x5b869e): undefined reference to `dib0090_register'
dib0700_devices.c:(.text+0x5b8899): undefined reference to `dib0090_pwm_gain_reset'
dib0700_devices.c:(.text+0x5b88ae): undefined reference to `dib0090_get_wbd_target'
dib0700_devices.c:(.text+0x5b9371): undefined reference to `dib0090_register'
dib0700_devices.c:(.text+0x5b941d): undefined reference to `dib0090_register'
dib0700_devices.c:(.text+0x5b96a5): undefined reference to `dib0090_get_wbd_target'
dib0700_devices.c:(.text+0x5b9701): undefined reference to `dib0090_set_tune_state'
dib0700_devices.c:(.text+0x5b9719): undefined reference to `dib0090_gain_control'
dib0700_devices.c:(.text+0x5b9741): undefined reference to `dib0090_get_tune_state'
dib0700_devices.c:(.text+0x5b97db): undefined reference to `dib0090_get_current_gain'
dib0700_devices.c:(.text+0x5b9865): undefined reference to `dib0090_pwm_gain_reset'
dib0700_devices.c:(.text+0x5b98ff): undefined reference to `dib0090_pwm_gain_reset'
dib0700_devices.c:(.text+0x5ba35f): undefined reference to `dib9000_get_tuner_interface'
dib0700_devices.c:(.text+0x5ba386): undefined reference to `dib0090_fw_register'
dib0700_devices.c:(.text+0x5ba3d9): undefined reference to `dib9000_get_i2c_master'
dib0700_devices.c:(.text+0x5ba44b): undefined reference to `dib9000_firmware_post_pll_init'
dib0700_devices.c:(.text+0x5ba4e5): undefined reference to `dib9000_get_tuner_interface'
dib0700_devices.c:(.text+0x5ba505): undefined reference to `dib0090_fw_register'
dib0700_devices.c:(.text+0x5ba558): undefined reference to `dib9000_get_i2c_master'
dib0700_devices.c:(.text+0x5ba5c5): undefined reference to `dib9000_firmware_post_pll_init'
dib0700_devices.c:(.text+0x5ba60b): undefined reference to `dib9000_get_slave_frontend'
dib0700_devices.c:(.text+0x5ba661): undefined reference to `dib9000_get_component_bus_interface'
dib0700_devices.c:(.text+0x5ba678): undefined reference to `dib9000_set_i2c_adapter'
dib0700_devices.c:(.text+0x5ba68d): undefined reference to `dib9000_get_tuner_interface'
dib0700_devices.c:(.text+0x5ba6a9): undefined reference to `dib0090_fw_register'
dib0700_devices.c:(.text+0x5ba706): undefined reference to `dib9000_fw_set_component_bus_speed'
dib0700_devices.c:(.text+0x5ba71b): undefined reference to `dib9000_firmware_post_pll_init'
dw2102.c:(.text+0x5be140): undefined reference to `mt312_attach'
dw2102.c:(.text+0x60dcfa): undefined reference to `stv0288_attach'
dw2102.c:(.text+0x60dedb): undefined reference to `stv0288_attach'
arch/x86/kernel/devicetree.c:367:7: error: void value not ignored as it ought to be
ERROR: "acpi_ipmi_init" [drivers/char/ipmi/ipmi_si.ko] undefined!
ERROR: "acpi_ipmi_exit" [drivers/char/ipmi/ipmi_si.ko] undefined!
spear_pcm.c:(.text+0x37d93): undefined reference to `snd_dmaengine_pcm_unregister'
spear_pcm.c:(.text+0x37dac): undefined reference to `snd_dmaengine_pcm_register'
spear_pcm.c:(.text+0x37dd3): undefined reference to `snd_dmaengine_pcm_request_channel'
include/linux/extcon/of-extcon.h:25:1: error: expected identifier or '(' before '{' token
ERROR: "snd_dmaengine_pcm_request_channel" [sound/soc/spear/spear_pcm.ko] undefined!
ERROR: "snd_dmaengine_pcm_register" [sound/soc/spear/spear_pcm.ko] undefined!
ERROR: "snd_dmaengine_pcm_unregister" [sound/soc/spear/spear_pcm.ko] undefined!
drivers/extcon/of_extcon.c:31:3: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
drivers/net/ethernet/intel/i40e/i40e_txrx.c:924:4: error: implicit declaration of function 'prefetch' [-Werror=implicit-function-declaration]
/c/kernel-tests/src/stable/include/linux/pinctrl/consumer.h:221:19: error: redefinition of 'pinctrl_pm_select_default_state'
/c/kernel-tests/src/stable/include/linux/pinctrl/consumer.h:226:19: error: redefinition of 'pinctrl_pm_select_sleep_state'
/c/kernel-tests/src/stable/include/linux/pinctrl/consumer.h:231:19: error: redefinition of 'pinctrl_pm_select_idle_state'
/c/kernel-tests/src/stable/include/linux/pinctrl/consumer.h:231:19: error: redefinition of 'pinctrl_pm_select_active_state'
drivers/gpu/drm/i915/intel_display.c:8207:6: error: 'dev_priv' undeclared (first use in this function)
arch/x86//Makefile:117: *** Recursive variable `KBUILD_CFLAGS' references itself (eventually).  Stop.

[warnings]
drivers/net/ethernet/intel/i40e/i40e_adminq.c:629:6: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/ethernet/intel/i40e/i40e_main.c:132:12: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/net/ethernet/intel/i40e/i40e_debugfs.c:499:99: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/ethernet/intel/i40e/i40e_debugfs.c:544:99: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
include/linux/extcon/of-extcon.h:24:3: warning: 'of_extcon_get_extcon_dev' used but never defined [enabled by default]
net/core/sysctl_net_core.c:151:9: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/net/ethernet/intel/i40e/i40e_main.c:1627:3: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/extcon/of_extcon.c:31:3: warning: return makes pointer from integer without a cast [enabled by default]
drivers/extcon/of_extcon.c:38:3: warning: return makes pointer from integer without a cast [enabled by default]
drivers/extcon/of_extcon.c:44:3: warning: return makes pointer from integer without a cast [enabled by default]
drivers/extcon/of_extcon.c:51:3: warning: return makes pointer from integer without a cast [enabled by default]
drivers/acpi/acpi_ipmi.c:156:11: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/acpi/acpi_ipmi.c:412:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
include/linux/extcon/of_extcon.h:28:2: warning: passing argument 1 of 'PTR_ERR' makes pointer from integer without a cast [enabled by default]
include/linux/extcon/of_extcon.h:28:2: warning: return makes pointer from integer without a cast [enabled by default]

[coccinelle]
drivers/net/wireless/ath/ath10k/pci.c:1208:3-44: code aligned with following code on line 1209
drivers/net/wireless/ath/ath10k/htt_rx.c:1163:2-3: Unneeded semicolon
drivers/gpu/drm/nouveau/nouveau_fence.c:160:7-11: ERROR: reference preceded by free on line 154

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
