From: Henne <henne@nachtwindheim.de>
Date: Sun, 30 Apr 2006 13:36:50 +0000
Subject: [KJ] [PATCH] Update code example in deviceiobook.tmpl
Message-Id: <4454BD72.2000206@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Update an example function to be in sync with the actual kernel.
The change in the driver happend in Aug-2005 and is a bit clearer.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

--- linux-2.6.17-rc3/Documentation/DocBook/deviceiobook.tmpl	2006-04-27 08:39:13.000000000 +0200
+++ linux/Documentation/DocBook/deviceiobook.tmpl	2006-04-30 15:18:02.000000000 +0200
@@ -176,18 +176,13 @@
  static inline void
  qla1280_disable_intrs(struct scsi_qla_host *ha)
  {
-	struct device_reg *reg;
-
-	reg = ha->iobase;
-	/* disable risc and host interrupts */
-	WRT_REG_WORD(&amp;reg->ictrl, 0);
+	WRT_REG_WORD(&amp;ha->iobase->ictrl, 0);
  	/*
  	 * The following read will ensure that the above write
  	 * has been received by the device before we return from this
  	 * function.
  	 */
-	RD_REG_WORD(&amp;reg->ictrl);
-	ha->flags.ints_enabled = 0;
+	RD_REG_WORD(&amp;ha->iobase->ictrl);
  }
  </programlisting>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
