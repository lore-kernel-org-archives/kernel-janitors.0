From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 04 Jan 2013 20:10:08 +0000
Subject: build regressions 2013-01-04
Message-Id: <50e73720.UuOU5HrM/EZoE37b%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
(.rodata+0x19c8): undefined reference to `sys_fork'
(.text+0x131202): undefined reference to `i2c_smbus_read_byte_data'
(.text+0x131233): undefined reference to `i2c_smbus_write_byte_data'

[warnings]
arch/microblaze/pci/pci-common.c:1182:1: warning: label 'clear_resource' defined but not used [-Wunused-label]
arch/microblaze/pci/pci-common.c:1436:2: warning: passing argument 3 of 'pci_add_resource_offset' makes integer from pointer without a cast [enabled by default]
/tmp/ccx7EWlc.s:1244: Warning: ignoring changed section attributes for .discard
drivers/mfd/stw481x.c:32:5: warning: unused variable 'regandval' [-Wunused-variable]
drivers/mfd/stw481x.c:132:11: warning: unused variable 'pid' [-Wunused-variable]
drivers/mfd/stw481x.c:132:6: warning: unused variable 'vid' [-Wunused-variable]
sound/oss/pas2_card.c:338:5: warning: too many arguments for format [-Wformat-extra-args]
drivers/net/wan/farsync.c:2399:2: warning: array subscript is above array bounds [-Warray-bounds]

[smatch]
drivers/media/usb/dvb-usb/dw2102.c:1285 m88rs2000_frontend_attach() error: doing dma on the stack (obuf)
drivers/media/usb/dvb-usb/dw2102.c:1285 m88rs2000_frontend_attach() error: doing dma on the stack (ibuf)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
