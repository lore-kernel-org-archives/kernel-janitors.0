From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 29 Jul 2013 16:32:20 +0000
Subject: build regressions 2013-07-29
Message-Id: <51f69914.V6lvmL3ThwQ6r/Z2%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
cx88-dvb.c:(.text+0x69ee12): undefined reference to `vp3054_i2c_remove'
cx88-dvb.c:(.text+0x69f48d): undefined reference to `vp3054_i2c_probe'
spi.c:(.text+0xd8409): undefined reference to `crc_ccitt'
(.text+0xd879d): undefined reference to `crc_ccitt'
drivers/vhost/vhost.c:893:19: error: 'vhost_log_write' undeclared here (not in a function)
include/linux/unaligned/access_ok.h:7:19: error: redefinition of 'get_unaligned_le16'
include/linux/unaligned/access_ok.h:12:19: error: redefinition of 'get_unaligned_le32'
include/linux/unaligned/access_ok.h:17:19: error: redefinition of 'get_unaligned_le64'
include/linux/unaligned/access_ok.h:22:19: error: redefinition of 'get_unaligned_be16'
include/linux/unaligned/access_ok.h:27:19: error: redefinition of 'get_unaligned_be32'
include/linux/unaligned/access_ok.h:32:19: error: redefinition of 'get_unaligned_be64'
include/linux/unaligned/access_ok.h:37:20: error: redefinition of 'put_unaligned_le16'
include/linux/unaligned/access_ok.h:42:20: error: redefinition of 'put_unaligned_le32'
include/linux/unaligned/access_ok.h:47:20: error: redefinition of 'put_unaligned_le64'
include/linux/unaligned/access_ok.h:52:20: error: redefinition of 'put_unaligned_be16'
include/linux/unaligned/access_ok.h:57:20: error: redefinition of 'put_unaligned_be32'
include/linux/unaligned/access_ok.h:62:20: error: redefinition of 'put_unaligned_be64'
blockconsole.c:(.text+0x65378): undefined reference to `__cmpxchg_called_with_bad_pointer'
drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c:1840:25: error: 'struct v4l2_async_subdev' has no member named 'bus_type'
drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c:1841:15: error: 'struct v4l2_async_subdev' has no member named 'bus_type'
drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c:1841:29: error: 'V4L2_ASYNC_BUS_PLATFORM' undeclared (first use in this function)
drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c:1842:37: error: 'union <anonymous>' has no member named 'platform'

[warnings]
drivers/tty/serial/max310x.c:1224:21: warning: initialization from incompatible pointer type [enabled by default]
drivers/tty/serial/max310x.c:1224:21: warning: (near initialization for 'max310x_pm_ops.suspend') [enabled by default]
drivers/tty/serial/max310x.c:1224:21: warning: initialization from incompatible pointer type [enabled by default]
drivers/tty/serial/max310x.c:1224:21: warning: (near initialization for 'max310x_pm_ops.resume') [enabled by default]
drivers/tty/serial/max310x.c:1224:21: warning: initialization from incompatible pointer type [enabled by default]
drivers/tty/serial/max310x.c:1224:21: warning: (near initialization for 'max310x_pm_ops.freeze') [enabled by default]
drivers/tty/serial/max310x.c:1224:21: warning: initialization from incompatible pointer type [enabled by default]
drivers/tty/serial/max310x.c:1224:21: warning: (near initialization for 'max310x_pm_ops.thaw') [enabled by default]
drivers/tty/serial/max310x.c:1224:21: warning: initialization from incompatible pointer type [enabled by default]
drivers/tty/serial/max310x.c:1224:21: warning: (near initialization for 'max310x_pm_ops.poweroff') [enabled by default]
drivers/tty/serial/max310x.c:1224:21: warning: initialization from incompatible pointer type [enabled by default]
drivers/tty/serial/max310x.c:1224:21: warning: (near initialization for 'max310x_pm_ops.restore') [enabled by default]
WARNING: drivers/tty/built-in.o(.text+0x30922): Section mismatch in reference from the function pch_uart_get_uartclk() to the variable .init.data:pch_uart_dmi_table
drivers/tty/serial/st-asc.c:727:28: warning: 'asc_match' defined but not used [-Wunused-variable]
WARNING: drivers/tty/serial/pch_uart.o(.text+0x4871): Section mismatch in reference from the function pch_uart_init_port() to the variable .init.data:pch_uart_dmi_table
include/linux/pm.h:328:14: warning: initialization from incompatible pointer type [enabled by default]
include/linux/pm.h:328:14: warning: (near initialization for 'max310x_pm_ops.suspend') [enabled by default]
include/linux/pm.h:328:14: warning: initialization from incompatible pointer type [enabled by default]
include/linux/pm.h:328:14: warning: (near initialization for 'max310x_pm_ops.resume') [enabled by default]
include/linux/pm.h:328:14: warning: initialization from incompatible pointer type [enabled by default]
include/linux/pm.h:328:14: warning: (near initialization for 'max310x_pm_ops.freeze') [enabled by default]
include/linux/pm.h:328:14: warning: initialization from incompatible pointer type [enabled by default]
include/linux/pm.h:328:14: warning: (near initialization for 'max310x_pm_ops.thaw') [enabled by default]
include/linux/pm.h:328:14: warning: initialization from incompatible pointer type [enabled by default]
include/linux/pm.h:328:14: warning: (near initialization for 'max310x_pm_ops.poweroff') [enabled by default]
include/linux/pm.h:328:14: warning: initialization from incompatible pointer type [enabled by default]
include/linux/pm.h:328:14: warning: (near initialization for 'max310x_pm_ops.restore') [enabled by default]

[sparse]
drivers/net/ethernet/mellanox/mlx4/cmd.c:812:5: sparse: symbol 'MLX4_CMD_GET_OP_REQ_wrapper' was not declared. Should it be static?
drivers/net/ethernet/mellanox/mlx4/fw.c:1797:53: sparse: restricted __be32 degrades to integer
drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c:1839:33: sparse: no member 'bus_type' in struct v4l2_async_subdev

[coccinelle]
drivers/net/ethernet/mellanox/mlx4/cmd.c:2221:2-3: Unneeded semicolon

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
