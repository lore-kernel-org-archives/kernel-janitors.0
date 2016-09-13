From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 20:46:31 +0000
Subject: [PATCH 4/7] AGPGART-SGI: Use kmalloc_array() in agp_sgi_init()
Message-Id: <1fbcb4e9-7927-466a-92d4-d554d095dddb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5204ca92-2cdf-8115-567c-4ac29816fcec@users.sourceforge.net>
In-Reply-To: <5204ca92-2cdf-8115-567c-4ac29816fcec@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 21:30:58 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/agp/sgi-agp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/agp/sgi-agp.c b/drivers/char/agp/sgi-agp.c
index 3051c73..798ad20 100644
--- a/drivers/char/agp/sgi-agp.c
+++ b/drivers/char/agp/sgi-agp.c
@@ -280,9 +280,9 @@ static int agp_sgi_init(void)
 	else
 		return 0;
 
-	sgi_tioca_agp_bridges = kmalloc(tioca_gart_found *
-					sizeof(struct agp_bridge_data *),
-					GFP_KERNEL);
+	sgi_tioca_agp_bridges = kmalloc_array(tioca_gart_found,
+					      sizeof(*sgi_tioca_agp_bridges),
+					      GFP_KERNEL);
 	if (!sgi_tioca_agp_bridges)
 		return -ENOMEM;
 
-- 
2.10.0

