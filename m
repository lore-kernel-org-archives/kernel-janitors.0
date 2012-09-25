From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 25 Sep 2012 09:14:26 +0000
Subject: arch/alpha/kernel/pci.c:311:25: error: 'bridge' undeclared
Message-Id: <20120925091426.GB27512@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Yinghai,

FYI, kernel build failed on

commit: e77e2cb0193c67de446ad32579348b9c846f5034 PCI, alpha: kill pci_root_buses
config: alpha-defconfig


All error/warnings:

arch/alpha/kernel/pci.c: In function 'pcibios_claim_console_setup':
arch/alpha/kernel/pci.c:310:2: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
arch/alpha/kernel/pci.c:311:25: error: 'bridge' undeclared (first use in this function)
arch/alpha/kernel/pci.c:311:25: note: each undeclared identifier is reported only once for each function it appears in

vim +311 arch/alpha/kernel/pci.c
   305	static void __init
   306	pcibios_claim_console_setup(void)
   307	{
   308		struct pci_host_bridge *host_bridge = NULL;
   309	
   310		for_each_pci_host_bridge(host_bridge)
 > 311			pcibios_claim_one_bus(bridge->bus);
   312	}
   313	
   314	void __init

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
