From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 07 Oct 2019 08:50:03 +0000
Subject: [PATCH] ath10k: Fix an && vs || typo
Message-Id: <20191007085003.GB3865@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Govind Singh <govinds@codeaurora.org>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

The kernel will Oops later in the function if either of these pointers
is NULL so clearly || was intended instead of &&.

Fixes: 3f14b73c3843 ("ath10k: Enable MSA region dump support for WCN3990")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index cd22c8654aa9..16177497bba7 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1400,7 +1400,7 @@ static void ath10k_msa_dump_memory(struct ath10k *ar,
 	size_t buf_len;
 	u8 *buf;
 
-	if (!crash_data && !crash_data->ramdump_buf)
+	if (!crash_data || !crash_data->ramdump_buf)
 		return;
 
 	mem_layout = ath10k_coredump_get_mem_layout(ar);
-- 
2.20.1
