From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Apr 2016 06:41:26 +0000
Subject: [patch] UBI: clean up return in ubi_remove_volume()
Message-Id: <20160413064126.GC8092@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artem Bityutskiy <dedekind1@gmail.com>, Dmitry Pervushin <dpervushin@embeddedalley.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

My static checker says that "err" can be uninitialized if
"vol->reserved_pebs" is <= 0.  I don't think that can happen but
returning a literal is cleaner anyway.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 1ae17bb..10059df 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -405,7 +405,7 @@ int ubi_remove_volume(struct ubi_volume_desc *desc, int no_vtbl)
 	if (!no_vtbl)
 		self_check_volumes(ubi);
 
-	return err;
+	return 0;
 
 out_err:
 	ubi_err(ubi, "cannot remove volume %d, error %d", vol_id, err);
