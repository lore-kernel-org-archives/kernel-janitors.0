From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Sep 2016 12:16:28 +0000
Subject: [PATCH 04/17] s390/debug: Rename jump labels in debug_areas_alloc()
Message-Id: <6ee03537-9ec5-70ca-bc18-44499909d251@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <e4359dc9-9e20-e33b-9743-9ebade853268@users.sourceforge.net>
In-Reply-To: <e4359dc9-9e20-e33b-9743-9ebade853268@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-s390@vger.kernel.org, David Hildenbrand <dahi@linux.vnet.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Joe Perches <joe@perches.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 1 Sep 2016 18:10:21 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/s390/kernel/debug.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/s390/kernel/debug.c b/arch/s390/kernel/debug.c
index 5bb9108..0af14a4 100644
--- a/arch/s390/kernel/debug.c
+++ b/arch/s390/kernel/debug.c
@@ -198,33 +198,32 @@ debug_areas_alloc(int pages_per_area, int nr_areas)
 
 	areas = kmalloc_array(nr_areas, sizeof(*areas), GFP_KERNEL);
 	if (!areas)
-		goto fail_malloc_areas;
+		goto exit;
 	for (i = 0; i < nr_areas; i++) {
 		areas[i] = kmalloc_array(pages_per_area,
 					 sizeof(*areas[i]),
 					 GFP_KERNEL);
 		if (!areas[i])
-			goto fail_malloc_areas2;
+			goto free_areas;
 		for (j = 0; j < pages_per_area; j++) {
 			areas[i][j] = kzalloc(PAGE_SIZE, GFP_KERNEL);
 			if (!areas[i][j]) {
 				for (j--; j >= 0; j--)
 					kfree(areas[i][j]);
 				kfree(areas[i]);
-				goto fail_malloc_areas2;
+				goto free_areas;
 			}
 		}
 	}
 	return areas;
-
-fail_malloc_areas2:
+ free_areas:
 	for (i--; i >= 0; i--) {
 		for (j = 0; j < pages_per_area; j++)
 			kfree(areas[i][j]);
 		kfree(areas[i]);
 	}
 	kfree(areas);
-fail_malloc_areas:
+ exit:
 	return NULL;
 
 }
-- 
2.9.3

