From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 15:33:23 +0000
Subject: [PATCH 2/3] misc/ti-st: Improve a size determination in kim_probe()
Message-Id: <5df1dcbb-2c86-f333-0b1f-4ad3b86a3278@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b038e780-8cd2-a550-108c-2f8a35f3571e@users.sourceforge.net>
In-Reply-To: <b038e780-8cd2-a550-108c-2f8a35f3571e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Arvind Yadav <arvind.yadav.cs@gmail.com>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes.berg@intel.com>, Stephen Hemminger <stephen@networkplumber.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 16:10:45 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/ti-st/st_kim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/ti-st/st_kim.c b/drivers/misc/ti-st/st_kim.c
index 68ebdf466b17..948e3461d02e 100644
--- a/drivers/misc/ti-st/st_kim.c
+++ b/drivers/misc/ti-st/st_kim.c
@@ -735,7 +735,7 @@ static int kim_probe(struct platform_device *pdev)
 		st_kim_devices[0] = pdev;
 	}
 
-	kim_gdata = kzalloc(sizeof(struct kim_data_s), GFP_ATOMIC);
+	kim_gdata = kzalloc(sizeof(*kim_gdata), GFP_ATOMIC);
 	if (!kim_gdata)
 		return -ENOMEM;
 
-- 
2.15.1

