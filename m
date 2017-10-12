From: Colin King <colin.king@canonical.com>
Date: Thu, 12 Oct 2017 15:36:56 +0000
Subject: [PATCH] agp: amd64: remove redundant assignment of i = 0
Message-Id: <20171012153656.30382-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignent of i = 0 is redundant as it is re-assigned to zero
in the following for-loop. Clean this up by removing it.

Cleans up clang warning: Value stored to 'i' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/agp/amd64-agp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index e50c29c97ca7..f54d894933a3 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -332,7 +332,6 @@ static int cache_nbs(struct pci_dev *pdev, u32 cap_ptr)
 	if (!amd_nb_has_feature(AMD_NB_GART))
 		return -ENODEV;
 
-	i = 0;
 	for (i = 0; i < amd_nb_num(); i++) {
 		struct pci_dev *dev = node_to_amd_nb(i)->misc;
 		if (fix_northbridge(dev, pdev, cap_ptr) < 0) {
-- 
2.14.1

