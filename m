From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 25 Nov 2012 23:13:49 +0000
Subject: build regressions 2012-11-25
Message-Id: <50b2a62d.AVZdv+HjKaVJsnvX%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/usb/chipidea/debug.c:92:2: error: implicit declaration of function 'copy_from_user' [-Werror=implicit-function-declaration]

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
