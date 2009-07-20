From: Brian King <brking@linux.vnet.ibm.com>
Date: Mon, 20 Jul 2009 14:58:52 +0000
Subject: Re: [PATCH] drivers/scsi: possible double spin_lock_irqsave
Message-Id: <4A64862C.6030704@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907181722060.26792@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907181722060.26792@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: James.Bottomley@HansenPartnership.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> If both the test on rport and the call to get_device fail, then the lock is
> already held.  The re-lock is thus moved up into the two branches.
> 
> On the other hand if kref_put should not be called with the lock held then
> something else should be done.

kref_put should not be called with the lock held. Updated patch below.

Thanks,

Brian

-- 
Brian King
Linux on Power Virtualization
IBM Linux Technology Center


Fixes a potential deadlock in the ibmvfc driver in the rport
add thread if it encounters an rport it wants to add which
it cannot get a reference to.

Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
---

 drivers/scsi/ibmvscsi/ibmvfc.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff -puN drivers/scsi/ibmvscsi/ibmvfc.c~ibmvfc_fix_add_locking drivers/scsi/ibmvscsi/ibmvfc.c
--- linux-2.6/drivers/scsi/ibmvscsi/ibmvfc.c~ibmvfc_fix_add_locking	2009-07-20 09:49:28.000000000 -0500
+++ linux-2.6-bjking1/drivers/scsi/ibmvscsi/ibmvfc.c	2009-07-20 09:54:54.000000000 -0500
@@ -4283,7 +4283,8 @@ static void ibmvfc_rport_add_thread(stru
 					tgt_dbg(tgt, "Setting rport roles\n");
 					fc_remote_port_rolechg(rport, tgt->ids.roles);
 					put_device(&rport->dev);
-				}
+				} else
+					spin_unlock_irqrestore(vhost->host->host_lock, flags);
 
 				kref_put(&tgt->kref, ibmvfc_release_tgt);
 				spin_lock_irqsave(vhost->host->host_lock, flags);
_
