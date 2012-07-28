From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 28 Jul 2012 12:34:41 +0000
Subject: drivers/mfd/tps65090.c: duplicated TPS65090_INT_STS tests
Message-Id: <20120728123441.GB11202@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Venu Byravarasu <vbyravarasu@nvidia.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Axel Lin <axel.lin@gmail.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi Venu,

Is this coccinelle warning a trivial one, or indicates some copy&paste
error? It's introduced by commit 3c33be06 ("mfd: Add support for
TPS65090").

drivers/mfd/tps65090.c:239:5-30: duplicated argument to && or ||

vim +239 drivers/mfd/tps65090.c
   236	
   237	static bool is_volatile_reg(struct device *dev, unsigned int reg)
   238	{
 > 239		if ((reg = TPS65090_INT_STS) || (reg = TPS65090_INT_STS))
   240			return true;
   241		else
   242			return false;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
