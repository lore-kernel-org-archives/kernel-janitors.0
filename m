From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 09 Sep 2013 16:56:48 +0000
Subject: build regressions 2013-09-09
Message-Id: <522dfdd0.BST8lXsk80Jf4JsK%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
fs/autofs4/dev-ioctl.c:193:2: error: implicit declaration of function 'user_path_mntpointat' [-Werror=implicit-function-declaration]
arch/x86/kernel/devicetree.c:25:26: error: 'COMMAND_LINE_SIZE' undeclared here (not in a function)
drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1578:2: error: implicit declaration of function 'irq_of_parse_and_map' [-Werror=implicit-function-declaration]
drivers/input/serio/xilinx_ps2.c:257:2: error: implicit declaration of function 'of_irq_to_resource' [-Werror=implicit-function-declaration]
drivers/usb/host/ehci-xilinx-of.c:156:2: error: implicit declaration of function 'irq_of_parse_and_map' [-Werror=implicit-function-declaration]
drivers/gpu/drm/virgl/virgl_ioctl.c:195:2: error: too few arguments to function 'ttm_eu_fence_buffer_objects'
sound/soc/codecs/mc13783.c:129:13: error: 'PMIC_AUDIO_CODEC' undeclared (first use in this function)
sound/soc/codecs/mc13783.c:129:40: error: 'PMIC_AUDIO_DAC' undeclared (first use in this function)
drivers/of/of_pci_irq.c:5:22: fatal error: asm/prom.h: No such file or directory

[warnings]
drivers/gpu/drm/virtio/virtgpu_fb.c:13:22: warning: 'virglfb_ops' defined but not used [-Wunused-variable]
drivers/gpu/drm/virtio/virtgpu_display.c:125:25: warning: unused variable 'vgdev' [-Wunused-variable]
drivers/gpu/drm/virtio/virtgpu_display.c:205:25: warning: unused variable 'vgdev' [-Wunused-variable]
drivers/gpu/drm/virtio/virtgpu_display.c:220:6: warning: unused variable 'ret' [-Wunused-variable]
drivers/gpu/drm/virtio/virtgpu_display.c:217:25: warning: unused variable 'vgdev' [-Wunused-variable]
drivers/gpu/drm/virtio/virtgpu_display.c:316:25: warning: unused variable 'vgdev' [-Wunused-variable]
drivers/gpu/drm/virtio/virtgpu_display.c:370:6: warning: unused variable 'connected' [-Wunused-variable]
drivers/gpu/drm/virtio/virtgpu_display.c:369:25: warning: unused variable 'vgdev' [-Wunused-variable]
drivers/gpu/drm/virtio/virtgpu_display.c:366:25: warning: unused variable 'output' [-Wunused-variable]
drivers/gpu/drm/virtio/virtgpu_display.c:449:25: warning: unused variable 'vgdev' [-Wunused-variable]
drivers/gpu/drm/virtio/virtgpu_display.c:481:6: warning: unused variable 'max_allowed' [-Wunused-variable]
drivers/gpu/drm/virtio/virtgpu_display.c:480:25: warning: unused variable 'gobj' [-Wunused-variable]
drivers/media/i2c/adv7511.c:797:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/media/i2c/adv7511.c:797:2: warning: (near initialization for 'adv7511_core_ops.s_register') [enabled by default]
WARNING: vmlinux.o(.text+0x458cd8): Section mismatch in reference from the function of_flat_dt_get_machine_name() to the function .init.text:of_get_flat_dt_root()
WARNING: vmlinux.o(.text+0x458ce6): Section mismatch in reference from the function of_flat_dt_get_machine_name() to the function .init.text:of_get_flat_dt_prop()
WARNING: vmlinux.o(.text+0x458d14): Section mismatch in reference from the function of_flat_dt_match_machine() to the function .init.text:of_get_flat_dt_root()
WARNING: vmlinux.o(.text+0x458d58): Section mismatch in reference from the function of_flat_dt_match_machine() to the function .init.text:of_flat_dt_match()
WARNING: vmlinux.o(.text+0x458d85): Section mismatch in reference from the function of_flat_dt_match_machine() to the function .init.text:of_get_flat_dt_prop()
drivers/spi/spi-omap-100k.c:73:0: warning: "WRITE" redefined [enabled by default]
drivers/spi/spi-omap-100k.c:74:0: warning: "READ" redefined [enabled by default]
drivers/gpu/drm/virgl/virgl_ioctl.c:195:2: warning: passing argument 1 of 'ttm_eu_fence_buffer_objects' from incompatible pointer type [enabled by default]
drivers/gpu/drm/virgl/virgl_ioctl.c:195:2: warning: passing argument 2 of 'ttm_eu_fence_buffer_objects' from incompatible pointer type [enabled by default]

[sparse]
fs/cifs/smb2ops.c:834:18: sparse: cast to restricted __le32
fs/cifs/smb2ops.c:834:18: sparse: cast from restricted __le16
fs/autofs4/dev-ioctl.c:193:19: sparse: undefined identifier 'user_path_mntpointat'
sound/soc/codecs/mc13783.c:129:20: sparse: undefined identifier 'PMIC_AUDIO_CODEC'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
