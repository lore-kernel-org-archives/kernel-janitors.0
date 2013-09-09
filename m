From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 09 Sep 2013 01:05:17 +0000
Subject: build regressions 2013-09-08
Message-Id: <522d1ecd.nLdi8xWKUa6lnb4R%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/linux/kprobes.h:332: error: invalid use of undefined type 'struct kprobe_ctlblk'
drivers/net/caif/caif_virtio.c:692:27: error: too few arguments to function 'vdev->config->get'
drivers/net/caif/caif_virtio.c:692:27: error: too few arguments to function 'vdev->config->get'
drivers/net/caif/caif_virtio.c:692:27: error: too few arguments to function 'vdev->config->get'
drivers/net/caif/caif_virtio.c:692:27: error: too few arguments to function 'vdev->config->get'
drivers/net/caif/caif_virtio.c:692:27: error: too few arguments to function 'vdev->config->get'
drivers/net/caif/caif_virtio.c:692:27: error: too few arguments to function 'vdev->config->get'
drivers/s390/kvm/virtio_ccw.c:523:9: error: 'access_size' undeclared (first use in this function)
ERROR: "devm_regmap_init_mmio_clk" [sound/soc/fsl/snd-soc-fsl-spdif.ko] undefined!

[warnings]
drivers/remoteproc/remoteproc_virtio.c:280:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/remoteproc/remoteproc_virtio.c:280:2: warning: (near initialization for 'rproc_virtio_config_ops.get') [enabled by default]
drivers/remoteproc/remoteproc_virtio.c:281:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/remoteproc/remoteproc_virtio.c:281:2: warning: (near initialization for 'rproc_virtio_config_ops.set') [enabled by default]
drivers/mfd/88pm860x-i2c.c:140:1: warning: 'write_device' uses dynamic stack allocation [enabled by default]
drivers/mfd/max8925-i2c.c:128:1: warning: 'max8925_set_bits' uses dynamic stack allocation [enabled by default]
drivers/mfd/max8925-i2c.c:108:1: warning: 'max8925_bulk_write' uses dynamic stack allocation [enabled by default]
drivers/mfd/max8925-i2c.c:80:1: warning: 'max8925_reg_write' uses dynamic stack allocation [enabled by default]
drivers/net/usb/sr9700.h:65:0: warning: "RSR" redefined [enabled by default]

[sparse]
drivers/net/caif/caif_virtio.c:695:17: sparse: not enough arguments for function get
drivers/net/caif/caif_virtio.c:696:17: sparse: not enough arguments for function get
drivers/net/caif/caif_virtio.c:697:17: sparse: not enough arguments for function get
drivers/net/caif/caif_virtio.c:698:17: sparse: not enough arguments for function get
drivers/net/caif/caif_virtio.c:699:17: sparse: not enough arguments for function get
drivers/net/caif/caif_virtio.c:700:17: sparse: not enough arguments for function get

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
