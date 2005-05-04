From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 04 May 2005 09:47:05 +0000
Subject: [KJ] [PATCH] drivers/block/paride/pf.c: replace direct assignment
Message-Id: <20050504094705.GN8647@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Fba/0zbH8Xs+Fj9o"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
Use set_current_state() instead of direct assignment of
current->state.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="linux-2.6.12-rc3_drivers_block_paride_pf.c.patch"

diff -urpNX dontdiff a/drivers/block/paride/pf.c b/drivers/block/paride/pf.c
--- a/drivers/block/paride/pf.c	2005-04-21 02:03:13.000000000 +0200
+++ b/drivers/block/paride/pf.c	2005-04-29 09:53:38.000000000 +0200
@@ -507,7 +507,7 @@ static void pf_eject(struct pf_unit *pf)
 
 static void pf_sleep(int cs)
 {
-	current->state = TASK_INTERRUPTIBLE;
+	set_current_state(TASK_INTERRUPTIBLE);
 	schedule_timeout(cs);
 }
 

--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Fba/0zbH8Xs+Fj9o--
