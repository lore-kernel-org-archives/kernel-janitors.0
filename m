From: Colin King <colin.king@canonical.com>
Date: Fri, 12 Jan 2018 09:14:50 +0000
Subject: [PATCH][next] ath10k: fix spelling mistake: "addrress" -> "address"
Message-Id: <20180112091450.8285-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in warning message text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 8abaccc25227..f6a23f2d0335 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1484,7 +1484,7 @@ static int ath10k_pci_dump_memory_section(struct ath10k *ar,
 	cur_section = &mem_region->section_table.sections[0];
 
 	if (mem_region->start > cur_section->start) {
-		ath10k_warn(ar, "incorrect memdump region 0x%x with section start addrress 0x%x.\n",
+		ath10k_warn(ar, "incorrect memdump region 0x%x with section start address 0x%x.\n",
 			    mem_region->start, cur_section->start);
 		return 0;
 	}
-- 
2.15.1

