From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 02 Feb 2018 20:09:53 +0000
Subject: [PATCH 1/2] HSI: ssi_protocol: Delete an error message for a failed memory allocation in ssi_protoco
Message-Id: <77f958da-a645-69c9-8641-d37a073c0d53@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <14dd4865-f983-ba7d-3068-f6450a8de7ea@users.sourceforge.net>
In-Reply-To: <14dd4865-f983-ba7d-3068-f6450a8de7ea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, "David S. Miller" <davem@davemloft.net>, Kees Cook <keescook@chromium.org>, Sebastian Reichel <sre@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 2 Feb 2018 20:02:17 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hsi/clients/ssi_protocol.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hsi/clients/ssi_protocol.c b/drivers/hsi/clients/ssi_protocol.c
index 9b167bc6eee4..0bccea2fa119 100644
--- a/drivers/hsi/clients/ssi_protocol.c
+++ b/drivers/hsi/clients/ssi_protocol.c
@@ -1088,10 +1088,8 @@ static int ssi_protocol_probe(struct device *dev)
 	int err;
 
 	ssi = kzalloc(sizeof(*ssi), GFP_KERNEL);
-	if (!ssi) {
-		dev_err(dev, "No memory for ssi protocol\n");
+	if (!ssi)
 		return -ENOMEM;
-	}
 
 	spin_lock_init(&ssi->lock);
 	timer_setup(&ssi->rx_wd, ssip_rx_wd, TIMER_DEFERRABLE);
-- 
2.16.1

