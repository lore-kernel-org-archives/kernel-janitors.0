From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 04 May 2005 09:48:19 +0000
Subject: [KJ] [PATCH] drivers/block/paride/pg.c: replace direct assignment
Message-Id: <20050504094819.GO8647@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="96YOpH+ONegL0A3E"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--96YOpH+ONegL0A3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
Use set_current_state() instead of direct assignment of
current->state.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--96YOpH+ONegL0A3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="linux-2.6.12-rc3_drivers_block_paride_pg.c.patch"

diff -urpNX dontdiff a/drivers/block/paride/pg.c b/drivers/block/paride/pg.c
--- a/drivers/block/paride/pg.c	2005-04-21 02:03:13.000000000 +0200
+++ b/drivers/block/paride/pg.c	2005-04-29 09:53:53.000000000 +0200
@@ -276,7 +276,7 @@ static inline u8 DRIVE(struct pg *dev)
 
 static void pg_sleep(int cs)
 {
-	current->state = TASK_INTERRUPTIBLE;
+	set_current_state(TASK_INTERRUPTIBLE);
 	schedule_timeout(cs);
 }
 

--96YOpH+ONegL0A3E
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--96YOpH+ONegL0A3E--
