From: Borislav Petkov <petkov@math.uni-muenster.de>
Date: Fri, 06 Apr 2007 07:44:12 +0000
Subject: [KJ] [PATCH 2/5] Fix warnings when building 'xmldocs' target:
Message-Id: <20070406074412.GA4845@gollum.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Signed-off-by: Borislav Petkov <bbpetkov@yahoo.de>

--- kernel.orig/20-rc5/drivers/message/fusion/mptscsih.c	2007-04-05 09:41:5=
5.000000000 +0200
+++ kernel/20-rc5/drivers/message/fusion/mptscsih.c	2007-04-05 10:51:37.000=
000000 +0200
@@ -1540,8 +1540,10 @@
  *	Fall through to mpt_HardResetHandler if: not operational, too many
  *	failed TM requests or handshake failure.
  *
- *	@ioc: Pointer to MPT_ADAPTER structure
+ *	@hd: Pointer to MPT_SCSI_HOST structure
  *	@type: Task Management type
+ *	@channel: volume channel
+ *	@timeout: command request timeout
  *	@id: Logical Target ID for reset (if appropriate)
  *	@lun: Logical Unit for reset (if appropriate)
  *	@ctx2abort: Context for the task to be aborted (if appropriate)
@@ -1650,6 +1652,8 @@
  *	mptscsih_IssueTaskMgmt - Generic send Task Management function.
  *	@hd: Pointer to MPT_SCSI_HOST structure
  *	@type: Task Management type
+ *	@channel: volume channel
+ *	@timeout: command request timeout
  *	@id: Logical Target ID for reset (if appropriate)
  *	@lun: Logical Unit for reset (if appropriate)
  *	@ctx2abort: Context for the task to be aborted (if appropriate)
@@ -2022,6 +2026,7 @@
 /**
  *	mptscsih_tm_wait_for_completion - wait for completion of TM task
  *	@hd: Pointer to MPT host structure.
+ *	@timeout: command request timeout
  *
  *	Returns {SUCCESS,FAILED}.
  */

--=20
Regards/Gru=DF,
    Boris.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
