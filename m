From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Apr 2016 06:42:34 +0000
Subject: [patch] mtd: silence some uninitialized variable warnings
Message-Id: <20160413064234.GE8092@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

The "tmp_retlen" variable can be uninitialized if action() fails.  It's
harmless except for the static checker warning.  I have moved the error
handling earlier to fix it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index af28bb3..006a464 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -3201,13 +3201,13 @@ static int onenand_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
 			size_t tmp_retlen;
 
 			ret = action(mtd, from, len, &tmp_retlen, buf);
+			if (ret)
+				break;
 
 			buf += tmp_retlen;
 			len -= tmp_retlen;
 			*retlen += tmp_retlen;
 
-			if (ret)
-				break;
 		}
 		otp_pages--;
 	}
