From: wfg@linux.intel.com
Date: Sun, 08 Jul 2012 17:17:51 +0000
Subject: [clk:hb_3.5 11/12] drivers/ata/ahci_platform.c:129:2: warning: initialization discards 'const' quali
Message-Id: <20120708171751.GA19344@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Rob,

There are new compile warnings show up in

tree:   git://sources.calxeda.com/kernel/linux.git hb_3.5
head:   67e0749b2f1c5908346485f5cb54af9f3a01e047
commit: df55ea8b7785fb704475ad562d445ac402719dc0 [11/12] ahci_platform: add custom hard reset for Calxeda ahci ctrlr

All warnings:

        drivers/ata/ahci_platform.c:129:67: sparse: incorrect type in initializer (different modifiers)
        drivers/ata/ahci_platform.c:129:67:    expected void *data
        drivers/ata/ahci_platform.c:129:67:    got struct ata_port_info static const [toplevel] *
        drivers/ata/ahci_platform.c:125:9: sparse: Initializer entry defined twice
        drivers/ata/ahci_platform.c:125:9:   also defined here
        drivers/ata/ahci_platform.c:129:2: warning: initialization discards 'const' qualifier from pointer target type [enabled by default]

vim +129 drivers/ata/ahci_platform.c
   126	};
   127	
   128	static const struct of_device_id ahci_of_match[] = {
 > 129		{ .compatible = "calxeda,hb-ahci", .data = &ahci_port_info[CALXEDA_AHCI], },
   130		{},
   131	};
   132	MODULE_DEVICE_TABLE(of, ahci_of_match);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
