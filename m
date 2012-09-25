From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 25 Sep 2012 10:27:15 +0000
Subject: ERROR: "pci_get_next_host_bridge" [drivers/edac/i7core_edac.ko] undefined!
Message-Id: <20120925102715.GA1188@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Yinghai,

FYI, kernel build failed on

abe5bd665066edee54a0f32561767e3c11e08300  PCI, edac: kill pci_find_next_bus in edac
i386-allmodconfig

ERROR: "pci_get_next_host_bridge" [drivers/edac/i7core_edac.ko] undefined!

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
