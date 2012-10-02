From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 02 Oct 2012 07:51:48 +0000
Subject: ERROR: "irq_set_chip_and_handler_name" undefined!
Message-Id: <20121002075148.GD24180@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Kuninori,

FYI, kernel build failed on

commit 6e20a0a429bd4dc07d6de16d9c247270e04e4aa0
Author:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Commit:     Linus Walleij <linus.walleij@linaro.org>
CommitDate: Thu Aug 23 23:41:17 2012 +0200

    gpio: pcf857x: enable gpio_to_irq() support

config: x86_64-allmodconfig

All error/warnings:

ERROR: "irq_set_chip_and_handler_name" undefined!
ERROR: "dummy_irq_chip" undefined!

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
