From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 19 May 2013 16:51:02 +0000
Subject: build regressions 2013-05-19
Message-Id: <519902f6.ciIeT5aBc+UUrXeA%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
(.text+0x192d1e): undefined reference to `usb_match_id'
(.text+0x23e116): undefined reference to `usb_clear_halt'
smsusb.c:(.text.unlikely+0x1636): undefined reference to `usb_init_urb'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
