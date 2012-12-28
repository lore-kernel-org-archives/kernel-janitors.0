From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 28 Dec 2012 23:02:11 +0000
Subject: build regressions 2012-12-28
Message-Id: <50de24f3.qWuE41dJENbG9zO/%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/mips/kernel/signal.c:252:2: error: implicit declaration of function 'sys_rt_sigsuspend' [-Werror=implicit-function-declaration]

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
