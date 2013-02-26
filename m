From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 26 Feb 2013 18:41:23 +0000
Subject: build regressions 2013-02-26
Message-Id: <512d01d3.hyoJymS+VtZwgz7O%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/tty/tty_io.c:3109:3: error: too many arguments to function 'acpi_uart_register_port_peripheral'
ERROR: "from_kqid" [fs/xfs/xfs.ko] undefined!
drivers/scsi/scsi_pm.c:173:6: error: 'err' undeclared (first use in this function)

[sparse]
drivers/scsi/scsi_pm.c:173:13: sparse: undefined identifier 'err'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
