From: Colin King <colin.king@canonical.com>
Date: Tue, 24 Nov 2020 12:35:04 +0000
Subject: [PATCH][next] i3c/master: Fix uninitialized variable next_addr
Message-Id: <20201124123504.396249-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <bbrezillon@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-i3c@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable next_addr is not initialized and is being used in a call
to i3c_master_get_free_addr as a starting point to find the next address.
Fix this by initializing next_addr to 0 to avoid an uninitialized garbage
starting address from being used.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 9ad9a52cce28 ("i3c/master: introduce the mipi-i3c-hci driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
index 6dd234a82892..d97c3175e0e2 100644
--- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
@@ -293,7 +293,7 @@ static int hci_cmd_v1_daa(struct i3c_hci *hci)
 {
 	struct hci_xfer *xfer;
 	int ret, dat_idx = -1;
-	u8 next_addr;
+	u8 next_addr = 0;
 	u64 pid;
 	unsigned int dcr, bcr;
 	DECLARE_COMPLETION_ONSTACK(done);
-- 
2.29.2
