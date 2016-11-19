From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Sat, 19 Nov 2016 18:22:56 +0000
Subject: [PATCH] xen-scsifront: Add a missing call to kfree
Message-Id: <20161119182256.9081-1-lambert.quentin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Vrabel <david.vrabel@citrix.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Quentin Lambert <lambert.quentin@gmail.com>

Most error branches following the call to kmalloc contain
a call to kfree. This patch add these calls where they are
missing.

This issue was found with Hector.

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>

---
 drivers/scsi/xen-scsifront.c |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/scsi/xen-scsifront.c
+++ b/drivers/scsi/xen-scsifront.c
@@ -627,6 +627,7 @@ static int scsifront_action_handler(stru
 
 	if (scsifront_enter(info)) {
 		spin_unlock_irq(host->host_lock);
+		kfree(shadow);
 		return FAILED;
 	}
 
