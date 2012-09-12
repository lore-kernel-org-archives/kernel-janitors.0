From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 12 Sep 2012 03:11:31 +0000
Subject: pcf857x_probe() error: we previously assumed 'pdata' could be null (see line 277)
Message-Id: <20120912031131.GA22076@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

FYI, there are new smatch warnings on

commit 6e20a0a429bd4dc07d6de16d9c247270e04e4aa0 gpio: pcf857x: enable gpio_to_irq() support

drivers/gpio/gpio-pcf857x.c:288 pcf857x_probe() error: we previously assumed 'pdata' could be null (see line 277)
drivers/gpio/gpio-pcf857x.c:364 pcf857x_probe() warn: variable dereferenced before check 'pdata' (see line 292)
drivers/gpio/gpio-pcf857x.c:421 pcf857x_remove() error: we previously assumed 'pdata' could be null (see line 410)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
