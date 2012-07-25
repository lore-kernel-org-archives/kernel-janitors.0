From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 25 Jul 2012 13:59:17 +0000
Subject: bfa_ioc.c: code aligned with following code
Message-Id: <20120725135917.GB27724@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi James,

coccinelle complaints:

drivers/scsi/bfa/bfa_ioc.c:3397:3-18: code aligned with following code on line 3399

and the code does look weird..

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
