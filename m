From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 08 Oct 2013 16:43:04 +0000
Subject: build regressions 2013-10-08
Message-Id: <52543618.bjYXBfkx+iTrDWD4%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
ERROR: "cpufreq_cpu_get" undefined!
ERROR: "cpufreq_cpu_put" undefined!
ERROR: "cpufreq_cpu_get" [drivers/gpu/drm/i915/i915.ko] undefined!
ERROR: "cpufreq_cpu_put" [drivers/gpu/drm/i915/i915.ko] undefined!

[sparse]
drivers/pci/pci-sysfs.c:513:18: sparse: symbol 'pci_dev_attrs' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
