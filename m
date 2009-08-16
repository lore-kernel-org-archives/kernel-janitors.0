From: Leonardo Potenza <lpotenza@inwind.it>
Date: Sun, 16 Aug 2009 18:40:08 +0000
Subject: [PATCH] drivers/pci: fix section mismatch warnings in intel-iommu.c
Message-Id: <200908162040.08661.lpotenza@inwind.it>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: jbarnes@virtuousgeek.org, linux-kernel@vger.kernel.org

From: Leonardo Potenza <lpotenza@inwind.it>

The functions si_domain_init() and iommu_prepare_static_identity_mapping() have been marked __init, in order to address the following section mismatch messages:

WARNING: drivers/pci/built-in.o(.text+0x3c4e5): Section mismatch in reference from the function si_domain_init() to the function .init.text:si_domain_work_fn()
The function si_domain_init() references
the function __init si_domain_work_fn().
This is often because si_domain_init lacks a __init 
annotation or the annotation of si_domain_work_fn is wrong.

WARNING: drivers/built-in.o(.text+0x415a5): Section mismatch in reference from the function si_domain_init() to the function .init.text:si_domain_work_fn()
The function si_domain_init() references
the function __init si_domain_work_fn().
This is often because si_domain_init lacks a __init 
annotation or the annotation of si_domain_work_fn is wrong.

Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>
---
Index: linux-2.6/drivers/pci/intel-iommu.c
=================================--- linux-2.6.orig/drivers/pci/intel-iommu.c	2009-08-16 19:29:32.000000000 +0200
+++ linux-2.6/drivers/pci/intel-iommu.c	2009-08-16 19:31:12.000000000 +0200
@@ -2047,7 +2047,7 @@ static int __init si_domain_work_fn(unsi
 
 }
 
-static int si_domain_init(void)
+static int __init si_domain_init(void)
 {
 	struct dmar_drhd_unit *drhd;
 	struct intel_iommu *iommu;
@@ -2165,7 +2165,7 @@ static int iommu_should_identity_map(str
 	return 1;
 }
 
-static int iommu_prepare_static_identity_mapping(void)
+static int __init iommu_prepare_static_identity_mapping(void)
 {
 	struct pci_dev *pdev = NULL;
 	int ret;
