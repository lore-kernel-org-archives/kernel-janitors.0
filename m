From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Oct 2017 19:26:10 +0000
Subject: [PATCH 4/5] powerpc-pseries: Return directly after a failed kzalloc_node() in iommu_pseries_alloc_gr
Message-Id: <a824fe65-1708-16ba-68d6-df0f73e0f49a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0d221be4-1402-0499-d95e-afa4a30e1f33@users.sourceforge.net>
In-Reply-To: <0d221be4-1402-0499-d95e-afa4a30e1f33@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Andrew Morton <akpm@linux-foundation.org>, Bart Van Assche <bart.vanassche@sandisk.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Gibson <david@gibson.dropbear.id.au>, Doug Ledford <dledford@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Ellerman <mpe@ellerman.id.au>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh@kernel.org>, Sahil Mehta <sahilmehta17@gmail.com>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Oct 2017 20:15:32 +0200

Return directly after a call of the function "kzalloc_node" failed
at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/platforms/pseries/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index b6c12b8e3ace..207ff8351af1 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -61,7 +61,7 @@ static struct iommu_table_group *iommu_pseries_alloc_group(int node)
 
 	table_group = kzalloc_node(sizeof(*table_group), GFP_KERNEL, node);
 	if (!table_group)
-		goto fail_exit;
+		return NULL;
 
 	tbl = kzalloc_node(sizeof(*tbl), GFP_KERNEL, node);
 	if (!tbl)
-- 
2.14.2

