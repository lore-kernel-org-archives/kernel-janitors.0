From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 06:21:14 +0000
Subject: [PATCH 2/4] GPU-DRM-QXL: Move three assignments in qxl_device_init()
Message-Id: <f7eb26ad-39be-2918-627b-5f4981d07808@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ce810580-cc2b-32cc-a852-a355374c2100@users.sourceforge.net>
In-Reply-To: <ce810580-cc2b-32cc-a852-a355374c2100@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Bhaktipriya Shridhar <bhaktipriya96@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, Tejun Heo <tj@kernel.org>, Thierry Reding <treding@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 22:33:54 +0200

Move the assignments for three data structure members to the end
so that they will only be performed if the desired resource allocations
succeeded by this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/qxl/qxl_kms.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index 76852f1..76780c2 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -212,10 +212,6 @@ static int qxl_device_init(struct qxl_device *qdev,
 	/* TODO - slot initialization should happen on reset. where is our
 	 * reset handler? */
 	qdev->n_mem_slots = qdev->rom->slots_end;
-	qdev->slot_gen_bits = qdev->rom->slot_gen_bits;
-	qdev->slot_id_bits = qdev->rom->slot_id_bits;
-	qdev->va_slot_mask -		(~(uint64_t)0) >> (qdev->slot_id_bits + qdev->slot_gen_bits);
 	qdev->mem_slots = kmalloc_array(qdev->n_mem_slots,
 					sizeof(*qdev->mem_slots),
 					GFP_KERNEL);
@@ -260,7 +256,10 @@ static int qxl_device_init(struct qxl_device *qdev,
 
 
 	INIT_WORK(&qdev->gc_work, qxl_gc_work);
-
+	qdev->slot_gen_bits = qdev->rom->slot_gen_bits;
+	qdev->slot_id_bits = qdev->rom->slot_id_bits;
+	qdev->va_slot_mask +		(~(uint64_t)0) >> (qdev->slot_id_bits + qdev->slot_gen_bits);
 	return 0;
 }
 
-- 
2.10.0

