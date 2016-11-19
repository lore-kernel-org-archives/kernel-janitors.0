From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Sat, 19 Nov 2016 17:41:24 +0000
Subject: [PATCH] coresight: perf: Add a missing call to etm_free_aux
Message-Id: <20161119174124.20136-1-lambert.quentin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Most error branches following the call to alloc_event_data contain a call to
etm_free_aux. This patch add a call to etm_free_aux to an error branch
that does not call it.

This issue was found with Hector.

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -215,7 +215,7 @@ static void *etm_setup_aux(int event_cpu
 	 */
 	sink = coresight_get_enabled_sink(true);
 	if (!sink)
-		return NULL;
+		goto err;
 
 	INIT_WORK(&event_data->work, free_event_data);
 
