From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:40:42 +0000
Subject: [Kernel-janitors] [PATCH] scsi/mesh: replace schedule_timeout()
Message-Id: <20040727224042.GB4537@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17128529423537131=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============17128529423537131==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/scsi/mesh.c	2004-06-16 05:19:37.000000000 +0000
+++ linux-dev/drivers/scsi/mesh.c	2004-07-03 03:51:40.000000000 +0000
@@ -388,8 +388,7 @@ static void mesh_init(struct mesh_state 
 		mesh_flush_io(mr);
 
 		/* Wait for bus to come back */
-		current->state = TASK_UNINTERRUPTIBLE;
-		schedule_timeout((init_reset_delay * HZ) / 1000);
+		msleep(init_reset_delay);
 	}
 	
 	/* Reconfigure controller */
@@ -1749,12 +1748,10 @@ static void set_mesh_power(struct mesh_s
 		return;
 	if (state) {
 		pmac_call_feature(PMAC_FTR_MESH_ENABLE, macio_get_of_node(ms->mdev), 0, 1);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ/5);
+		msleep(200);
 	} else {
 		pmac_call_feature(PMAC_FTR_MESH_ENABLE, macio_get_of_node(ms->mdev), 0, 0);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ/100);
+		msleep(10);
 	}
 }			
 
@@ -1772,8 +1769,7 @@ static int mesh_suspend(struct macio_dev
 	spin_lock_irqsave(ms->host->host_lock, flags);
 	while(ms->phase != idle) {
 		spin_unlock_irqrestore(ms->host->host_lock, flags);
-		current->state = TASK_UNINTERRUPTIBLE;
-		schedule_timeout(HZ/100);
+		msleep(10);
 		spin_lock_irqsave(ms->host->host_lock, flags);
 	}
 	ms->phase = sleeping;

--===============17128529423537131==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17128529423537131==--
