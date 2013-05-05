From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 05 May 2013 23:57:47 +0000
Subject: build regressions 2013-05-05
Message-Id: <5186f1fb.+JP4nqkh6jn7GIJ0%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/time/tick-sched.c:802:341: error: 'cpu' undeclared (first use in this function)

[warnings]
kernel/time/tick-sched.c:802:27: warning: left-hand operand of comma expression has no effect [-Wunused-value]

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
