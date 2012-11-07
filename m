From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Wed, 07 Nov 2012 06:38:37 +0000
Subject: [PATCH] staging: tidspbridge: dynload: dload_internal.h: fix for coding style issue
Message-Id: <1352270317-8361-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: omar.ramirez@ti.com
Cc: gregkh@linuxfoundation.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

fixed few error messages as reported by checkpatch.pl

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 .../staging/tidspbridge/dynload/dload_internal.h   |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/tidspbridge/dynload/dload_internal.h b/drivers/staging/tidspbridge/dynload/dload_internal.h
index 7b77573..b9d079b 100644
--- a/drivers/staging/tidspbridge/dynload/dload_internal.h
+++ b/drivers/staging/tidspbridge/dynload/dload_internal.h
@@ -313,14 +313,14 @@ extern uint32_t dload_reverse_checksum16(void *data, unsigned siz);
 /*
  * exported by reloc.c
  */
-extern void dload_relocate(struct dload_state *dlthis, tgt_au_t * data,
-			   struct reloc_record_t *rp, bool * tramps_generated,
+extern void dload_relocate(struct dload_state *dlthis, tgt_au_t *data,
+			   struct reloc_record_t *rp, bool *tramps_generated,
 			   bool second_pass);
 
-extern rvalue dload_unpack(struct dload_state *dlthis, tgt_au_t * data,
+extern rvalue dload_unpack(struct dload_state *dlthis, tgt_au_t *data,
 			   int fieldsz, int offset, unsigned sgn);
 
-extern int dload_repack(struct dload_state *dlthis, rvalue val, tgt_au_t * data,
+extern int dload_repack(struct dload_state *dlthis, rvalue val, tgt_au_t *data,
 			int fieldsz, int offset, unsigned sgn);
 
 /*
-- 
1.7.9.5

