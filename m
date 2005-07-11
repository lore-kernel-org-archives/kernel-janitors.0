From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 11 Jul 2005 05:38:13 +0000
Subject: Re: [KJ] [PATCH 11/14] scsi/lpfc_scsi: use msleep() instead of
Message-Id: <20050711053813.GB14070@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74985004131776356=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050709000324.GD2596@us.ibm.com> <20050709001458.GQ2596@us.ibm.com> <20050710162009.GA2468@homer.coderock.org>
In-Reply-To: <20050710162009.GA2468@homer.coderock.org>
To: Domen Puncer <domen@coderock.org>
Cc: James.Bottomley@SteelEye.com, Kernel-Janitors <kernel-janitors@lists.osdl.org>, linux-scsi@vger.kernel.org

--===============74985004131776356==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 10.07.2005 [18:20:10 +0200], Domen Puncer wrote:
> On 08/07/05 17:14 -0700, Nishanth Aravamudan wrote:
> > From: Nishanth Aravamudan <nacc@us.ibm.com>
> > 
> > Description: Replace schedule_timeout() with msleep() to guarantee the
> > task delays as expected.
> > 
> > Patch is compile-tested.
> > 
> > Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> > 
> > ---
> > 
> >  lpfc_scsi.c |   13 +++++--------
> >  1 files changed, 5 insertions(+), 8 deletions(-)
> > 
> > diff -urp 2.6.13-rc2-kj/drivers/scsi/lpfc/lpfc_scsi.c 2.6.13-rc2-kj-dev/drivers/scsi/lpfc/lpfc_scsi.c
> > --- 2.6.13-rc2-kj/drivers/scsi/lpfc/lpfc_scsi.c	2005-07-06 07:57:19.000000000 -0700
> > +++ 2.6.13-rc2-kj-dev/drivers/scsi/lpfc/lpfc_scsi.c	2005-07-06 19:20:41.000000000 -0700
> ...
> > @@ -1110,8 +1108,7 @@ __lpfc_reset_bus_handler(struct scsi_cmn
> >  				&phba->sli.ring[phba->sli.fcp_ring],
> >  				0, 0, LPFC_CTX_HOST))) {
> >  		spin_unlock_irq(phba->host->host_lock);
> > -		set_current_state(TASK_UNINTERRUPTIBLE);
> > -		schedule_timeout(LPFC_RESET_WAIT*HZ);
> > +		msleep(LPFC_RESET_WAIT * HZ);
> 
> 					^^ ??
> I assume you meant 1000.

Gah! You are right. Fixed below. Thanks, Domen!

-Nish

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays as expected.

Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

---

 lpfc_scsi.c |   13 +++++--------
 1 files changed, 5 insertions(+), 8 deletions(-)

diff -urp 2.6.13-rc2-kj/drivers/scsi/lpfc/lpfc_scsi.c 2.6.13-rc2-kj-dev/drivers/scsi/lpfc/lpfc_scsi.c
--- 2.6.13-rc2-kj/drivers/scsi/lpfc/lpfc_scsi.c	2005-07-06 07:57:19.000000000 -0700
+++ 2.6.13-rc2-kj-dev/drivers/scsi/lpfc/lpfc_scsi.c	2005-07-06 19:20:41.000000000 -0700
@@ -24,6 +24,7 @@
 
 #include <linux/pci.h>
 #include <linux/interrupt.h>
+#include <linux/delay.h>
 
 #include <scsi/scsi.h>
 #include <scsi/scsi_device.h>
@@ -885,8 +886,7 @@ __lpfc_abort_handler(struct scsi_cmnd *c
 		while (cmnd->host_scribble)
 		{
 			spin_unlock_irq(phba->host->host_lock);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(LPFC_ABORT_WAIT*HZ);
+			msleep(LPFC_ABORT_WAIT * 1000);
 			spin_lock_irq(phba->host->host_lock);
 			if (++loop_count
 			    > (2 * phba->cfg_nodev_tmo)/LPFC_ABORT_WAIT)
@@ -952,8 +952,7 @@ __lpfc_reset_lun_handler(struct scsi_cmn
 
 		if (pnode->nlp_state != NLP_STE_MAPPED_NODE) {
 			spin_unlock_irq(phba->host->host_lock);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout( HZ/2);
+			msleep(500);
 			spin_lock_irq(phba->host->host_lock);
 		}
 		if ((pnode) && (pnode->nlp_state == NLP_STE_MAPPED_NODE))
@@ -1011,8 +1010,7 @@ __lpfc_reset_lun_handler(struct scsi_cmn
 				       cmnd->device->id, cmnd->device->lun,
 				       LPFC_CTX_LUN))) {
 		spin_unlock_irq(phba->host->host_lock);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(LPFC_RESET_WAIT*HZ);
+		msleep(LPFC_RESET_WAIT * 1000);
 		spin_lock_irq(phba->host->host_lock);
 
 		if (++loopcnt
@@ -1110,8 +1108,7 @@ __lpfc_reset_bus_handler(struct scsi_cmn
 				&phba->sli.ring[phba->sli.fcp_ring],
 				0, 0, LPFC_CTX_HOST))) {
 		spin_unlock_irq(phba->host->host_lock);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(LPFC_RESET_WAIT*HZ);
+		msleep(LPFC_RESET_WAIT * 1000);
 		spin_lock_irq(phba->host->host_lock);
 
 		if (++loopcnt

--===============74985004131776356==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74985004131776356==--
