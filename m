From: Julia Lawall <julia@diku.dk>
Date: Wed, 30 Sep 2009 14:03:47 +0000
Subject: [PATCH] drivers/block/DAC960.c: Use DAC960_V2_Controller
Message-Id: <Pine.LNX.4.64.0909301603230.8553@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

DAC960_LP_Controller and DAC960_V2_Controller have the same value, but
elsewhere it is DAC960_V1_Controller or DAC960_V2_Controller that is used
in the FirmwareType field.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/block/DAC960.c              |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/block/DAC960.c b/drivers/block/DAC960.c
index eb4fa19..ce1fa92 100644
--- a/drivers/block/DAC960.c
+++ b/drivers/block/DAC960.c
@@ -7101,7 +7101,7 @@ static struct DAC960_privdata DAC960_BA_privdata = {
 
 static struct DAC960_privdata DAC960_LP_privdata = {
 	.HardwareType =		DAC960_LP_Controller,
-	.FirmwareType 	=	DAC960_LP_Controller,
+	.FirmwareType 	=	DAC960_V2_Controller,
 	.InterruptHandler =	DAC960_LP_InterruptHandler,
 	.MemoryWindowSize =	DAC960_LP_RegisterWindowSize,
 };
