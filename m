From: Gustavo Franco <stratus@acm.org>
Date: Mon, 03 May 2004 01:06:32 +0000
Subject: [Kernel-janitors] [REDIFF] Replaces yield() with schedule_timeout()
Message-Id: <40959B18.30405@acm.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22873231041652864=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <40904739.9060501@acm.org>
In-Reply-To: <40904739.9060501@acm.org>
To: kernel-janitors@vger.kernel.org

--===============22873231041652864==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

It's the second REDIFF, and i've more two.


Hope that helps,
Gustavo Franco

--- drivers/cdrom/cdu31a.c.orig 2004-04-28 20:43:51.000000000 -0300
+++ drivers/cdrom/cdu31a.c      2004-04-28 20:44:55.000000000 -0300
@@ -386,7 +386,8 @@
         unsigned long flags;
 

         if (cdu31a_irq <= 0) {
-               yield();
+               set_current_state(TASK_INTERRUPTIBLE);
+               schedule_timeout(1);
         } else {                /* Interrupt driven */
 

                 save_flags(flags);


--===============22873231041652864==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22873231041652864==--
