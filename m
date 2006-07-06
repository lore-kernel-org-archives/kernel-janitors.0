From: Henne <henne@nachtwindheim.de>
Date: Thu, 06 Jul 2006 19:54:02 +0000
Subject: [KJ] [PATCH] fix legacy megaraid-driver to compile without
Message-Id: <44AD6A5A.5060403@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neela.Kolli@engenio.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Create an empty inline function to make the legacy megaraid-driver compile
without PROC_FS.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

--- linux-2.6.18-rc1/drivers/scsi/megaraid.h    2006-06-18 03:49:35.000000000 +0200
+++ linux/drivers/scsi/megaraid.h       2006-07-06 21:39:59.000000000 +0200
@@ -1039,6 +1039,9 @@
 static int proc_rdrv_30(char *, char **, off_t, int, int *, void *);
 static int proc_rdrv_40(char *, char **, off_t, int, int *, void *);
 static int proc_rdrv(adapter_t *, char *, int, int);
+#else
+static inline void
+mega_create_proc_entry(int index, struct proc_dir_entry *parent) {}
 #endif

 static int mega_adapinq(adapter_t *, dma_addr_t);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
