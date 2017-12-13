From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 13:11:29 +0000
Subject: [PATCH 1/4] staging/wlan-ng/prism2fw: Delete an error message for a failed memory allocation in mkim
Message-Id: <8c1727a5-425f-da88-7ae5-6fb97f8e03d8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3599ae76-1aa8-4b6a-bf31-90e467759629@users.sourceforge.net>
In-Reply-To: <3599ae76-1aa8-4b6a-bf31-90e467759629@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Maciek Borzecki <maciek.borzecki@gmail.com>, Simo Koskinen <koskisoft@gmail.com>, Thibaut Sautereau <thibaut.sautereau@telecom-sudparis.eu>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 12:57:13 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/wlan-ng/prism2fw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
index 344bec8cc31b..6888d1b093fa 100644
--- a/drivers/staging/wlan-ng/prism2fw.c
+++ b/drivers/staging/wlan-ng/prism2fw.c
@@ -557,10 +557,9 @@ static int mkimage(struct imgchunk *clist, unsigned int *ccnt)
 	/* Allocate buffer space for chunks */
 	for (i = 0; i < *ccnt; i++) {
 		clist[i].data = kzalloc(clist[i].len, GFP_KERNEL);
-		if (!clist[i].data) {
-			pr_err("failed to allocate image space, exitting.\n");
+		if (!clist[i].data)
 			return 1;
-		}
+
 		pr_debug("chunk[%d]: addr=0x%06x len=%d\n",
 			 i, clist[i].addr, clist[i].len);
 	}
-- 
2.15.1

