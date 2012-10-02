From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 02 Oct 2012 07:56:23 +0000
Subject: [yinghai:for-pci-next 102/103] drivers/acpi/pci_root.c:626:14: warning: unused variable 'handle'
Message-Id: <20121002075623.GE24180@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Yinghai,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/yinghai/linux-yinghai.git for-pci-next
head:   6689ac2f7e4750ad64e885cbc5d6aad3620579fe
commit: 4c042add99193c3fea6f9878af3a8839137e7064 [102/103] PCI, ACPI: using acpi/pci bind path for pci_host_bridge
config: i386-alldefconfig

All warnings:

drivers/acpi/pci_root.c: In function 'acpi_pci_root_remove':
drivers/acpi/pci_root.c:626:14: warning: unused variable 'handle' [-Wunused-variable]
drivers/acpi/pci_root.c:625:14: warning: unused variable 'status' [-Wunused-variable]

vim +626 drivers/acpi/pci_root.c

4be44fcd (Len Brown      2005-08-05  623) static int acpi_pci_root_remove(struct acpi_device *device, int type)
^1da177e (Linus Torvalds 2005-04-16  624) {
d8888698 (Yinghai Lu     2012-09-27  625) 	acpi_status status;
d8888698 (Yinghai Lu     2012-09-27 @626) 	acpi_handle handle;
caf420c6 (Bjorn Helgaas  2009-06-18  627) 	struct acpi_pci_root *root = acpi_driver_data(device);
c8e9afb1 (Jiang Liu      2012-09-18  628) 	struct acpi_pci_driver *driver;
c8e9afb1 (Jiang Liu      2012-09-18  629) 
c553d376 (Yinghai Lu     2012-09-27  630) 	pci_stop_root_bus(root->bus);
c553d376 (Yinghai Lu     2012-09-27  631) 
d0020f65 (Taku Izumi     2012-09-18  632) 	mutex_lock(&acpi_pci_root_lock);
e8ca311c (Yinghai Lu     2012-09-27  633) 	list_for_each_entry_reverse(driver, &acpi_pci_drivers, node)
c8e9afb1 (Jiang Liu      2012-09-18  634) 		if (driver->remove)

The code at line 626 was first introduced by commit:
d888869 PCI, ACPI: delete root bus prt during hot remove path

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
