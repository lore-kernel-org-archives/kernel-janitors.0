From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Thu, 09 Feb 2006 12:15:31 +0000
Subject: Re: [KJ][Patch] remove implicit sign bit in msp3400.h
Message-Id: <1139487337.17930.17.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77361711431297653=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139380004.9409.40.camel@localhost.localdomain>
In-Reply-To: <1139380004.9409.40.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============77361711431297653==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2006-02-08 at 07:32 -0800, Randy.Dunlap wrote:
> Please keep the same spacing/tab/alignment.

Fair enough

> And usually "unsigned int" is preferred in kernel source code.

After doing a grep on the kernel I have to agree, most of them are
"unsigned int foo :1;" 
Weird if you ask me. I'm pretty sure the C standard says they are
promoted to an int for calculations. But I suppose as it makes no
difference it is better to stick with convention.

So here is a re-send of the patch.


Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>


--- linux-2.6.16-rc2/drivers/media/video/msp3400.h.orig	2006-02-08 15:57:02.000000000 +1100
+++ linux-2.6.16-rc2/drivers/media/video/msp3400.h	2006-02-09 22:55:41.000000000 +1100
@@ -86,8 +86,8 @@ struct msp_state {
 	/* thread */
 	struct task_struct   *kthread;
 	wait_queue_head_t    wq;
-	int                  restart:1;
-	int                  watch_stereo:1;
+	unsigned int         restart:1;
+	unsigned int         watch_stereo:1;
 };
 
 /* msp3400-driver.c */



--===============77361711431297653==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77361711431297653==--
