From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 02 Jan 2013 23:12:49 +0000
Subject: build regressions 2013-01-02
Message-Id: <50e4bef1.24wCWOGSxYOZ34YW%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
(.text+0x2684bf): multiple definition of `pci_get_domain_bus_and_slot'
drivers/pci/built-in.o:(.text+0x8012): first defined here
drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c:3290:1: error: static declaration of 'qlcnic_restore_indev_addr' follows non-static declaration
drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.c:512:15: error: 'PCI_IOV_RESOURCES' undeclared (first use in this function)

[warnings]
drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.c:515:3: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.c:515:3: warning: right shift count >= width of type [enabled by default]
drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.c:515:3: warning: passing argument 1 of '__div64_32' from incompatible pointer type [enabled by default]

[smatch]
drivers/media/dvb-core/dvb_ca_en50221.c:1251 dvb_ca_en50221_io_do_ioctl() warn: inconsistent returns mutex:&ca->ioctl_mutex: locked (1231) unlocked (1198,1251)
fs/gfs2/trans.c:176 databuf_lo_add() error: we previously assumed 'tr' could be null (see line 168)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
