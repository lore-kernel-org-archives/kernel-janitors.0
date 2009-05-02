From: Julia Lawall <julia@diku.dk>
Date: Sat, 02 May 2009 13:20:23 +0000
Subject: amd_iommu_init.c: possible problem with IVHD_FLAG_HT_TUN_EN
Message-Id: <Pine.LNX.4.64.0905021519390.9563@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: joerg.roedel@amd.com, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The file arch/x86/kernel/amd_iommu_init.c contains the following code:

(starting at line 586 in a recent linux-next)

	h->flags & IVHD_FLAG_HT_TUN_EN ?
		iommu_feature_enable(iommu, CONTROL_HT_TUN_EN) :
		iommu_feature_disable(iommu, CONTROL_HT_TUN_EN);

	h->flags & IVHD_FLAG_PASSPW_EN ?
		iommu_feature_enable(iommu, CONTROL_PASSPW_EN) :
		iommu_feature_disable(iommu, CONTROL_PASSPW_EN);

	h->flags & IVHD_FLAG_RESPASSPW_EN ?
		iommu_feature_enable(iommu, CONTROL_RESPASSPW_EN) :
		iommu_feature_disable(iommu, CONTROL_RESPASSPW_EN);

	h->flags & IVHD_FLAG_ISOC_EN ?
		iommu_feature_enable(iommu, CONTROL_ISOC_EN) :
		iommu_feature_disable(iommu, CONTROL_ISOC_EN);

The only possible value of IVHD_FLAG_HT_TUN_EN, however, seems to be 0, as
defined in the same file, and thus the first test is never true.  Is this
what is intended, or should the test be expressed in another way?

julia

This problem was found using the following semantic match:
(http://www.emn.fr/x-info/coccinelle/)

@r expression@
identifier C;
expression E;
position p;
@@

(
 E & C@p && ...
|
 E & C@p || ...
)

@s@
identifier r.C;
position p1;
@@

#define C 0

@t@
identifier r.C;
expression E != 0;
@@

#define C E

@script:python depends on s && !t@
p << r.p;
C << r.C;
@@

cocci.print_main("and with 0", p)
