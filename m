From: wfg@linux.intel.com
Date: Mon, 09 Jul 2012 02:28:35 +0000
Subject: [mfd:for-next 39/66] drivers/extcon/extcon-max8997.c:436:6: warning: 'ret' may be used uninitialized
Message-Id: <20120709022835.GA9344@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Chanwoo,

There are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/sameo/mfd-2.6.git for-next
head:   c6a5d9ff6f96128161126c0a01f0a28edf8010da
commit: dca1a71e4108a0a9051a653d885297e9d1cc656c [39/66] extcon: Add support irq domain for MAX8997 muic

All warnings:

drivers/extcon/extcon-max8997.c: In function 'max8997_muic_probe':
drivers/extcon/extcon-max8997.c:436:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]

vim +436 drivers/extcon/extcon-max8997.c
   433		struct max8997_dev *max8997 = dev_get_drvdata(pdev->dev.parent);
   434		struct max8997_platform_data *pdata = dev_get_platdata(max8997->dev);
   435		struct max8997_muic_info *info;
 > 436		int ret, i;
   437	
   438		info = kzalloc(sizeof(struct max8997_muic_info), GFP_KERNEL);
   439		if (!info) {

'ret' is uninitialized in this branch:

+               virq = irq_create_mapping(max8997->irq_domain, muic_irq->irq);
+               if (!virq)
+                       goto err_irq;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
