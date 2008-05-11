From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Sun, 11 May 2008 17:49:55 +0000
Subject: [PATCH] Remove unused variable "cpu" from arch/x86/xen/setup.c
Message-Id: <ea11fea30805111037m84000efp8ac5b019a884beec@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Forgot to cc to Janitors list.


---------- Forwarded message ----------
From: Manish Katiyar <mkatiyar@gmail.com>
Date: Sun, May 11, 2008 at 10:57 PM
Subject: [PATCH] Remove unused variable "cpu" from arch/x86/xen/setup.c
To: LKML <linux-kernel@vger.kernel.org>


Remove unused variable "cpu" from arch/x86/xen/setup.c


Signed-off-by : Manish Katiyar (mkatiyar@gmail.com)

diff -Nur a/x86/xen/setup.c b/arch/x86/xen/setup.c
--- a/arch/x86/xen/setup.c       2008-04-26 20:36:15.000000000 +0530
+++ b/arch/x86/xen/setup.c    2008-05-11 22:50:35.000000000 +0530
@@ -71,7 +71,6 @@

 void xen_enable_sysenter(void)
 {
-       int cpu = smp_processor_id();
      extern void xen_sysenter_target(void);
      /* Mask events on entry, even though they get enabled immediately */
      static struct callback_register sysenter = {


--
Thanks & Regards,
********************************************
Manish Katiyar ( http://mkatiyar.googlepages.com )
3rd Floor, Fair Winds Block
EGL Software Park
Off Intermediate Ring Road
Bangalore 560071, India
***********************************************



-- 
Thanks & Regards,
********************************************
Manish Katiyar ( http://mkatiyar.googlepages.com )
3rd Floor, Fair Winds Block
EGL Software Park
Off Intermediate Ring Road
Bangalore 560071, India
***********************************************
