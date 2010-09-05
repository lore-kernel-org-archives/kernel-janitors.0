From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sun, 05 Sep 2010 18:32:49 +0000
Subject: [PATCH 08/14] staging: tidspbridge: check return code of kzalloc
Message-Id: <1283711569-7418-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Vasiliy Kulikov <segooon@gmail.com>, Greg Kroah-Hartman <gregkh@suse.de>, Rene Sapiens <rene.sapiens@ti.com>, Nishanth Menon <nm@ti.com>, Ernesto Ramos <ernesto@ti.com>, Felipe Contreras <felipe.contreras@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Vasiliy Kulikov <segooon@gmail.com>

Function kzalloc may fail. Check for it.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 I couldn't compile this driver at all, so it is not tested.

 drivers/staging/tidspbridge/rmgr/dbdcd.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/tidspbridge/rmgr/dbdcd.c b/drivers/staging/tidspbridge/rmgr/dbdcd.c
index f71e860..3581a55 100644
--- a/drivers/staging/tidspbridge/rmgr/dbdcd.c
+++ b/drivers/staging/tidspbridge/rmgr/dbdcd.c
@@ -487,6 +487,10 @@ int dcd_get_object_def(struct dcd_manager *hdcd_mgr,
 
 	/* Allocate zeroed buffer. */
 	psz_coff_buf = kzalloc(ul_len + 4, GFP_KERNEL);
+	if (psz_coff_buf = NULL) {
+		status = -ENOMEM;
+		goto func_end;
+	}
 #ifdef _DB_TIOMAP
 	if (strstr(dcd_key->path, "iva") = NULL) {
 		/* Locate section by objectID and read its content. */
@@ -571,6 +575,10 @@ int dcd_get_objects(struct dcd_manager *hdcd_mgr,
 
 	/* Allocate zeroed buffer. */
 	psz_coff_buf = kzalloc(ul_len + 4, GFP_KERNEL);
+	if (psz_coff_buf = NULL) {
+		status = -ENOMEM;
+		goto func_cont;
+	}
 #ifdef _DB_TIOMAP
 	if (strstr(sz_coff_path, "iva") = NULL) {
 		/* Locate section by objectID and read its content. */
-- 
1.7.0.4

