From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 04 May 2005 10:04:38 +0000
Subject: [KJ] [PATCH] drivers/char/selection.c: replace direct assignment
Message-Id: <20050504100438.GW8647@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="GvuyDaC2GNSBQusT"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--GvuyDaC2GNSBQusT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
Use set_current_state() instead of direct assignment of
current->state.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

--GvuyDaC2GNSBQusT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="linux-2.6.12-rc3_drivers_char_selection.c.patch"

diff -urpNX dontdiff a/drivers/char/selection.c b/drivers/char/selection.c
--- a/drivers/char/selection.c	2005-04-21 02:03:13.000000000 +0200
+++ b/drivers/char/selection.c	2005-04-29 10:07:47.000000000 +0200
@@ -299,7 +299,7 @@ int paste_selection(struct tty_struct *t
 		pasted += count;
 	}
 	remove_wait_queue(&vc->paste_wait, &wait);
-	current->state = TASK_RUNNING;
+	set_current_state(TASK_RUNNING);
 
 	tty_ldisc_deref(ld);
 	return 0;

--GvuyDaC2GNSBQusT
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--GvuyDaC2GNSBQusT--
