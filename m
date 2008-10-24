From: "anubhav rakshit" <anubhavrocks@gmail.com>
Date: Fri, 24 Oct 2008 12:34:28 +0000
Subject: [PATCH]Correct the wordings of a comment in arch/arm/mm/mmu.c
Message-Id: <623132dc0810240522g660b922fo6365f6c53874d886@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Anubhav Rakshit <anubhavrocks@gmail.com>
---
 arch/arm/mm/mmu.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index 8ba7540..3cd21b5 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -739,7 +739,7 @@ void __init reserve_node_zero(pg_data_t *pgdat)
 }

 /*
- * Set up device the mappings.  Since we clear out the page tables for all
+ * Set up device mappings.  Since we clear out the page tables for all
  * mappings above VMALLOC_END, we will remove any debug device mappings.
  * This means you have to be careful how you debug this function, or any
  * called function.  This means you can't use any function or debugging
-- 
1.5.4.3
