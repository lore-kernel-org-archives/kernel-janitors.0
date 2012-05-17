From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 May 2012 06:51:02 +0000
Subject: [patch] isdn: remove duplicate NULL check
Message-Id: <20120517065102.GC14660@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>
Cc: David Howells <dhowells@redhat.com>, Phil Carmody <ext-phil.2.carmody@nokia.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

We test both "!skb_out" and "skb_out" here which is duplicative and
causes a static checker warning.  I considered that the intent might
have been to test "skb_in" but that's a valid pointer here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/isdn/i4l/isdn_bsdcomp.c b/drivers/isdn/i4l/isdn_bsdcomp.c
index c59e8d2..8837ac5 100644
--- a/drivers/isdn/i4l/isdn_bsdcomp.c
+++ b/drivers/isdn/i4l/isdn_bsdcomp.c
@@ -612,7 +612,7 @@ static int bsd_compress(void *state, struct sk_buff *skb_in, struct sk_buff *skb
 		db->n_bits++;
 
 	/* If output length is too large then this is an incompressible frame. */
-	if (!skb_out || (skb_out && skb_out->len >= skb_in->len)) {
+	if (!skb_out || skb_out->len >= skb_in->len) {
 		++db->incomp_count;
 		db->incomp_bytes += isize;
 		return 0;
