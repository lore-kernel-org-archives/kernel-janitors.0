From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Feb 2013 05:15:02 +0000
Subject: [patch] irda: small read beyond end of array in debug code
Message-Id: <20130227051502.GC22703@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <samuel@sortiz.org>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

charset comes from skb->data.  It's a number in the 0-255 range.
If we have debugging turned on then this could cause a read beyond
the end of the array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/irda/iriap.c b/net/irda/iriap.c
index e71e85b..29340a9 100644
--- a/net/irda/iriap.c
+++ b/net/irda/iriap.c
@@ -495,8 +495,11 @@ static void iriap_getvaluebyclass_confirm(struct iriap_cb *self,
 /*		case CS_ISO_8859_9: */
 /*		case CS_UNICODE: */
 		default:
-			IRDA_DEBUG(0, "%s(), charset %s, not supported\n",
-				   __func__, ias_charset_types[charset]);
+			IRDA_DEBUG(0, "%s(), charset [%d] %s, not supported\n",
+				   __func__, charset,
+				   charset < ARRAY_SIZE(ias_charset_types) ?
+					ias_charset_types[charset] :
+					"(unknown)");
 
 			/* Aborting, close connection! */
 			iriap_disconnect_request(self);
