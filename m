From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 21:27:30 +0000
Subject: [PATCH 55] drivers/char/n_hdlc.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707312327.30692.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, khc@pm.waw.pl

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/char/n_hdlc.c | 27451 -> 27423 (-28 bytes)
 drivers/char/n_hdlc.o | 112528 -> 112516 (-12 bytes)

 drivers/char/n_hdlc.c |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/char/n_hdlc.c	2007-07-26 13:07:41.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/char/n_hdlc.c	2007-07-31 23:19:40.000000000 +0200
@@ -807,13 +807,12 @@ static struct n_hdlc *n_hdlc_alloc(void)
 {
 	struct n_hdlc_buf *buf;
 	int i;
-	struct n_hdlc *n_hdlc = kmalloc(sizeof(*n_hdlc), GFP_KERNEL);
-
+	struct n_hdlc *n_hdlc;
+
+	n_hdlc = kzalloc(sizeof(*n_hdlc), GFP_KERNEL);
 	if (!n_hdlc)
 		return NULL;

-	memset(n_hdlc, 0, sizeof(*n_hdlc));
-
 	n_hdlc_buf_list_init(&n_hdlc->rx_free_buf_list);
 	n_hdlc_buf_list_init(&n_hdlc->tx_free_buf_list);
 	n_hdlc_buf_list_init(&n_hdlc->rx_buf_list);
