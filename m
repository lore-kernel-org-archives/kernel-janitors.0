From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 25 Jul 2012 13:56:39 +0000
Subject: qla_os.c: code aligned with following code
Message-Id: <20120725135639.GA27724@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Andrew,

coccinelle complaints about

drivers/scsi/qla2xxx/qla_os.c:3657:7-21: code aligned with following code on line 3658
drivers/scsi/qla4xxx/ql4_os.c:2279:2-22: code aligned with following code on line 2282

The first one looks like a real problem, while the latter one is
caused by mis-indent.

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
