From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 06 Aug 2014 10:39:11 +0000
Subject: [PATCH 1/1] dpt_i2o: delete unnecessary null test on array
Message-Id: <1407321551-27479-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407321551-27479-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407321551-27479-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adaptec OEM Raid Solutions <aacraid@adaptec.com>
Cc: kernel-janitors@vger.kernel.org, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, joe@perches.com

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete NULL test on array (always false).

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r@
type T;
T [] e;
position p;
@@
e =@p NULL

@ disable fld_to_ptr@
expression e;
identifier f;
position r.p;
@@
* e.f =@p NULL
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
I don't know if this is the correct change, or if some other test was
intended.  But the code has been this way since at least 2.4.20, so it
would seem that no one has been bothered by the lack of whatever this was
supposed to test for.

 drivers/scsi/dpt_i2o.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/scsi/dpt_i2o.c b/drivers/scsi/dpt_i2o.c
index 67283ef..62e276b 100644
--- a/drivers/scsi/dpt_i2o.c
+++ b/drivers/scsi/dpt_i2o.c
@@ -1169,11 +1169,6 @@ static struct adpt_device* adpt_find_device(adpt_hba* pHba, u32 chan, u32 id, u6
 	if(chan < 0 || chan >= MAX_CHANNEL)
 		return NULL;
 	
-	if( pHba->channel[chan].device = NULL){
-		printk(KERN_DEBUG"Adaptec I2O RAID: Trying to find device before they are allocated\n");
-		return NULL;
-	}
-
 	d = pHba->channel[chan].device[id];
 	if(!d || d->tid = 0) {
 		return NULL;

