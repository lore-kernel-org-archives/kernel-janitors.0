From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 05 Jan 2018 20:31:30 +0000
Subject: [PATCH 3/3] mtd/nand/ams-delta: Add some spaces for better code readability
Message-Id: <9e8454a8-41aa-9afc-e2b9-c1824028f91f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8f678424-3ce1-3a4c-1b0d-f3ac9a226f00@users.sourceforge.net>
In-Reply-To: <8f678424-3ce1-3a4c-1b0d-f3ac9a226f00@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 Jan 2018 21:14:20 +0100

Use space characters at some source code places according to
the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/nand/ams-delta.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/ams-delta.c
index 4f5fc104c510..9ea61271fee6 100644
--- a/drivers/mtd/nand/ams-delta.c
+++ b/drivers/mtd/nand/ams-delta.c
@@ -94,7 +94,7 @@ static void ams_delta_write_buf(struct mtd_info *mtd, const u_char *buf,
 {
 	int i;
 
-	for (i=0; i<len; i++)
+	for (i = 0; i < len; i++)
 		ams_delta_write_byte(mtd, buf[i]);
 }
 
@@ -102,7 +102,7 @@ static void ams_delta_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
 	int i;
 
-	for (i=0; i<len; i++)
+	for (i = 0; i < len; i++)
 		buf[i] = ams_delta_read_byte(mtd);
 }
 
-- 
2.15.1

