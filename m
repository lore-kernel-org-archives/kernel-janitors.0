From: Tim Cooijmans <tim@aapopfiets.nl>
Date: Tue, 21 Feb 2006 20:58:12 +0000
Subject: [KJ] [PATCH] remove unused variable from drivers/scsi/megaraid.c
Message-Id: <200602212158.12473.tim@aapopfiets.nl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Tim Cooijmans <tim@aapopfiets.nl>

Fix "unused variable: `flags'" warning in drivers/scsi/megaraid.c:4473

Signed-off-by: Tim Cooijmans <tim@aapopfiets.nl>
---
--- linux-2.6.16-rc4-orig/drivers/scsi/megaraid.c	2006-02-21 
20:18:42.000000000 +0100
+++ linux-2.6.16-rc4/drivers/scsi/megaraid.c	2006-02-21 21:25:38.000000000 
+0100
@@ -4470,7 +4470,6 @@ mega_internal_command(adapter_t *adapter
 {
 	Scsi_Cmnd	*scmd;
 	struct	scsi_device *sdev;
-	unsigned long	flags = 0;
 	scb_t	*scb;
 	int	rval;
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
