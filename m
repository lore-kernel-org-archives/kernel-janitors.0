From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 Feb 2017 10:30:40 +0000
Subject: [patch] tpm: silence an array overflow warning
Message-Id: <20170203103040.GA5467@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Huewe <peterhuewe@gmx.de>, Nayna Jain <nayna@linux.vnet.ibm.com>
Cc: Marcel Selhorst <tpmdd@selhorst.net>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, tpmdd-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org

We should check that we're within bounds first before checking that
"chip->active_banks[i] != TPM2_ALG_ERROR" so I've re-ordered the two
checks.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
index 423938e8570f..087748b8264f 100644
--- a/drivers/char/tpm/tpm-interface.c
+++ b/drivers/char/tpm/tpm-interface.c
@@ -800,8 +800,8 @@ int tpm_pcr_extend(u32 chip_num, int pcr_idx, const u8 *hash)
 	if (chip->flags & TPM_CHIP_FLAG_TPM2) {
 		memset(digest_list, 0, sizeof(digest_list));
 
-		for (i = 0; chip->active_banks[i] != TPM2_ALG_ERROR &&
-		     i < ARRAY_SIZE(chip->active_banks); i++) {
+		for (i = 0; i < ARRAY_SIZE(chip->active_banks) &&
+			    chip->active_banks[i] != TPM2_ALG_ERROR; i++) {
 			digest_list[i].alg_id = chip->active_banks[i];
 			memcpy(digest_list[i].digest, hash, TPM_DIGEST_SIZE);
 			count++;
