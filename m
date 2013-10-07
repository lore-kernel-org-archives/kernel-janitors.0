From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 07 Oct 2013 21:57:37 +0000
Subject: build regressions 2013-10-07
Message-Id: <52532e51.ukISZaKEZu/2idcQ%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
technisat-usb2.c:(.text+0x2edec6): undefined reference to `stv090x_set_gpio'

[warnings]
drivers/usb/wusbcore/wa-xfer.c:475:5: warning: format '%d' expects argument of type 'int', but argument 3 has type 'size_t' [-Wformat=]
drivers/usb/wusbcore/wa-xfer.c:1924:4: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'int' [-Wformat=]

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
