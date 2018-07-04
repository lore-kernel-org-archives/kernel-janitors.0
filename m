From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jul 2018 09:46:15 +0000
Subject: [PATCH] drm/amd/display: off by one in find_irq_source_info()
Message-Id: <20180704094615.ctabdm4cxbkdvuap@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <harry.wentland@amd.com>
Cc: David Airlie <airlied@linux.ie>, Tony Cheng <Tony.Cheng@amd.com>, kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

The ->info[] array has DAL_IRQ_SOURCES_NUMBER elements so this condition
should be >= instead of > or we could read one element beyond the end of
the array.

Fixes: 4562236b3bc0 ("drm/amd/dc: Add dc display driver (v2)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
index dcdfa0f01551..604bea01fc13 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
@@ -78,7 +78,7 @@ const struct irq_source_info *find_irq_source_info(
 	struct irq_service *irq_service,
 	enum dc_irq_source source)
 {
-	if (source > DAL_IRQ_SOURCES_NUMBER || source < DC_IRQ_SOURCE_INVALID)
+	if (source >= DAL_IRQ_SOURCES_NUMBER || source < DC_IRQ_SOURCE_INVALID)
 		return NULL;
 
 	return &irq_service->info[source];
