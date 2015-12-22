From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 22 Dec 2015 14:12:32 +0000
Subject: [PATCH v2] staging-slicoss: Use a signed return type for slic_card_locate()
Message-Id: <56795A50.9070300@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5675B207.2010706@users.sourceforge.net>
 <20151219201955.GS5284@mwanda>
In-Reply-To: <20151219201955.GS5284@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christopher Harrer <charrer@alacritech.com>, Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lior Dotan <liodot@gmail.com>, devel@driverdev.osuosl.org
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 22 Dec 2015 15:05:16 +0100

The return type "u32" was used by the slic_card_locate() function
even though it will eventually return a negative error code.
Improve this implementation detail by using the type "int" instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/slicoss/slicoss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/slicoss/slicoss.c b/drivers/staging/slicoss/slicoss.c
index b23a2d1..156e57f 100644
--- a/drivers/staging/slicoss/slicoss.c
+++ b/drivers/staging/slicoss/slicoss.c
@@ -2953,7 +2953,7 @@ static const struct net_device_ops slic_netdev_ops = {
 	.ndo_change_mtu		= eth_change_mtu,
 };
 
-static u32 slic_card_locate(struct adapter *adapter)
+static int slic_card_locate(struct adapter *adapter)
 {
 	struct sliccard *card = slic_global.slic_card;
 	struct physcard *physcard = slic_global.phys_card;
-- 
2.6.3

