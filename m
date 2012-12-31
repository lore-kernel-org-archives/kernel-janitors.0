From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 31 Dec 2012 01:56:22 +0000
Subject: build regressions 2012-12-30
Message-Id: <50e0f0c6.TkoTeX2ty0U6+5IJ%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/trace/events/ext4.h:484:1: error: macro "DEFINE_EVENT" requires 4 arguments, but only 3 given
fs/ext4/inode.c:2883:2: error: implicit declaration of function 'trace_ext4_invalidatepage' [-Werror=implicit-function-declaration]
fs/ext4/inode.c:2902:2: error: implicit declaration of function 'trace_ext4_journalled_invalidatepage' [-Werror=implicit-function-declaration]

[warnings]
include/trace/events/ext4.h:480:1: warning: data definition has no type or storage class [enabled by default]
include/trace/events/ext4.h:480:1: warning: type defaults to 'int' in declaration of 'DEFINE_EVENT' [-Wimplicit-int]
include/trace/events/ext4.h:478:1: warning: 'ftrace_event_type_funcs_ext4_invalidatepage_op' defined but not used [-Wunused-variable]

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
