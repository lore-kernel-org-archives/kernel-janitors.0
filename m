From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 02 Feb 2018 20:11:20 +0000
Subject: [PATCH 2/2] HSI: ssi_protocol: Fix a typo in two comment lines
Message-Id: <74402fa6-dab4-e542-f49e-c20487580ca0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <14dd4865-f983-ba7d-3068-f6450a8de7ea@users.sourceforge.net>
In-Reply-To: <14dd4865-f983-ba7d-3068-f6450a8de7ea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, "David S. Miller" <davem@davemloft.net>, Kees Cook <keescook@chromium.org>, Sebastian Reichel <sre@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, trivial@kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 2 Feb 2018 20:57:23 +0100

Adjust two words in this description.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hsi/clients/ssi_protocol.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hsi/clients/ssi_protocol.c b/drivers/hsi/clients/ssi_protocol.c
index 0bccea2fa119..6dbead863d07 100644
--- a/drivers/hsi/clients/ssi_protocol.c
+++ b/drivers/hsi/clients/ssi_protocol.c
@@ -993,8 +993,8 @@ static int ssip_pn_xmit(struct sk_buff *skb, struct net_device *dev)
 		goto inc_dropped;
 
 	/*
-	 * Modem sends Phonet messages over SSI with its own endianess...
-	 * Assume that modem has the same endianess as we do.
+	 * Modem sends Phonet messages over SSI with its own endianness.
+	 * Assume that modem has the same endianness as we do.
 	 */
 	if (skb_cow_head(skb, 0))
 		goto drop;
-- 
2.16.1

