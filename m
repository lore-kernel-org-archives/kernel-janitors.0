From: Gustavo Franco <stratus@acm.org>
Date: Mon, 03 May 2004 01:24:44 +0000
Subject: [Kernel-janitors] [REDIFF] Replaces yield() with nicedelay() on
Message-Id: <40959F5C.7070002@acm.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84460297216482649=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <40904739.9060501@acm.org>
In-Reply-To: <40904739.9060501@acm.org>
To: kernel-janitors@vger.kernel.org

--===============84460297216482649==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

It's the last REDIFF, but i'm not replacing yield() with 
schedule_timeout() because there's a nicedelay() (maybe the
usecs need to be tuned below) there:


static inline void nicedelay(unsigned long usecs)
{
         current->state = TASK_INTERRUPTIBLE;
         schedule_timeout(HZ);
         return;
}

Hope that helps,
Gustavo Franco

--- drivers/net/sb1000.c.orig   2004-04-28 20:50:17.000000000 -0300
+++ drivers/net/sb1000.c        2004-04-28 20:49:10.000000000 -0300
@@ -271,7 +271,7 @@
         timeout = jiffies + TimeOutJiffies;
         while (a & 0x80 || a & 0x40) {
                 /* a little sleep */
-               yield();
+               nicedelay(10000);
 

                 a = inb(ioaddr[0] + 7);
                 if (time_after_eq(jiffies, timeout)) {
@@ -295,7 +295,7 @@
         timeout = jiffies + TimeOutJiffies;
         while (a & 0x80 || !(a & 0x40)) {
                 /* a little sleep */
-               yield();
+               nicedelay(10000);
 

                 a = inb(ioaddr[1] + 6);
                 if (time_after_eq(jiffies, timeout)) {




--===============84460297216482649==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84460297216482649==--
