From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Jun 2018 09:23:10 +0000
Subject: [PATCH] scsi: qedi: tidy up a size caculation
Message-Id: <20180628092310.ta2qzatghjtgnzx7@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The id_tbl->table pointer points to unsigned long so static checkers
complain that instead of 4 we should be allocating sizeof(long) bytes.

We're trying to allocate enough bits for the bitmap.  The size variable
is always 1024.  (1024 / 32 * 4) is the same as (1024 / 64 * 8) so this
doesn't change runtime, but this is the more idiomatic way to do it and
makes the static checker happy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/qedi/qedi_main.c b/drivers/scsi/qedi/qedi_main.c
index cf274a79e77a..682f3ce31014 100644
--- a/drivers/scsi/qedi/qedi_main.c
+++ b/drivers/scsi/qedi/qedi_main.c
@@ -524,7 +524,7 @@ static int qedi_init_id_tbl(struct qedi_portid_tbl *id_tbl, u16 size,
 	id_tbl->max = size;
 	id_tbl->next = next;
 	spin_lock_init(&id_tbl->lock);
-	id_tbl->table = kcalloc(DIV_ROUND_UP(size, 32), 4, GFP_KERNEL);
+	id_tbl->table = kcalloc(BITS_TO_LONGS(size), sizeof(long), GFP_KERNEL);
 	if (!id_tbl->table)
 		return -ENOMEM;
 
