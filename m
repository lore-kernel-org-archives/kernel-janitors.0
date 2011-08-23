From: Julia Lawall <julia@diku.dk>
Date: Tue, 23 Aug 2011 08:42:41 +0000
Subject: RE: [Open-FCoE] [PATCH 2/4] drivers/scsi/fcoe/fcoe.c: add missing
Message-Id: <Pine.LNX.4.64.1108231041520.25811@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1314021636-11528-2-git-send-email-julia@diku.dk>
 <alpine.LNX.2.00.1108221632130.9774@swampdragon.chaosbits.net>
 <Pine.LNX.4.64.1108221648560.10948@ask.diku.dk>
 <5A9BD224CEA58D4CB62235967D650C1609F5B04B@orsmsx509.amr.corp.intel.com>
In-Reply-To: <5A9BD224CEA58D4CB62235967D650C1609F5B04B@orsmsx509.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Zou, Yi" <yi.zou@intel.com>
Cc: Jesper Juhl <jj@chaosbits.net>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "James E.J. Bottomley" <JBottomley@parallels.com>, "devel@open-fcoe.org" <devel@open-fcoe.org>

From: Julia Lawall <julia@diku.dk>

The initializations of both fcoe_nport_scsi_transport and
fcoe_vport_scsi_transport can fail, so test both of them.

Convert the return value to -ENOMEM to better reflect the reason for the 
error.

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
 drivers/scsi/fcoe/fcoe.c |   15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/fcoe/fcoe.c b/drivers/scsi/fcoe/fcoe.c
index ba710e3..2a279eb 100644
--- a/drivers/scsi/fcoe/fcoe.c
+++ b/drivers/scsi/fcoe/fcoe.c
@@ -1093,12 +1093,21 @@ static int __init fcoe_if_init(void)
 	/* attach to scsi transport */
 	fcoe_nport_scsi_transport  		fc_attach_transport(&fcoe_nport_fc_functions);
+
+	if (!fcoe_nport_scsi_transport) {
+		printk(KERN_ERR
+		       "fcoe_nport: Failed to attach to the FC transport\n");
+		return -ENOMEM;
+	}
+
 	fcoe_vport_scsi_transport  		fc_attach_transport(&fcoe_vport_fc_functions);
 
-	if (!fcoe_nport_scsi_transport) {
-		printk(KERN_ERR "fcoe: Failed to attach to the FC transport\n");
-		return -ENODEV;
+	if (!fcoe_vport_scsi_transport) {
+		printk(KERN_ERR
+		       "fcoe_vport: Failed to attach to the FC transport\n");
+		fc_release_transport(fcoe_nport_scsi_transport);
+		return -ENOMEM;
 	}
 
 	return 0;
