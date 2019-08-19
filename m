From: Colin King <colin.king@canonical.com>
Date: Mon, 19 Aug 2019 09:41:37 +0000
Subject: [PATCH][next] misc: xilinx_sdfec: fix spelling mistake: "Schdule" -> "Schedule"
Message-Id: <20190819094137.390-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Derek Kiernan <derek.kiernan@xilinx.com>, Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_dbg message, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/xilinx_sdfec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
index 912e939dec62..b25c58ee618c 100644
--- a/drivers/misc/xilinx_sdfec.c
+++ b/drivers/misc/xilinx_sdfec.c
@@ -553,7 +553,7 @@ static int xsdfec_reg2_write(struct xsdfec_dev *xsdfec, u32 nlayers, u32 nmqc,
 		 XSDFEC_REG2_NO_FINAL_PARITY_MASK);
 	if (max_schedule &
 	    ~(XSDFEC_REG2_MAX_SCHEDULE_MASK >> XSDFEC_REG2_MAX_SCHEDULE_LSB))
-		dev_dbg(xsdfec->dev, "Max Schdule exceeds 2 bits");
+		dev_dbg(xsdfec->dev, "Max Schedule exceeds 2 bits");
 	max_schedule = ((max_schedule << XSDFEC_REG2_MAX_SCHEDULE_LSB) &
 			XSDFEC_REG2_MAX_SCHEDULE_MASK);
 
-- 
2.20.1
