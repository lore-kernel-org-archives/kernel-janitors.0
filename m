From: Spyros Papageorgiou <spyros.papageorgiou@gmail.com>
Date: Mon, 31 May 2010 15:04:13 +0000
Subject: [PATCH] Drivers: Stagins: memrar: cleanup
Message-Id: <4C03CFED.2030101@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de
Cc: ossama.othman@intel.com, devel@driverdev.osuosl.org, Kernel development list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From:Spyros Papageorgiou <spyros.papageorgiou@gmai.com>

Removed an unneeded struct specifier in function call.

Signed-off-by: Spyros Papageorgiou <spyros.papageorgiou@gmai.com>
---
 drivers/staging/memrar/memrar_allocator.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/memrar/memrar_allocator.c b/drivers/staging/memrar/memrar_allocator.c
index a4f8c58..db37c6a 100644
--- a/drivers/staging/memrar/memrar_allocator.c
+++ b/drivers/staging/memrar/memrar_allocator.c
@@ -276,7 +276,7 @@ long memrar_allocator_free(struct memrar_allocator *allocator,
 
 		struct memrar_address_range * const chunk  			&list_entry(pos,
-				    struct memrar_address_ranges,
+				    memrar_address_ranges,
 				    list)->range;
 
 		/* Extend size of existing free adjacent chunk. */
@@ -300,7 +300,7 @@ long memrar_allocator_free(struct memrar_allocator *allocator,
 
 			struct memrar_address_ranges const * const next  				list_entry(pos->next,
-					   struct memrar_address_ranges,
+					   memrar_address_ranges,
 					   list);
 
 			chunk->end = handle->end;
@@ -352,7 +352,7 @@ long memrar_allocator_free(struct memrar_allocator *allocator,
 
 			struct memrar_address_ranges const * const prev  				list_entry(pos->prev,
-					   struct memrar_address_ranges,
+					   memrar_address_ranges,
 					   list);
 
 			chunk->begin = handle->begin;
-- 
1.7.0.4
