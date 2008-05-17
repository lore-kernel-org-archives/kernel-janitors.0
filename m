From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Sat, 17 May 2008 04:23:10 +0000
Subject: [PATCH] Remove "unused variable" warning in arch/x86/xen/setup.c on UP systems.
Message-Id: <ea11fea30805162111v42f86555i816ec6915a89da3e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>, trivial@vger.kernel.org, kernel-janitors@vger.kernel.org

On UP systems cpu_data is defined as boot_cpu_data, due to which we
get the below error while compiling xen.

CC      arch/x86/xen/setup.o
arch/x86/xen/setup.c: In function 'xen_enable_sysenter':
arch/x86/xen/setup.c:74: warning: unused variable 'cpu'

The below patch defines the variable only when SMP is defined.


Signed-off-by : Manish Katiyar <mkatiyar@gmail.com>

diff -Nur a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
--- a/arch/x86/xen/setup.c       2008-04-26 20:36:15.000000000 +0530
+++ b/arch/x86/xen/setup.c        2008-05-17 09:30:12.000000000 +0530
@@ -71,7 +71,9 @@

 void xen_enable_sysenter(void)
 {
+#ifdef CONFIG_SMP
        int cpu = smp_processor_id();
+#endif
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
