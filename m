From: Colin King <colin.king@canonical.com>
Date: Thu, 18 Apr 2019 09:57:56 +0000
Subject: [PATCH] NFC: st95hf: fix spelling mistake: "receieve" -> "receive"
Message-Id: <20190418095756.9264-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>, Daniel Mack <daniel@zonque.org>, linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/nfc/st95hf/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index a50a95cfcfd8..d72d48243141 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -327,7 +327,7 @@ static int st95hf_echo_command(struct st95hf_context *st95context)
 					  &echo_response);
 	if (result) {
 		dev_err(&st95context->spicontext.spidev->dev,
-			"err: echo response receieve error = 0x%x\n", result);
+			"err: echo response receive error = 0x%x\n", result);
 		return result;
 	}
 
-- 
2.20.1
