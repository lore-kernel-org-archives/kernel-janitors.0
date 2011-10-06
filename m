From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Oct 2011 06:30:25 +0000
Subject: [patch] edac_amd64: cleanup return type of amd64_determine_edac_cap()
Message-Id: <20111006063025.GA2615@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Sparse complains that edac_cap was declared as dev_type and we are
returning edac_type.  Historically, edac_type was correct but since
then we have changed it to return a bit field.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 367756a..c9eee6d 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -768,10 +768,10 @@ static int get_channel_from_ecc_syndrome(struct mem_ctl_info *, u16);
  * Determine if the DIMMs have ECC enabled. ECC is enabled ONLY if all the DIMMs
  * are ECC capable.
  */
-static enum edac_type amd64_determine_edac_cap(struct amd64_pvt *pvt)
+static unsigned long amd64_determine_edac_cap(struct amd64_pvt *pvt)
 {
 	u8 bit;
-	enum dev_type edac_cap = EDAC_FLAG_NONE;
+	unsigned long edac_cap = EDAC_FLAG_NONE;
 
 	bit = (boot_cpu_data.x86 > 0xf || pvt->ext_model >= K8_REV_F)
 		? 19
