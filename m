From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 30 Jul 2010 11:09:22 +0000
Subject: [PATCH 7/9] staging: tidspbridge: fix memory leak
Message-Id: <1280488163-20939-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Rene Sapiens <rene.sapiens@ti.com>, Felipe Contreras <felipe.contreras@gmail.com>, Nishanth Menon <nm@ti.com>, Omar Ramirez Luna <omar.ramirez@ti.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

dbll_create() leaks pzl_target if target_obj is NULL. Call kzalloc()
only if memory is used.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/tidspbridge/pmgr/dbll.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/tidspbridge/pmgr/dbll.c b/drivers/staging/tidspbridge/pmgr/dbll.c
index 3636aa3..86840ce 100644
--- a/drivers/staging/tidspbridge/pmgr/dbll.c
+++ b/drivers/staging/tidspbridge/pmgr/dbll.c
@@ -247,9 +247,9 @@ int dbll_create(struct dbll_tar_obj **target_obj,
 	DBC_REQUIRE(pattrs != NULL);
 	DBC_REQUIRE(target_obj != NULL);
 
-	/* Allocate DBL target object */
-	pzl_target = kzalloc(sizeof(struct dbll_tar_obj), GFP_KERNEL);
 	if (target_obj != NULL) {
+		/* Allocate DBL target object */
+		pzl_target = kzalloc(sizeof(struct dbll_tar_obj), GFP_KERNEL);
 		if (pzl_target = NULL) {
 			*target_obj = NULL;
 			status = -ENOMEM;
-- 
1.7.0.4

