From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 17 Oct 2017 12:14:00 +0000
Subject: [PATCH 3/3] powerpc-opal: Fix a typo in a comment line of two file headers
Message-Id: <57c47bff-63a2-62c1-2708-c351c2182304@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5fb4f314-cd23-c439-ab13-96b8188070e0@users.sourceforge.net>
In-Reply-To: <5fb4f314-cd23-c439-ab13-96b8188070e0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Anju T Sudhakar <anju@linux.vnet.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bhumika Goyal <bhumirks@gmail.com>, Corentin Labbe <clabbe.montjoie@gmail.com>, Hemant Kumar <hemant@linux.vnet.ibm.com>, Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>, Neelesh Gupta <neelegup@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh@kernel.org>, Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 17 Oct 2017 13:31:42 +0200

Fix a word in these descriptions.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/platforms/powernv/opal-hmi.c           | 2 +-
 arch/powerpc/platforms/powernv/opal-memory-errors.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-hmi.c b/arch/powerpc/platforms/powernv/opal-hmi.c
index 92b1e12a7eed..481a004b1b6d 100644
--- a/arch/powerpc/platforms/powernv/opal-hmi.c
+++ b/arch/powerpc/platforms/powernv/opal-hmi.c
@@ -1,5 +1,5 @@
 /*
- * OPAL hypervisor Maintenance interrupt handling support in PowreNV.
+ * OPAL hypervisor Maintenance interrupt handling support in PowerNV.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
diff --git a/arch/powerpc/platforms/powernv/opal-memory-errors.c b/arch/powerpc/platforms/powernv/opal-memory-errors.c
index 875e80ab96d9..fd500b379560 100644
--- a/arch/powerpc/platforms/powernv/opal-memory-errors.c
+++ b/arch/powerpc/platforms/powernv/opal-memory-errors.c
@@ -1,5 +1,5 @@
 /*
- * OPAL asynchronus Memory error handling support in PowreNV.
+ * OPAL asynchronus Memory error handling support in PowerNV.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
-- 
2.14.2

