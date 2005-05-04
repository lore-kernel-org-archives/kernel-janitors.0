From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 04 May 2005 11:49:48 +0000
Subject: [KJ] [PATCH] drivers/ide/ide-tape.c: replace by msleep_interruptible
Message-Id: <20050504114948.GC8647@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="bEjdSXxHv0Az5++U"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050504100540.GX8647@rhum.iomeda.fr>
In-Reply-To: <20050504100540.GX8647@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--bEjdSXxHv0Az5++U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
Use msleep_interruptible() instead of schedule_timeout() to guarantee
the task delays as expected.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

--bEjdSXxHv0Az5++U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch-msleep_interruptible

Index: b/drivers/ide/ide-tape.c
===================================================================
--- b.orig/drivers/ide/ide-tape.c	2005-05-04 12:29:30.528765848 +0200
+++ b/drivers/ide/ide-tape.c	2005-05-04 13:37:45.331261248 +0200
@@ -2903,8 +2903,7 @@
 		} else if (!(tape->sense_key == 2 && tape->asc == 4 &&
 			     (tape->ascq == 1 || tape->ascq == 8)))
 			return -EIO;
-		set_current_state(TASK_INTERRUPTIBLE);
-  		schedule_timeout(HZ / 10);
+		msleep_interruptible(100);
 	}
 	return -EIO;
 }

--bEjdSXxHv0Az5++U
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--bEjdSXxHv0Az5++U--
