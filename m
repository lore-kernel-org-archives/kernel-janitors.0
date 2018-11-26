From: Colin King <colin.king@canonical.com>
Date: Mon, 26 Nov 2018 15:34:01 +0000
Subject: [PATCH] net: via: via-velocity: fix spelling mistake "alignement" -> "alignment"
Message-Id: <20181126153401.20982-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francois Romieu <romieu@fr.zoreil.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The text in array velocity_gstrings contains a spelling mistake,
rename rx_frame_alignement_errors to rx_frame_alignment_errors.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/via/via-velocity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/via/via-velocity.c b/drivers/net/ethernet/via/via-velocity.c
index ef9538ee53d0..82412691ee66 100644
--- a/drivers/net/ethernet/via/via-velocity.c
+++ b/drivers/net/ethernet/via/via-velocity.c
@@ -3605,7 +3605,7 @@ static const char velocity_gstrings[][ETH_GSTRING_LEN] = {
 	"tx_jumbo",
 	"rx_mac_control_frames",
 	"tx_mac_control_frames",
-	"rx_frame_alignement_errors",
+	"rx_frame_alignment_errors",
 	"rx_long_ok",
 	"rx_long_err",
 	"tx_sqe_errors",
-- 
2.19.1
