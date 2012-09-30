From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 30 Sep 2012 09:15:52 +0000
Subject: [yinghai:for-pci-next 104/106] drivers/acpi/pci_root.c:615:24: warning: unused variable 'root'
Message-Id: <20120930091552.GA9912@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Yinghai,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/yinghai/linux-yinghai.git for-pci-next
head:   a25307aeaa18db187698191c0e91d8094d487af7
commit: fe369a44aaa8abb3d439a03c5a69c303ea7d727b [104/106] PCI, ACPI: Move pci_bus_add_devices into acpi_pci_root_add
config: x86_64-allmodconfig

All warnings:

drivers/acpi/pci_root.c: In function 'acpi_pci_root_start':
drivers/acpi/pci_root.c:615:24: warning: unused variable 'root' [-Wunused-variable]

vim +615 drivers/acpi/pci_root.c

2d532571 (Yinghai Lu     2012-09-30  599) 
fe369a44 (Yinghai Lu     2012-09-30  600) 	pci_bus_add_devices(root->bus);
fe369a44 (Yinghai Lu     2012-09-30  601) 
f5eebbe1 (Bjorn Helgaas  2009-06-18  602) 	return 0;
^1da177e (Linus Torvalds 2005-04-16  603) 
6507e6eb (Taku Izumi     2012-09-18  604) out_del_root:
6507e6eb (Taku Izumi     2012-09-18  605) 	mutex_lock(&acpi_pci_root_lock);
6507e6eb (Taku Izumi     2012-09-18  606) 	list_del(&root->node);
6507e6eb (Taku Izumi     2012-09-18  607) 	mutex_unlock(&acpi_pci_root_lock);
f5eebbe1 (Bjorn Helgaas  2009-06-18  608) end:
f5eebbe1 (Bjorn Helgaas  2009-06-18  609) 	kfree(root);
d550d98d (Patrick Mochel 2006-06-27  610) 	return result;
^1da177e (Linus Torvalds 2005-04-16  611) }
^1da177e (Linus Torvalds 2005-04-16  612) 
4be44fcd (Len Brown      2005-08-05  613) static int acpi_pci_root_start(struct acpi_device *device)
c431ada4 (Rajesh Shah    2005-04-28  614) {
caf420c6 (Bjorn Helgaas  2009-06-18 @615) 	struct acpi_pci_root *root = acpi_driver_data(device);
c8e9afb1 (Jiang Liu      2012-09-18  616) 
caf420c6 (Bjorn Helgaas  2009-06-18  617) 	return 0;
c431ada4 (Rajesh Shah    2005-04-28  618) }
^1da177e (Linus Torvalds 2005-04-16  619) 
4be44fcd (Len Brown      2005-08-05  620) static int acpi_pci_root_remove(struct acpi_device *device, int type)
^1da177e (Linus Torvalds 2005-04-16  621) {
caf420c6 (Bjorn Helgaas  2009-06-18  622) 	struct acpi_pci_root *root = acpi_driver_data(device);
c8e9afb1 (Jiang Liu      2012-09-18  623) 

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
