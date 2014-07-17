From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Thu, 17 Jul 2014 16:25:50 +0000
Subject: [PATCH 1/4] drivers/xen/events/events_base.c: drop negativity check of unsigned parameter
Message-Id: <1405614350-4453-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: wei.liu2@citrix.com, tglx@linutronix.de, david.vrabel@citrix.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, Andrey Utkin <andrey.krieger.utkin@gmail.com>

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80531
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 drivers/xen/events/events_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_b=
ase.c
index c919d3d..5b5c5ff 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -246,7 +246,7 @@ static void xen_irq_info_cleanup(struct irq_info *info)
  */
 unsigned int evtchn_from_irq(unsigned irq)
 {
-	if (unlikely(WARN(irq < 0 || irq >=3D nr_irqs, "Invalid irq %d!\n", irq)))
+	if (unlikely(WARN(irq >=3D nr_irqs, "Invalid irq %d!\n", irq)))
 		return 0;
=20
 	return info_for_irq(irq)->evtchn;
--=20
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
