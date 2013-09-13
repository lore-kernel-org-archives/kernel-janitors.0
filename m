From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Sep 2013 12:53:10 +0000
Subject: [patch 3/4 v2] skd: use memcpy() as a cleanup
Message-Id: <20130913125310.GK25896@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <CAMuHMdX88cUEu2dmamEttK=9Lv0TKiZauCtPDLbgKUde+8ufyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: Jeff Moyer <jmoyer@redhat.com>, Ramprasad Chinthekindi <rchinthekindi@stec-inc.com>, Akhil Bhansali <abhansali@stec-inc.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The code here is copying the version to inq.driver_version but we don't
want it to be NUL terminated.  Instead we pad the rest of the array with
spaces.  It's fewer lines to use memcpy() and maybe a little nicer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: use memcpy() instead of strncpy()

diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
index f892d95..20ad843 100644
--- a/drivers/block/skd_main.c
+++ b/drivers/block/skd_main.c
@@ -2899,9 +2899,7 @@ static void skd_do_inq_page_da(struct skd_device *skdev,
 			       volatile struct fit_comp_error_info *skerr,
 			       uint8_t *cdb, uint8_t *buf)
 {
-	unsigned ver_byte;
 	unsigned max_bytes;
-	char *ver = DRV_VER_COMPL;
 	struct driver_inquiry_data inq;
 	u16 val;
 
@@ -2945,12 +2943,8 @@ static void skd_do_inq_page_da(struct skd_device *skdev,
 	/* Driver version, fixed lenth, padded with spaces on the right */
 	inq.driver_version_length = sizeof(inq.driver_version);
 	memset(&inq.driver_version, ' ', sizeof(inq.driver_version));
-	for (ver_byte = 0; ver_byte < sizeof(inq.driver_version); ver_byte++) {
-		if (ver[ver_byte] != 0)
-			inq.driver_version[ver_byte] = ver[ver_byte];
-		else
-			break;
-	}
+	memcpy(inq.driver_version, DRV_VER_COMPL,
+	       min(sizeof(inq.driver_version), strlen(DRV_VER_COMPL)));
 
 	inq.page_length = cpu_to_be16((sizeof(inq) - 4));
 
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
