From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 08 Feb 2006 06:26:44 +0000
Subject: [KJ][Patch] remove implicit sign bit in msp3400.h
Message-Id: <1139380004.9409.40.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38397987390203214=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============38397987390203214==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day

the two fields here

	int restart:1;
	int watch_stereo:1;

they both seem to be used as single bit flags. So this patch just makes
them unsigned.

Note : Not sure if something should be done in msp3400-driver.c as 
"int msp_sleep(struct msp_state *state, int timeout)"
is declared to return an int then returns
"return state->restart;" which is now "unsigned:1;"
This seems ok but I don't know if gcc will issue a warning without a
cast.
Note: if anyone can tell me if it's possible/how to compile
msp3400-driver.c by its self that would be handy.



--- linux-2.6.16-rc2/drivers/media/video/msp3400.h.orig	2006-02-08 15:57:02.000000000 +1100
+++ linux-2.6.16-rc2/drivers/media/video/msp3400.h	2006-02-08 17:09:45.000000000 +1100
@@ -86,8 +86,8 @@ struct msp_state {
 	/* thread */
 	struct task_struct   *kthread;
 	wait_queue_head_t    wq;
-	int                  restart:1;
-	int                  watch_stereo:1;
+	unsigned restart:1;
+	unsigned watch_stereo:1;
 };
 
 /* msp3400-driver.c */



--===============38397987390203214==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38397987390203214==--
