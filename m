From: Ron Gage <ron@rongage.org>
Date: Sun, 15 Feb 2004 03:44:03 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 - scripts/file2alias.c -
Message-Id: <200402142244.04007.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_DsuLA1PHrGIEqYf"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_DsuLA1PHrGIEqYf
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Ok, let's see if this patch is a touch less problematic.

Cleans up signed/unsigned comparison warnings.

-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_DsuLA1PHrGIEqYf
Content-Type: text/x-diff; charset="us-ascii"; name="scripts_file2alias.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="scripts_file2alias.diff"

--- linux-2.6.2.orig/scripts/file2alias.c	2004-02-03 22:43:46.000000000 -0500
+++ linux-2.6.2/scripts/file2alias.c	2004-02-14 22:30:46.000000000 -0500
@@ -127,10 +127,10 @@
 	id->class_mask = TO_NATIVE(id->class_mask);
 
 	strcpy(alias, "pci:");
-	ADD(alias, "v", id->vendor != PCI_ANY_ID, id->vendor);
-	ADD(alias, "d", id->device != PCI_ANY_ID, id->device);
-	ADD(alias, "sv", id->subvendor != PCI_ANY_ID, id->subvendor);
-	ADD(alias, "sd", id->subdevice != PCI_ANY_ID, id->subdevice);
+	ADD(alias, "v", (unsigned)id->vendor != PCI_ANY_ID, id->vendor);
+	ADD(alias, "d", (unsigned)id->device != PCI_ANY_ID, id->device);
+	ADD(alias, "sv", (unsigned)id->subvendor != PCI_ANY_ID, id->subvendor);
+	ADD(alias, "sd", (unsigned)id->subdevice != PCI_ANY_ID, id->subdevice);
 
 	baseclass = (id->class) >> 16;
 	baseclass_mask = (id->class_mask) >> 16;

--Boundary-00=_DsuLA1PHrGIEqYf
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_DsuLA1PHrGIEqYf--
