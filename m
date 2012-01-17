From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Jan 2012 07:31:52 +0000
Subject: [patch] Staging: sbe-2t3e3: logical || vs bitwise |
Message-Id: <20120117073142.GD11358@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Bitwise OR was clearly intended here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/sbe-2t3e3/intr.c b/drivers/staging/sbe-2t3e3/intr.c
index 7ad1a83..1336aab 100644
--- a/drivers/staging/sbe-2t3e3/intr.c
+++ b/drivers/staging/sbe-2t3e3/intr.c
@@ -188,7 +188,7 @@ void dc_intr_rx(struct channel *sc)
 			}
 
 			if (sc->s.LOS) {
-				error_mask &= ~(SBE_2T3E3_RX_DESC_DRIBBLING_BIT ||
+				error_mask &= ~(SBE_2T3E3_RX_DESC_DRIBBLING_BIT |
 						SBE_2T3E3_RX_DESC_MII_ERROR);
 			}
 
