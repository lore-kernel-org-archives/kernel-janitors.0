From: irwan.djajadi@iname.com
Date: Sun, 23 Oct 2005 02:56:31 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/block/swim_iop.c: replace
Message-Id: <20051023025631.GE2438@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============077372421601076713=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023025351.GC2438@poopie.dyndns.org>
In-Reply-To: <20051023025351.GC2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============077372421601076713==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/block/swim_iop.c: replace interruptible_sleep_on() with
wait_event_interruptible()

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/block/swim_iop.c mod/drivers/block/swim_iop.c
--- 2.6.14-rc5/drivers/block/swim_iop.c	2005-10-22 00:06:17.000000000 -0500
+++ mod/drivers/block/swim_iop.c	2005-10-22 15:33:26.000000000 -0500
@@ -436,7 +436,7 @@ static int grab_drive(struct floppy_stat
 				local_irq_restore(flags);
 				return -EINTR;
 			}
-			interruptible_sleep_on(&fs->wait);
+			wait_event_interruptible(fs->wait, fs->state == available);
 		}
 		--fs->wanted;
 	}
 



--===============077372421601076713==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============077372421601076713==--
