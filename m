From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Thu, 05 Jun 2008 13:56:15 +0000
Subject: [PATCH] : Fix unused variable 'loops' warning in arch/x86/boot/a20.c
Message-Id: <ea11fea30806050644o216c798pbe88d269a63f64f2@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Following patch fixes the below warning message :
arch/x86/boot/a20.c:118: warning: unused variable 'loops'

========================
Signed-off-by : Manish Katiyar <mkatiyar@gmail.com>

diff --git a/arch/x86/boot/a20.c b/arch/x86/boot/a20.c
index 90943f8..d9f13bf 100644
--- a/arch/x86/boot/a20.c
+++ b/arch/x86/boot/a20.c
@@ -115,8 +115,6 @@ static void enable_a20_fast(void)

 int enable_a20(void)
 {
-       int loops = A20_ENABLE_LOOPS;
-
 #if defined(CONFIG_X86_ELAN)
        /* Elan croaks if we try to touch the KBC */
        enable_a20_fast();
@@ -128,6 +126,7 @@ int enable_a20(void)
        enable_a20_kbc();
        return 0;
 #else
+       int loops = A20_ENABLE_LOOPS;
        while (loops--) {
                /* First, check to see if A20 is already enabled
                   (legacy free, etc.) */


========================

-- 
Thanks & Regards,
********************************************
Manish Katiyar ( http://mkatiyar.googlepages.com )
3rd Floor, Fair Winds Block
EGL Software Park
Off Intermediate Ring Road
Bangalore 560071, India
***********************************************
