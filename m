From: =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>
Date: Mon, 19 May 2014 21:09:22 +0000
Subject: [PATCH] lpfc: Use time_after()
Message-Id: <1400533762-10338-1-git-send-email-manuel.schoelling@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: james.smart@emulex.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>

To be future-proof and for better readability the time comparisons are modi=
fied
to use time_after() instead of plain, error-prone math.

Signed-off-by: Manuel Sch=C3=B6lling <manuel.schoelling@gmx.de>
---
 drivers/scsi/lpfc/lpfc_scsi.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/lpfc/lpfc_scsi.c b/drivers/scsi/lpfc/lpfc_scsi.c
index 462453e..fb5351a 100644
--- a/drivers/scsi/lpfc/lpfc_scsi.c
+++ b/drivers/scsi/lpfc/lpfc_scsi.c
@@ -380,12 +380,14 @@ lpfc_rampdown_queue_depth(struct lpfc_hba *phba)
 {
 	unsigned long flags;
 	uint32_t evt_posted;
+	unsigned long expires;
=20
 	spin_lock_irqsave(&phba->hbalock, flags);
 	atomic_inc(&phba->num_rsrc_err);
 	phba->last_rsrc_error_time =3D jiffies;
=20
-	if ((phba->last_ramp_down_time + QUEUE_RAMP_DOWN_INTERVAL) > jiffies) {
+	expires =3D phba->last_ramp_down_time + QUEUE_RAMP_DOWN_INTERVAL;
+	if (time_after(expires, jiffies)) {
 		spin_unlock_irqrestore(&phba->hbalock, flags);
 		return;
 	}
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
