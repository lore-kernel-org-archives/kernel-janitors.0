From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Wed, 01 Jan 2020 17:49:50 +0000
Subject: [PATCH 10/10] powerpc/powernv: use resource_size
Message-Id: <1577900990-8588-11-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>, kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

Use resource_size rather than a verbose computation on
the end and start fields.

The semantic patch that makes these changes is as follows:
(http://coccinelle.lip6.fr/)

<smpl>
@@ struct resource ptr; @@
- (ptr.end - ptr.start + 1)
+ resource_size(&ptr)
</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 arch/powerpc/platforms/powernv/pci-ioda.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index da1068a9c263..364140145ce0 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -792,7 +792,7 @@ static int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 		fcomp = OPAL_IGNORE_RID_FUNCTION_NUMBER;
 		parent = pe->pbus->self;
 		if (pe->flags & PNV_IODA_PE_BUS_ALL)
-			count = pe->pbus->busn_res.end - pe->pbus->busn_res.start + 1;
+			count = resource_size(&pe->pbus->busn_res);
 		else
 			count = 1;
 
@@ -874,7 +874,7 @@ static int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 		fcomp = OPAL_IGNORE_RID_FUNCTION_NUMBER;
 		parent = pe->pbus->self;
 		if (pe->flags & PNV_IODA_PE_BUS_ALL)
-			count = pe->pbus->busn_res.end - pe->pbus->busn_res.start + 1;
+			count = resource_size(&pe->pbus->busn_res);
 		else
 			count = 1;
 
