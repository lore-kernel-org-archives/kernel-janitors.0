From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 02 Jun 2013 04:16:13 +0000
Subject: build regressions 2013-06-01
Message-Id: <51aac70d.LAdk2FYq7iFoV5l0%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
olpc_dcon_xo_1.c:(.text+0x28df76): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x28dfda): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x28dff4): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x28e011): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x28e02e): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x28e04b): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x28e068): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x28e085): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x28e0a2): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x28e0bf): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x28e140): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x28e186): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x28e1a3): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x28e1c0): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x28e1dd): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x28e391): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x28e3ab): undefined reference to `cs5535_gpio_isset'
olpc_dcon_xo_1.c:(.text+0x28e459): undefined reference to `cs5535_gpio_setup_event'
olpc_dcon_xo_1.c:(.text+0x28e476): undefined reference to `cs5535_gpio_set_irq'
olpc_dcon_xo_1.c:(.text+0x28e547): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x28e564): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x28e581): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x28e59e): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x28e5bb): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x28e5d8): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x28e5f5): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x28e612): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x28e62c): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x28e649): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x28e666): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x28e683): undefined reference to `cs5535_gpio_set'

[coccinelle]
sound/pci/rme9652/hdspm.c:1110:2-3: Unneeded semicolon
sound/pci/rme9652/hdspm.c:1110:2-3: Unneeded semicolon

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
