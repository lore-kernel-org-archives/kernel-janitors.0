From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 18:20:49 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 6/16] scsi/mesh: replace
Message-Id: <20040927182049.GU1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64460342889635847=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============64460342889635847==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/scsi/mesh.c	2004-09-13 17:16:01.000000000 -0700
+++ 2.6.9-rc2/drivers/scsi/mesh.c	2004-09-14 09:11:59.000000000 -0700
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

--===============64460342889635847==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64460342889635847==--
