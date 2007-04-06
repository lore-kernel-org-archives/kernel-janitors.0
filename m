From: Borislav Petkov <petkov@math.uni-muenster.de>
Date: Fri, 06 Apr 2007 07:43:20 +0000
Subject: [KJ] [PATCH 1/5] Fix warnings when building 'xmldocs' target:
Message-Id: <20070406074320.GA4822@gollum.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Signed-off-by: Borislav Petkov <bbpetkov@yahoo.de>

--- kernel.orig/20-rc5/drivers/message/fusion/mptbase.c	2007-04-05 09:36:01=
.000000000 +0200
+++ kernel/20-rc5/drivers/message/fusion/mptbase.c	2007-04-05 09:41:44.0000=
00000 +0200
@@ -4741,10 +4741,9 @@
 /**
  * mpt_inactive_raid_list_free
  *
- * This clears this link list.
- *
- * @ioc - pointer to per adapter structure
+ * @ioc: pointer to per adapter structure
  *
+ * This clears this link list.
  **/
 static void
 mpt_inactive_raid_list_free(MPT_ADAPTER *ioc)
@@ -4768,9 +4767,9 @@
  *
  * This sets up link list of phy_disk_nums for devices belonging in an ina=
ctive volume
  *
- * @ioc - pointer to per adapter structure
- * @channel - volume channel
- * @id - volume target id
+ * @ioc: pointer to per adapter structure
+ * @channel: volume channel
+ * @id: volume target id
  *
  *
  **/
@@ -6663,7 +6662,7 @@
 /**
  *	mpt_iocstatus_info_config - IOCSTATUS information for config pages
  *	@ioc: Pointer to MPT_ADAPTER structure
- *	ioc_status: U32 IOCStatus word from IOC
+ *	@ioc_status: U32 IOCStatus word from IOC
  *	@mf: Pointer to MPT request frame
  *
  *	Refer to lsi/mpi.h.

--=20
Regards/Gru=DF,
    Boris.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
