From: irwan.djajadi@iname.com
Date: Sun, 23 Oct 2005 02:55:25 +0000
Subject: [KJ] [PATCH 2.6.14-rc5 1/1] drivers/block/swim3.c: replace
Message-Id: <20051023025525.GD2438@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92453987270262017=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051023025351.GC2438@poopie.dyndns.org>
In-Reply-To: <20051023025351.GC2438@poopie.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============92453987270262017==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

drivers/block/swim3.c: replace interruptible_sleep_on() with
wait_event_interruptible()

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruNX 2.6.14-rc5/Documentation/dontdiff 2.6.14-rc5/drivers/block/swim3.c mod/drivers/block/swim3.c
--- 2.6.14-rc5/drivers/block/swim3.c	2005-10-22 00:06:17.000000000 -0500
+++ mod/drivers/block/swim3.c	2005-10-22 15:31:52.000000000 -0500
@@ -800,7 +800,7 @@ static int grab_drive(struct floppy_stat
 				restore_flags(flags);
 				return -EINTR;
 			}
-			interruptible_sleep_on(&fs->wait);
+			wait_event_interruptible(fs->wait, fs->state == available);
 		}
 		--fs->wanted;
 	}
 



--===============92453987270262017==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92453987270262017==--
