From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 17 Sep 2012 00:45:01 +0000
Subject: drivers/mfd/tps65090.c: duplicated argument to ||
Message-Id: <20120917004501.GD12394@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Venu,

coccinelle warns about

drivers/mfd/tps65090.c:239:5-30: duplicated argument to && or ||

Which is introduced by:

commit 3c33be06f9aa0949ad24e67dfcae1f2a3006f4e1
Author:     Venu Byravarasu <vbyravarasu@nvidia.com>
AuthorDate: Fri Mar 16 11:10:19 2012 +0530
Commit:     Samuel Ortiz <sameo@linux.intel.com>
CommitDate: Tue Mar 20 16:56:33 2012 +0100

    mfd: Add support for TPS65090

Thanks,
Fengguang
