From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 04 May 2005 09:49:31 +0000
Subject: [KJ] [PATCH] drivers/block/paride/pt.c: replace direct assignment
Message-Id: <20050504094931.GP8647@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="d9ADC0YsG2v16Js0"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--d9ADC0YsG2v16Js0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
Use set_current_state() instead of direct assignment of
current->state.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--d9ADC0YsG2v16Js0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="linux-2.6.12-rc3_drivers_block_paride_pt.c.patch"

diff -urpNX dontdiff a/drivers/block/paride/pt.c b/drivers/block/paride/pt.c
--- a/drivers/block/paride/pt.c	2005-04-21 02:03:13.000000000 +0200
+++ b/drivers/block/paride/pt.c	2005-04-29 09:54:07.000000000 +0200
@@ -383,7 +383,7 @@ static int pt_atapi(struct pt_unit *tape
 
 static void pt_sleep(int cs)
 {
-	current->state = TASK_INTERRUPTIBLE;
+	set_current_state(TASK_INTERRUPTIBLE);
 	schedule_timeout(cs);
 }
 

--d9ADC0YsG2v16Js0
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--d9ADC0YsG2v16Js0--
