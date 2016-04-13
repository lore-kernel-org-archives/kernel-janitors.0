From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Apr 2016 06:41:55 +0000
Subject: [patch] UBI: silence an unintialized variable warning
Message-Id: <20160413064155.GD8092@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

My static checker complains that "val" is uninitialized when kstrtoint()
fails.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index c4cb15a..f101a49 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -352,7 +352,8 @@ static ssize_t dfs_file_write(struct file *file, const char __user *user_buf,
 	} else if (dent = d->dfs_emulate_power_cut) {
 		if (kstrtoint(buf, 0, &val) != 0)
 			count = -EINVAL;
-		d->emulate_power_cut = val;
+		else
+			d->emulate_power_cut = val;
 		goto out;
 	}
 
