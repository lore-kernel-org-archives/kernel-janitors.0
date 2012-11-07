From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Wed, 07 Nov 2012 06:52:55 +0000
Subject: [PATCH] staging: tidspbridge: dynload: reloc.c: checkpatch.pl cleanup
Message-Id: <1352271175-9106-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: omar.ramirez@ti.com
Cc: gregkh@linuxfoundation.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

fix for few error messages as reported by checkpatch.pl

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 drivers/staging/tidspbridge/dynload/reloc.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/tidspbridge/dynload/reloc.c b/drivers/staging/tidspbridge/dynload/reloc.c
index 7b28c07..463abdb 100644
--- a/drivers/staging/tidspbridge/dynload/reloc.c
+++ b/drivers/staging/tidspbridge/dynload/reloc.c
@@ -45,7 +45,7 @@ static const char bsssymbol[] = { ".bss" };
  * Effect:
  *	Extracts the specified field and returns it.
  ************************************************************************* */
-rvalue dload_unpack(struct dload_state *dlthis, tgt_au_t * data, int fieldsz,
+rvalue dload_unpack(struct dload_state *dlthis, tgt_au_t *data, int fieldsz,
 		    int offset, unsigned sgn)
 {
 	register rvalue objval;
@@ -98,7 +98,7 @@ rvalue dload_unpack(struct dload_state *dlthis, tgt_au_t * data, int fieldsz,
  ************************************************************************* */
 static const unsigned char ovf_limit[] = { 1, 2, 2 };
 
-int dload_repack(struct dload_state *dlthis, rvalue val, tgt_au_t * data,
+int dload_repack(struct dload_state *dlthis, rvalue val, tgt_au_t *data,
 		 int fieldsz, int offset, unsigned sgn)
 {
 	register urvalue objval, mask;
@@ -161,7 +161,7 @@ static const u8 c60_scale[SCALE_MASK + 1] = {
  * Effect:
  *	Performs the specified relocation operation
  ************************************************************************* */
-void dload_relocate(struct dload_state *dlthis, tgt_au_t * data,
+void dload_relocate(struct dload_state *dlthis, tgt_au_t *data,
 		    struct reloc_record_t *rp, bool *tramps_generated,
 		    bool second_pass)
 {
-- 
1.7.9.5

