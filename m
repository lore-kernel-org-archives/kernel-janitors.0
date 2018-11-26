From: Colin King <colin.king@canonical.com>
Date: Mon, 26 Nov 2018 15:53:54 +0000
Subject: [PATCH] qed: fix spelling mistake "attnetion" -> "attention"
Message-Id: <20181126155354.26698-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <Ariel.Elior@cavium.com>, everest-linux-l2@cavium.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The text in array s_igu_fifo_error_strs contains a spelling mistake,
fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qed/qed_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_debug.c b/drivers/net/ethernet/qlogic/qed/qed_debug.c
index 78a638ec7c0a..979f1e4bc18b 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_debug.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_debug.c
@@ -6071,7 +6071,7 @@ static const char * const s_igu_fifo_error_strs[] = {
 	"no error",
 	"length error",
 	"function disabled",
-	"VF sent command to attnetion address",
+	"VF sent command to attention address",
 	"host sent prod update command",
 	"read of during interrupt register while in MIMD mode",
 	"access to PXP BAR reserved address",
-- 
2.19.1
