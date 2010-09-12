From: Dan Carpenter <error27@gmail.com>
Date: Sun, 12 Sep 2010 21:40:33 +0000
Subject: [patch] qla2xxx: locking problem in qla2x00_init_rings()
Message-Id: <20100912214033.GF25351@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Vasquez <andrew.vasquez-h88ZbnxC6KDQT0dZR+AlfA@public.gmane.org>
Cc: linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Lalit Chandivade <lalit.chandivade-h88ZbnxC6KDQT0dZR+AlfA@public.gmane.org>, "James E.J. Bottomley" <James.Bottomley-l3A5Bk7waGM@public.gmane.org>, linux-driver-h88ZbnxC6KDQT0dZR+AlfA@public.gmane.org, arun.easi-h88ZbnxC6KDQT0dZR+AlfA@public.gmane.org, Giridhar Malavali <giridhar.malavali-h88ZbnxC6KDQT0dZR+AlfA@public.gmane.org>

IRQs are already disabled here so we don't need to disable them again.
But more importantly, the spin_lock_irqsave() overwrites "flags" and
that breaks things when we want to re-enable the IRQs when we call
spin_unlock_irqrestore(&ha->hardware_lock, flags);

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This seems like an important bug.  I don't have this hardware but could
someone from QLogic test this out and maybe queue it up for 2.6.36?

diff --git a/drivers/scsi/qla2xxx/qla_init.c b/drivers/scsi/qla2xxx/qla_init.c
index 9c383ba..9f4ba28 100644
--- a/drivers/scsi/qla2xxx/qla_init.c
+++ b/drivers/scsi/qla2xxx/qla_init.c
@@ -1787,14 +1787,14 @@ qla2x00_init_rings(scsi_qla_host_t *vha)
 		qla2x00_init_response_q_entries(rsp);
 	}
 
-	spin_lock_irqsave(&ha->vport_slock, flags);
+	spin_lock(&ha->vport_slock);
 	/* Clear RSCN queue. */
 	list_for_each_entry(vp, &ha->vp_list, list) {
 		vp->rscn_in_ptr = 0;
 		vp->rscn_out_ptr = 0;
 	}
 
-	spin_unlock_irqrestore(&ha->vport_slock, flags);
+	spin_unlock(&ha->vport_slock);
 
 	ha->isp_ops->config_rings(vha);
 
