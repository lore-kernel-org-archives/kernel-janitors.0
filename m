From: Julia Lawall <julia@diku.dk>
Date: Sat, 18 Jul 2009 15:22:41 +0000
Subject: [PATCH] drivers/scsi: possible double spin_lock_irqsave
Message-Id: <Pine.LNX.4.64.0907181722060.26792@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James.Bottomley@HansenPartnership.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If both the test on rport and the call to get_device fail, then the lock is
already held.  The re-lock is thus moved up into the two branches.

On the other hand if kref_put should not be called with the lock held then
something else should be done.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression lock1,lock2;
expression flags;
@@

*spin_lock_irqsave(lock1,flags)
... when != flags
*spin_lock_irqsave(lock2,flags)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/scsi/ibmvscsi/ibmvfc.c      |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 166d964..d2b88bd 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -4278,15 +4278,16 @@ static void ibmvfc_rport_add_thread(struct work_struct *work)
 				if (!rport) {
 					spin_unlock_irqrestore(vhost->host->host_lock, flags);
 					ibmvfc_tgt_add_rport(tgt);
+					spin_lock_irqsave(vhost->host->host_lock, flags);
 				} else if (get_device(&rport->dev)) {
 					spin_unlock_irqrestore(vhost->host->host_lock, flags);
 					tgt_dbg(tgt, "Setting rport roles\n");
 					fc_remote_port_rolechg(rport, tgt->ids.roles);
 					put_device(&rport->dev);
+					spin_lock_irqsave(vhost->host->host_lock, flags);
 				}
 
 				kref_put(&tgt->kref, ibmvfc_release_tgt);
-				spin_lock_irqsave(vhost->host->host_lock, flags);
 				break;
 			}
 		}
