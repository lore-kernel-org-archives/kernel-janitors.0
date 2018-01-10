From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 15:32:23 +0000
Subject: [PATCH 1/3] misc/ti-st: Delete an error message for a failed memory allocation in kim_probe()
Message-Id: <8aad653c-de9d-491f-140b-259dd7569404@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b038e780-8cd2-a550-108c-2f8a35f3571e@users.sourceforge.net>
In-Reply-To: <b038e780-8cd2-a550-108c-2f8a35f3571e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Arvind Yadav <arvind.yadav.cs@gmail.com>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes.berg@intel.com>, Stephen Hemminger <stephen@networkplumber.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 16:04:52 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/ti-st/st_kim.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/ti-st/st_kim.c b/drivers/misc/ti-st/st_kim.c
index b77aacafc3fc..68ebdf466b17 100644
--- a/drivers/misc/ti-st/st_kim.c
+++ b/drivers/misc/ti-st/st_kim.c
@@ -736,10 +736,9 @@ static int kim_probe(struct platform_device *pdev)
 	}
 
 	kim_gdata = kzalloc(sizeof(struct kim_data_s), GFP_ATOMIC);
-	if (!kim_gdata) {
-		pr_err("no mem to allocate");
+	if (!kim_gdata)
 		return -ENOMEM;
-	}
+
 	platform_set_drvdata(pdev, kim_gdata);
 
 	err = st_core_init(&kim_gdata->core_data);
-- 
2.15.1

