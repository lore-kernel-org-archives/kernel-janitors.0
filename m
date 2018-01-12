From: Colin King <colin.king@canonical.com>
Date: Fri, 12 Jan 2018 17:27:13 +0000
Subject: [PATCH] ath10k: remove redundant -ve check against u32 integer size
Message-Id: <20180112172713.28252-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable section_table.size is a u32 and so cannot be less than
zero, hence the less than zero check is redundant and can be
removed.

Detected by CoverityScan, CID#1463855 ("Unsigned compared against 0")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index f6a23f2d0335..355db6a0fcf3 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1478,9 +1478,6 @@ static int ath10k_pci_dump_memory_section(struct ath10k *ar,
 	if (!mem_region || !buf)
 		return 0;
 
-	if (mem_region->section_table.size < 0)
-		return 0;
-
 	cur_section = &mem_region->section_table.sections[0];
 
 	if (mem_region->start > cur_section->start) {
-- 
2.15.1

