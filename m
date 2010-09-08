From: Dan Carpenter <error27@gmail.com>
Date: Wed, 08 Sep 2010 19:39:56 +0000
Subject: [patch] mtd: sanity check input
Message-Id: <20100908193956.GB3463@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, H Hartley Sweeten <hsweeten@visionengravers.com>, linux-mtd@lists.infradead.org, Ben Hutchings <bhutchings@solarflare.com>, "Kirill A. Shutemov" <kirill@shutemov.name>

If "ur_idx" is wrong we could go past the end of the array.  The
"ur_idx" comes from root so it's not a huge deal, but adding a sanity
check makes the code more robust.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index a825002..9c00549 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -513,6 +513,9 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (get_user(ur_idx, &(ur->regionindex)))
 			return -EFAULT;
 
+		if (ur_idx >= mtd->numeraseregions)
+			return -EINVAL;
+
 		kr = &(mtd->eraseregions[ur_idx]);
 
 		if (put_user(kr->offset, &(ur->offset))
