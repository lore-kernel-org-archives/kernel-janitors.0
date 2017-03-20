From: Colin King <colin.king@canonical.com>
Date: Mon, 20 Mar 2017 14:23:36 +0000
Subject: [PATCH] tpm2: fix off-by-one comparison and out-of-bounds read error
Message-Id: <20170320142336.10997-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Huewe <peterhuewe@gmx.de>, Marcel Selhorst <tpmdd@selhorst.net>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, tpmdd-devel@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The comparison of an out of range index into space->context_tbl is
off-by-one and should be using >= rather than > in the comparison.

Detected by CoverityScan, CID#1419694 ("Out-of-bounds read")

Fixes: 849246e7ce9ce ("tpm2: add session handle context saving and restoring to the space code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/tpm/tpm2-space.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/tpm/tpm2-space.c b/drivers/char/tpm/tpm2-space.c
index d36d81e07076..009934269514 100644
--- a/drivers/char/tpm/tpm2-space.c
+++ b/drivers/char/tpm/tpm2-space.c
@@ -229,7 +229,7 @@ static bool tpm2_map_to_phandle(struct tpm_space *space, void *handle)
 	int i;
 
 	i = 0xFFFFFF - (vhandle & 0xFFFFFF);
-	if (i > ARRAY_SIZE(space->context_tbl) || !space->context_tbl[i])
+	if (i >= ARRAY_SIZE(space->context_tbl) || !space->context_tbl[i])
 		return false;
 
 	phandle = space->context_tbl[i];
-- 
2.11.0

