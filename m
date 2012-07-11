From: wfg@linux.intel.com
Date: Wed, 11 Jul 2012 08:24:58 +0000
Subject: [yinghai:for-pci-pcie-link 104/104] drivers/pci/pcie-sysfs.c:27:25: sparse: symbol 'pcie_link_disabl
Message-Id: <20120711082458.GA23164@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Y7xTucakfITjPcLV"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yinghai,

There are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/yinghai/linux-yinghai.git for-pci-pcie-link
head:   d6396cb3ed85b8a95bd07d9c8f8f70b96a8f3d11
commit: d6396cb3ed85b8a95bd07d9c8f8f70b96a8f3d11 [104/104] PCI: Add link_disable in /sysfs for pcie device

All sparse warnings:

+ drivers/pci/pcie-sysfs.c:27:25: sparse: symbol 'pcie_link_disable_attr' was not declared. Should it be static?
  drivers/pci/pcie-sysfs.c:53:24: sparse: symbol 'pci_dev_pcie_attr_group' was not declared. Should it be static?

vim +27 drivers/pci/pcie-sysfs.c
    24		return count;
    25	}
    26	
  > 27	struct device_attribute pcie_link_disable_attr =
    28			__ATTR(pcie_link_disable, 0644,
    29			       pcie_link_disable_show, pcie_link_disable_store);
    30	

Please consider folding the attached diff :-)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

--Y7xTucakfITjPcLV
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-d6396cb.diff"

diff --git a/drivers/pci/pcie-sysfs.c b/drivers/pci/pcie-sysfs.c
index 04cf34d..4f62d4d 100644
--- a/drivers/pci/pcie-sysfs.c
+++ b/drivers/pci/pcie-sysfs.c
@@ -24,7 +24,7 @@ pcie_link_disable_store(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
-struct device_attribute pcie_link_disable_attr =
+static struct device_attribute pcie_link_disable_attr =
 		__ATTR(pcie_link_disable, 0644,
 		       pcie_link_disable_show, pcie_link_disable_store);
 
@@ -50,7 +50,7 @@ static umode_t pci_dev_pcie_attrs_are_visible(struct kobject *kobj,
 	return a->mode;
 }
 
-struct attribute_group pci_dev_pcie_attr_group = {
+static struct attribute_group pci_dev_pcie_attr_group = {
 	.is_visible = pci_dev_pcie_attrs_are_visible,
 	.attrs	    = pci_dev_pcie_dev_attrs,
 };

--Y7xTucakfITjPcLV--
