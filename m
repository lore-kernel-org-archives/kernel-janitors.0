From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 01 Feb 2006 00:27:56 +0000
Subject: [KJ] [Patch] BUG_ON() Conversion in drivers/block/
Message-Id: <1138753677.9742.10.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35991683753719206=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============35991683753719206==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,   

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/block/cciss.c.orig	2006-01-31 21:31:55.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/block/cciss.c	2006-01-31 21:32:10.000000000 +0100
@@ -2361,8 +2361,7 @@ queue:
 	if (!creq)
 		goto startio;
 
-	if (creq->nr_phys_segments > MAXSGENTRIES)
-                BUG();
+	BUG_ON(creq->nr_phys_segments > MAXSGENTRIES);
 
 	if (( c = cmd_alloc(h, 1)) == NULL)
 		goto full;
--- linux-2.6.16-rc1-git4/drivers/block/cciss_scsi.c.orig	2006-01-31 21:27:30.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/block/cciss_scsi.c	2006-01-31 21:27:58.000000000 +0100
@@ -1316,7 +1316,7 @@ cciss_scsi_queue_command (struct scsi_cm
 
 	cp->Request.Timeout = 0;
 	memset(cp->Request.CDB, 0, sizeof(cp->Request.CDB));
-	if (cmd->cmd_len > sizeof(cp->Request.CDB)) BUG();
+	BUG_ON(cmd->cmd_len > sizeof(cp->Request.CDB));
 	cp->Request.CDBLen = cmd->cmd_len;
 	memcpy(cp->Request.CDB, cmd->cmnd, cmd->cmd_len);
 	cp->Request.Type.Type = TYPE_CMD;
--- linux-2.6.16-rc1-git4/drivers/block/cpqarray.c.orig	2006-01-31 21:32:23.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/block/cpqarray.c	2006-01-31 21:32:33.000000000 +0100
@@ -910,8 +910,7 @@ queue_next:
 	if (!creq)
 		goto startio;
 
-	if (creq->nr_phys_segments > SG_MAX)
-		BUG();
+	BUG_ON(creq->nr_phys_segments > SG_MAX);
 
 	if ((c = cmd_alloc(h,1)) == NULL)
 		goto startio;
--- linux-2.6.16-rc1-git4/drivers/block/DAC960.c.orig	2006-01-31 21:32:48.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/block/DAC960.c	2006-01-31 21:33:07.000000000 +0100
@@ -229,8 +229,7 @@ static void *slice_dma_loaf(struct dma_l
 	void *cpu_end = loaf->cpu_free + len;
 	void *cpu_addr = loaf->cpu_free;
 
-	if (cpu_end > loaf->cpu_base + loaf->length)
-		BUG();
+	BUG_ON(cpu_end > loaf->cpu_base + loaf->length);
 	*dma_handle = loaf->dma_free;
 	loaf->cpu_free = cpu_end;
 	loaf->dma_free += len;



--===============35991683753719206==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35991683753719206==--
