From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 06:20:11 +0000
Subject: [PATCH 1/4] GPU-DRM-QXL: Use kmalloc_array() in qxl_device_init()
Message-Id: <269141d5-6562-3d70-b823-283ecde6e09c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ce810580-cc2b-32cc-a852-a355374c2100@users.sourceforge.net>
In-Reply-To: <ce810580-cc2b-32cc-a852-a355374c2100@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Bhaktipriya Shridhar <bhaktipriya96@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, Tejun Heo <tj@kernel.org>, Thierry Reding <treding@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 22:26:08 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

* Add a bit of exception handling for a detected null pointer.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/qxl/qxl_kms.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index e642242..76852f1 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -216,10 +216,11 @@ static int qxl_device_init(struct qxl_device *qdev,
 	qdev->slot_id_bits = qdev->rom->slot_id_bits;
 	qdev->va_slot_mask  		(~(uint64_t)0) >> (qdev->slot_id_bits + qdev->slot_gen_bits);
-
-	qdev->mem_slots -		kmalloc(qdev->n_mem_slots * sizeof(struct qxl_memslot),
-			GFP_KERNEL);
+	qdev->mem_slots = kmalloc_array(qdev->n_mem_slots,
+					sizeof(*qdev->mem_slots),
+					GFP_KERNEL);
+	if (!qdev->mem_slots)
+		return -ENOMEM;
 
 	idr_init(&qdev->release_idr);
 	spin_lock_init(&qdev->release_idr_lock);
-- 
2.10.0

