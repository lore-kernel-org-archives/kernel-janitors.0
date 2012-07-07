From: wfg@linux.intel.com
Date: Sat, 07 Jul 2012 17:21:37 +0000
Subject: [usb:usb-next 100/101] drivers/usb/chipidea/ci13xxx_pci.c:26:30: sparse: symbol 'pci_platdata' was n
Message-Id: <20120707172137.GA25074@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="J2SCkAp4GZ/dPZZf"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

There are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   336c5c310e8f0d5baba7973765339eaf5d989fe1
commit: 77c4400f2f0fd8384ab5cbe41d81ccc664896b2d [100/101] USB: Chipidea: rename struct ci13xxx_udc_driver to struct ci13xxx_platform_data

All sparse warnings:

+ drivers/usb/chipidea/ci13xxx_pci.c:26:30: sparse: symbol 'pci_platdata' was not declared. Should it be static?
+ drivers/usb/chipidea/ci13xxx_pci.c:31:30: sparse: symbol 'langwell_pci_platdata' was not declared. Should it be static?
+ drivers/usb/chipidea/ci13xxx_pci.c:36:30: sparse: symbol 'penwell_pci_platdata' was not declared. Should it be static?

Please consider folding the attached diff :-)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

--J2SCkAp4GZ/dPZZf
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-77c4400.diff"

diff --git a/drivers/usb/chipidea/ci13xxx_pci.c b/drivers/usb/chipidea/ci13xxx_pci.c
index cdcac3a..5ce8698 100644
--- a/drivers/usb/chipidea/ci13xxx_pci.c
+++ b/drivers/usb/chipidea/ci13xxx_pci.c
@@ -23,17 +23,17 @@
 /******************************************************************************
  * PCI block
  *****************************************************************************/
-struct ci13xxx_platform_data pci_platdata = {
+static struct ci13xxx_platform_data pci_platdata = {
 	.name		= UDC_DRIVER_NAME,
 	.capoffset	= DEF_CAPOFFSET,
 };
 
-struct ci13xxx_platform_data langwell_pci_platdata = {
+static struct ci13xxx_platform_data langwell_pci_platdata = {
 	.name		= UDC_DRIVER_NAME,
 	.capoffset	= 0,
 };
 
-struct ci13xxx_platform_data penwell_pci_platdata = {
+static struct ci13xxx_platform_data penwell_pci_platdata = {
 	.name		= UDC_DRIVER_NAME,
 	.capoffset	= 0,
 	.power_budget	= 200,

--J2SCkAp4GZ/dPZZf--
