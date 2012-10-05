From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 05 Oct 2012 01:06:49 +0000
Subject: [samsung:devfreq-for-next 4/4] drivers/devfreq/devfreq.c:639:16: error: invalid storage class for fu
Message-Id: <20121005010649.GA6635@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi MyungJoo,

FYI, kernel build failed on

tree:   git://git.infradead.org/users/kmpark/linux-samsung devfreq-for-next
head:   6f2fe082f51cf10ea622e21bff4f5d313decee36
commit: 6f2fe082f51cf10ea622e21bff4f5d313decee36 [4/4] PM / devfreq: add global PM QoS support
config: x86_64-allyesconfig

Note: the HEAD commit builds fine. It only hurts bisectibility.

All error/warnings:

drivers/devfreq/devfreq.c: In function 'devfreq_qos_sanity_check':
drivers/devfreq/devfreq.c:448:7: warning: suggest parentheses around '&&' within '||' [-Wparentheses]
drivers/devfreq/devfreq.c:494:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
drivers/devfreq/devfreq.c:639:16: error: invalid storage class for function 'show_governor'
drivers/devfreq/devfreq.c:645:16: error: invalid storage class for function 'show_freq'
drivers/devfreq/devfreq.c:651:16: error: invalid storage class for function 'show_polling_interval'
drivers/devfreq/devfreq.c:657:16: error: invalid storage class for function 'store_polling_interval'
drivers/devfreq/devfreq.c:691:16: error: invalid storage class for function 'show_central_polling'
drivers/devfreq/devfreq.c:698:16: error: invalid storage class for function 'show_qos_min_freq'
drivers/devfreq/devfreq.c:705:16: error: invalid storage class for function 'store_min_freq'
drivers/devfreq/devfreq.c:733:16: error: invalid storage class for function 'show_min_freq'
drivers/devfreq/devfreq.c:739:16: error: invalid storage class for function 'store_max_freq'
drivers/devfreq/devfreq.c:767:16: error: invalid storage class for function 'show_max_freq'
drivers/devfreq/devfreq.c:773:16: error: invalid storage class for function 'show_trans_table'
drivers/devfreq/devfreq.c:815:2: error: initializer element is not constant
drivers/devfreq/devfreq.c:815:2: error: (near initialization for 'devfreq_attrs[0].show')
drivers/devfreq/devfreq.c:816:2: error: initializer element is not constant
drivers/devfreq/devfreq.c:816:2: error: (near initialization for 'devfreq_attrs[1].show')
drivers/devfreq/devfreq.c:817:2: error: initializer element is not constant
drivers/devfreq/devfreq.c:817:2: error: (near initialization for 'devfreq_attrs[2].show')
drivers/devfreq/devfreq.c:818:2: error: initializer element is not constant
drivers/devfreq/devfreq.c:818:2: error: (near initialization for 'devfreq_attrs[3].show')
drivers/devfreq/devfreq.c:818:2: error: initializer element is not constant
drivers/devfreq/devfreq.c:818:2: error: (near initialization for 'devfreq_attrs[3].store')
drivers/devfreq/devfreq.c:820:2: error: initializer element is not constant
drivers/devfreq/devfreq.c:820:2: error: (near initialization for 'devfreq_attrs[4].show')
drivers/devfreq/devfreq.c:820:2: error: initializer element is not constant
drivers/devfreq/devfreq.c:820:2: error: (near initialization for 'devfreq_attrs[4].store')
drivers/devfreq/devfreq.c:821:2: error: initializer element is not constant
drivers/devfreq/devfreq.c:821:2: error: (near initialization for 'devfreq_attrs[5].show')
drivers/devfreq/devfreq.c:821:2: error: initializer element is not constant
drivers/devfreq/devfreq.c:821:2: error: (near initialization for 'devfreq_attrs[5].store')
drivers/devfreq/devfreq.c:822:2: error: initializer element is not constant
drivers/devfreq/devfreq.c:822:2: error: (near initialization for 'devfreq_attrs[6].show')
drivers/devfreq/devfreq.c:823:2: error: initializer element is not constant
drivers/devfreq/devfreq.c:823:2: error: (near initialization for 'devfreq_attrs[7].show')
drivers/devfreq/devfreq.c:831:19: error: invalid storage class for function 'devfreq_start_polling'
drivers/devfreq/devfreq.c:842:1: error: initializer element is not constant
drivers/devfreq/devfreq.c:844:19: error: invalid storage class for function 'devfreq_init'
drivers/devfreq/devfreq.c:854:1: error: initializer element is not constant
drivers/devfreq/devfreq.c:856:20: error: invalid storage class for function 'devfreq_exit'
drivers/devfreq/devfreq.c:860:1: error: initializer element is not constant
drivers/devfreq/devfreq.c:875:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
drivers/devfreq/devfreq.c:936:1: error: expected declaration or statement at end of input

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
