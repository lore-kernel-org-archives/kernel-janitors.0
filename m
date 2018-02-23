From: Colin King <colin.king@canonical.com>
Date: Fri, 23 Feb 2018 12:22:52 +0000
Subject: [PATCH] atm: idt77252: remove redundant bit-wise or'ing of zero
Message-Id: <20180223122252.23942-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Zero is being bit-wise or'd in a calculation twice; these are redundant
and can be removed.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/atm/idt77252.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/atm/idt77252.c b/drivers/atm/idt77252.c
index 0277f36be85b..6e737142ceaa 100644
--- a/drivers/atm/idt77252.c
+++ b/drivers/atm/idt77252.c
@@ -3173,14 +3173,10 @@ static void init_sram(struct idt77252_dev *card)
 				    (u32) 0xffffffff);
 	}
 
-	writel((SAR_FBQ0_LOW << 28) | 0x00000000 | 0x00000000 |
-	       (SAR_FB_SIZE_0 / 48), SAR_REG_FBQS0);
-	writel((SAR_FBQ1_LOW << 28) | 0x00000000 | 0x00000000 |
-	       (SAR_FB_SIZE_1 / 48), SAR_REG_FBQS1);
-	writel((SAR_FBQ2_LOW << 28) | 0x00000000 | 0x00000000 |
-	       (SAR_FB_SIZE_2 / 48), SAR_REG_FBQS2);
-	writel((SAR_FBQ3_LOW << 28) | 0x00000000 | 0x00000000 |
-	       (SAR_FB_SIZE_3 / 48), SAR_REG_FBQS3);
+	writel((SAR_FBQ0_LOW << 28) | (SAR_FB_SIZE_0 / 48), SAR_REG_FBQS0);
+	writel((SAR_FBQ1_LOW << 28) | (SAR_FB_SIZE_1 / 48), SAR_REG_FBQS1);
+	writel((SAR_FBQ2_LOW << 28) | (SAR_FB_SIZE_2 / 48), SAR_REG_FBQS2);
+	writel((SAR_FBQ3_LOW << 28) | (SAR_FB_SIZE_3 / 48), SAR_REG_FBQS3);
 
 	/* Initialize rate table  */
 	for (i = 0; i < 256; i++) {
-- 
2.15.1

