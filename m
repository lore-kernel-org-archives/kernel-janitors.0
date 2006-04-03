From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Mon, 03 Apr 2006 10:27:36 +0000
Subject: [KJ][Patch] fix kbuild warning in pm2fb.o
Message-Id: <1144060056.7790.3.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82687258589129176=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel Janitors <kernel-janitors@lists.osdl.org>
Cc: LKML <linux-kernel@vger.kernel.org>

--===============82687258589129176==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

There are a couple of Section mismatch problems in drivers/video/pm2fb.o

WARNING: drivers/video/pm2fb.o - Section mismatch: reference
to .init.data: from .text after 'pm2fb_set_par' (at offset 0xd5d)
WARNING: drivers/video/pm2fb.o - Section mismatch: reference
to .init.data: from .text after 'pm2fb_set_par' (at offset 0xd82)



They are caused because pm2fb_set_par() uses lowhsync and lowvsync which
are marked __devinitdata.


The patch below simply removes the __devinitdata annotations.


Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- 2.6.16-git20/drivers/video/pm2fb.c.orig	2006-04-03 19:08:51.000000000 +1000
+++ 2.6.16-git20/drivers/video/pm2fb.c	2006-04-03 19:09:34.000000000 +1000
@@ -73,8 +73,8 @@ static char *mode __devinitdata = NULL;
  * these flags allow the user to specify that requests for +ve sync
  * should be silently turned in -ve sync.
  */
-static int lowhsync __devinitdata = 0;
-static int lowvsync __devinitdata = 0;
+static int lowhsync = 0;
+static int lowvsync = 0;
 
 /*
  * The hardware state of the graphics card that isn't part of the



--===============82687258589129176==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82687258589129176==--
