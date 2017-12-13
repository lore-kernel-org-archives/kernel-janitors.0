From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 13:12:41 +0000
Subject: [PATCH 2/4] staging/wlan-ng/prism2fw: Use a known error code after a failed kzalloc() in mkimage()
Message-Id: <e4ea47b6-ba6d-1b6e-0d51-e5fcceca27d0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3599ae76-1aa8-4b6a-bf31-90e467759629@users.sourceforge.net>
In-Reply-To: <3599ae76-1aa8-4b6a-bf31-90e467759629@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Maciek Borzecki <maciek.borzecki@gmail.com>, Simo Koskinen <koskisoft@gmail.com>, Thibaut Sautereau <thibaut.sautereau@telecom-sudparis.eu>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 13:20:10 +0100

Make a memory allocation failure clearer by using the error code "-ENOMEM"
(instead of the constant "1") in this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/wlan-ng/prism2fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
index 6888d1b093fa..efca9108dad8 100644
--- a/drivers/staging/wlan-ng/prism2fw.c
+++ b/drivers/staging/wlan-ng/prism2fw.c
@@ -558,7 +558,7 @@ static int mkimage(struct imgchunk *clist, unsigned int *ccnt)
 	for (i = 0; i < *ccnt; i++) {
 		clist[i].data = kzalloc(clist[i].len, GFP_KERNEL);
 		if (!clist[i].data)
-			return 1;
+			return -ENOMEM;
 
 		pr_debug("chunk[%d]: addr=0x%06x len=%d\n",
 			 i, clist[i].addr, clist[i].len);
-- 
2.15.1

