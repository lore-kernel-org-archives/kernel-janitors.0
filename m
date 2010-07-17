From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 17 Jul 2010 20:42:19 +0000
Subject: [PATCH 2/4] staging/spectra: removes unused variable
Message-Id: <1279399339.14049.21.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fix a compile warning by removing an unused variable int i.


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/spectra/flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/spectra/flash.c b/drivers/staging/spectra/flash.c
index 134aa51..a0d6094 100644
--- a/drivers/staging/spectra/flash.c
+++ b/drivers/staging/spectra/flash.c
@@ -775,7 +775,7 @@ static void dump_cache_l2_table(void)
 {
 	struct list_head *p;
 	struct spectra_l2_cache_list *pnd;
-	int n, i;
+	int n;
 
 	n = 0;
 	list_for_each(p, &cache_l2.table.list) {
-- 
1.7.0.4



