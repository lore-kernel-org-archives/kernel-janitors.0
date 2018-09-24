From: Colin King <colin.king@canonical.com>
Date: Mon, 24 Sep 2018 16:42:48 +0000
Subject: [PATCH] mailbox: bcm-flexrm-mailbox: fix spelling mistake "toogle" -> "toggle"
Message-Id: <20180924164248.2180-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in function name flexrm_flip_header_toogle,
rename it to flexrm_flip_header_toggle.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mailbox/bcm-flexrm-mailbox.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/bcm-flexrm-mailbox.c b/drivers/mailbox/bcm-flexrm-mailbox.c
index 8ab077ff58f4..d7a8ed7d8097 100644
--- a/drivers/mailbox/bcm-flexrm-mailbox.c
+++ b/drivers/mailbox/bcm-flexrm-mailbox.c
@@ -375,7 +375,7 @@ static u32 flexrm_estimate_header_desc_count(u32 nhcnt)
 	return hcnt;
 }
 
-static void flexrm_flip_header_toogle(void *desc_ptr)
+static void flexrm_flip_header_toggle(void *desc_ptr)
 {
 	u64 desc = flexrm_read_desc(desc_ptr);
 
@@ -709,7 +709,7 @@ static void *flexrm_spu_write_descs(struct brcm_message *msg, u32 nhcnt,
 	wmb();
 
 	/* Flip toggle bit in header */
-	flexrm_flip_header_toogle(orig_desc_ptr);
+	flexrm_flip_header_toggle(orig_desc_ptr);
 
 	return desc_ptr;
 }
@@ -838,7 +838,7 @@ static void *flexrm_sba_write_descs(struct brcm_message *msg, u32 nhcnt,
 	wmb();
 
 	/* Flip toggle bit in header */
-	flexrm_flip_header_toogle(orig_desc_ptr);
+	flexrm_flip_header_toggle(orig_desc_ptr);
 
 	return desc_ptr;
 }
-- 
2.17.1
