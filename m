From: Julia Lawall <julia@diku.dk>
Date: Mon, 22 Aug 2011 14:00:34 +0000
Subject: [PATCH 2/4] drivers/scsi/fcoe/fcoe.c: add missing test
Message-Id: <1314021636-11528-2-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Love <robert.w.love-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-s9riP+hp16TNLxjTenLetw@public.gmane.org, "James E.J. Bottomley" <JBottomley-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>, linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Julia Lawall <julia@diku.dk>

The initializations of both fcoe_nport_scsi_transport and
fcoe_vport_scsi_transport can fail, so test both of them.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
identifier x,y,f!={PTR_ERR,ERR_PTR,ERR_CAST};
statement S;
@@

x = f(...);
(
if (\(x = NULL\|IS_ERR(x)\)) S
|
*if (\(y = NULL\|IS_ERR(y)\))
 { ... when != x
   return ...; }
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/scsi/fcoe/fcoe.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/fcoe/fcoe.c b/drivers/scsi/fcoe/fcoe.c
index ba710e3..921b636 100644
--- a/drivers/scsi/fcoe/fcoe.c
+++ b/drivers/scsi/fcoe/fcoe.c
@@ -1096,7 +1096,7 @@ static int __init fcoe_if_init(void)
 	fcoe_vport_scsi_transport  		fc_attach_transport(&fcoe_vport_fc_functions);
 
-	if (!fcoe_nport_scsi_transport) {
+	if (!fcoe_nport_scsi_transport || !fcoe_vport_scsi_transport) {
 		printk(KERN_ERR "fcoe: Failed to attach to the FC transport\n");
 		return -ENODEV;
 	}

