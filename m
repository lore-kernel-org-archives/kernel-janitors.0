From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 12 Oct 2017 10:46:03 +0000
Subject: [PATCH 06/10] staging/irda/net: Delete an unnecessary variable initialisation in two functions
Message-Id: <632598f6-c36d-a672-edfe-fbf62e9a2e25@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8152401b-d68d-c4fe-2619-82a09e0c52ec@users.sourceforge.net>
In-Reply-To: <8152401b-d68d-c4fe-2619-82a09e0c52ec@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, netdev@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Corentin Labbe <clabbe.montjoie@gmail.com>, David Howells <dhowells@redhat.com>, "David S. Miller" <davem@davemloft.net>, Georgiana Chelu <georgiana.chelu93@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes.berg@intel.com>, Julia Lawall <julia.lawall@lip6.fr>, Samuel Ortiz <samuel@sortiz.org>, Srishti Sharma <srishtishar@gmail.com>, Stephen Hemminger <stephen@networkplumber.org>, Yuan Linyu <Linyu.Yuan@alcatel-sbell.com.cn>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 11 Oct 2017 22:22:13 +0200

The local variable "tx_skb" will only be used in a single if branch
of these functions. Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/irda/net/irlap_frame.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/irda/net/irlap_frame.c b/drivers/staging/irda/net/irlap_frame.c
index 5b8be5b9812e..25ceb06efd58 100644
--- a/drivers/staging/irda/net/irlap_frame.c
+++ b/drivers/staging/irda/net/irlap_frame.c
@@ -862,7 +862,7 @@ void irlap_send_data_primary_poll(struct irlap_cb *self, struct sk_buff *skb)
 void irlap_send_data_secondary_final(struct irlap_cb *self,
 				     struct sk_buff *skb)
 {
-	struct sk_buff *tx_skb = NULL;
+	struct sk_buff *tx_skb;
 
 	IRDA_ASSERT(self, return;);
 	IRDA_ASSERT(self->magic = LAP_MAGIC, return;);
@@ -922,7 +922,7 @@ void irlap_send_data_secondary_final(struct irlap_cb *self,
  */
 void irlap_send_data_secondary(struct irlap_cb *self, struct sk_buff *skb)
 {
-	struct sk_buff *tx_skb = NULL;
+	struct sk_buff *tx_skb;
 
 	/* Is this reliable or unreliable data? */
 	if (skb->data[1] = I_FRAME) {
-- 
2.14.2

