From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 08:31:47 +0000
Subject: [PATCH 1/4] GPU-DRM-TILCDC: Use kmalloc_array() in kfree_table_init()
Message-Id: <7c0f291e-e05b-1fbe-05a4-54c104829942@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <2f3f7ad7-16a0-1dfb-d073-0d993cd767ee@users.sourceforge.net>
In-Reply-To: <2f3f7ad7-16a0-1dfb-d073-0d993cd767ee@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 09:05:14 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
index f9c79da..8faa28f 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
@@ -32,8 +32,7 @@ static int __init kfree_table_init(struct kfree_table *kft)
 {
 	kft->total = 32;
 	kft->num = 0;
-	kft->table = kmalloc(kft->total * sizeof(*kft->table),
-			     GFP_KERNEL);
+	kft->table = kmalloc_array(kft->total, sizeof(*kft->table), GFP_KERNEL);
 	if (!kft->table)
 		return -ENOMEM;
 
-- 
2.10.0

