From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 13 Jul 2012 20:23:05 +0000
Subject: [input:next 43/45] drivers/input/keyboard/omap4-keypad.c:218:6: warning: unused variable 'error'
Message-Id: <20120713202305.GA26333@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sourav Poddar <sourav.poddar@ti.com>
Cc: kernel-janitors@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org

Hi Sourav,

There are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
head:   7545a8052565aa68eeb4dfb59c1fb5d21a6867e7
commit: 3dad34659e6646ab578d82b75a023cc4640fe322 [43/45] Input: omap4-keypad - add device tree support

All warnings:

drivers/input/keyboard/omap4-keypad.c: In function 'omap4_keypad_parse_dt':
drivers/input/keyboard/omap4-keypad.c:218:6: warning: unused variable 'error' [-Wunused-variable]

vim +218 drivers/input/keyboard/omap4-keypad.c
   215						   struct omap4_keypad *keypad_data)
   216	{
   217		struct device_node *np = dev->of_node;
 > 218		int error;
   219	
   220		if (!np) {
   221			dev_err(dev, "missing DT data");

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
