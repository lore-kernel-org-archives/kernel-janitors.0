From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 22:19:56 +0000
Subject: [PATCH 81] drivers/net/wireless/zd1201.c: kmalloc + memset conversion to kzalloc
Message-Id: <200708010019.56944.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-usb-devel@lists.sourceforge.net, pe1rxq@amsat.org

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/net/wireless/zd1201.c | 47231 -> 47205 (-26 bytes)
 drivers/net/wireless/zd1201.o | 216884 -> 216984 (+100 bytes)

 drivers/net/wireless/zd1201.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/net/wireless/zd1201.c	2007-07-26 13:07:43.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/net/wireless/zd1201.c	2007-07-30 00:29:07.000000000 +0200
@@ -522,7 +522,7 @@ static int zd1201_setconfig(struct zd120
 	zd->rxdatas = 0;
 	zd->rxlen = 0;
 	for (seq=0; len > 0; seq++) {
-		request = kmalloc(16, gfp_mask);
+		request = kzalloc(16, gfp_mask);
 		if (!request)
 			return -ENOMEM;
 		urb = usb_alloc_urb(0, gfp_mask);
@@ -530,7 +530,6 @@ static int zd1201_setconfig(struct zd120
 			kfree(request);
 			return -ENOMEM;
 		}
-		memset(request, 0, 16);
 		reqlen = len>12 ? 12 : len;
 		request[0] = ZD1201_USB_RESREQ;
 		request[1] = seq;
