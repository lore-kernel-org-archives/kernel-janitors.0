From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 22 Nov 2020 18:07:04 +0000
Subject: [PATCH] sctp: Fix some typo
Message-Id: <20201122180704.1366636-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vyasevich@gmail.com, nhorman@tuxdriver.com, marcelo.leitner@gmail.com, davem@davemloft.net, kuba@kernel.org
Cc: linux-sctp@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

s/tranport/transport/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 net/sctp/transport.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/sctp/transport.c b/net/sctp/transport.c
index 60fcf31cdcfb..bf0ac467e757 100644
--- a/net/sctp/transport.c
+++ b/net/sctp/transport.c
@@ -8,7 +8,7 @@
  *
  * This file is part of the SCTP kernel implementation
  *
- * This module provides the abstraction for an SCTP tranport representing
+ * This module provides the abstraction for an SCTP transport representing
  * a remote transport address.  For local transport addresses, we just use
  * union sctp_addr.
  *
@@ -123,7 +123,7 @@ void sctp_transport_free(struct sctp_transport *transport)
 	/* Delete the T3_rtx timer if it's active.
 	 * There is no point in not doing this now and letting
 	 * structure hang around in memory since we know
-	 * the tranport is going away.
+	 * the transport is going away.
 	 */
 	if (del_timer(&transport->T3_rtx_timer))
 		sctp_transport_put(transport);
-- 
2.27.0
