From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 07 Aug 2005 09:12:23 +0000
Subject: [KJ] [PATCH] drivers/ide/legacy/hd.c: remove DEBUG
Message-Id: <20050807091223.GA4148@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12400325928265987=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============12400325928265987==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

hd.c with DEBUG defined for uncompilable for 36 months.

Noticed by (don't laugh) indent(1).

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 drivers/ide/legacy/hd.c |   16 +---------------
 1 files changed, 1 insertion(+), 15 deletions(-)

Index: linux-Lindent/drivers/ide/legacy/hd.c
===================================================================
--- linux-Lindent.orig/drivers/ide/legacy/hd.c	2005-08-07 12:35:12.000000000 +0400
+++ linux-Lindent/drivers/ide/legacy/hd.c	2005-08-07 12:35:47.000000000 +0400
@@ -456,11 +456,6 @@ ok_to_read:
 	req->errors = 0;
 	i = --req->nr_sectors;
 	--req->current_nr_sectors;
-#ifdef DEBUG
-	printk("%s: read: sector %ld, remaining = %ld, buffer=%p\n",
-		req->rq_disk->disk_name, req->sector, req->nr_sectors,
-		req->buffer+512));
-#endif
 	if (req->current_nr_sectors <= 0)
 		end_request(req, 1);
 	if (i > 0) {
@@ -542,12 +537,8 @@ static void hd_times_out(unsigned long d
 	reset = 1;
 	name = CURRENT->rq_disk->disk_name;
 	printk("%s: timeout\n", name);
-	if (++CURRENT->errors >= MAX_ERRORS) {
-#ifdef DEBUG
-		printk("%s: too many errors\n", name);
-#endif
+	if (++CURRENT->errors >= MAX_ERRORS)
 		end_request(CURRENT, 0);
-	}
 	local_irq_disable();
 	hd_request();
 	enable_irq(HD_IRQ);
@@ -621,11 +612,6 @@ repeat:
 	track = block / disk->sect;
 	head  = track % disk->head;
 	cyl   = track / disk->head;
-#ifdef DEBUG
-	printk("%s: %sing: CHS=%d/%d/%d, sectors=%d, buffer=%p\n",
-		req->rq_disk->disk_name, (req->cmd == READ)?"read":"writ",
-		cyl, head, sec, nsect, req->buffer);
-#endif
 	if (req->flags & REQ_CMD) {
 		switch (rq_data_dir(req)) {
 		case READ:


--===============12400325928265987==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12400325928265987==--
