From: Mathieu Souchaud <mattieu.souchaud@free.fr>
Date: Fri, 25 Apr 2014 09:48:15 +0000
Subject: [PATCH] x86/mce: Check misc_register() return code.
Message-Id: <1398419295-18590-1-git-send-email-mattieu.souchaud@free.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tony.luck@intel.com, bp@alien8.de, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Mathieu Souchaud <mattieu.souchaud@free.fr>

The current code does not check the return from misc_register() so set
the return variable with the return code of misc_register.

Signed-off-by: Mathieu Souchaud <mattieu.souchaud@free.fr>
---
 arch/x86/kernel/cpu/mcheck/mce.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mcheck/mce.c b/arch/x86/kernel/cpu/mcheck/mce.c
index 68317c8..45fb7aa 100644
--- a/arch/x86/kernel/cpu/mcheck/mce.c
+++ b/arch/x86/kernel/cpu/mcheck/mce.c
@@ -2462,7 +2462,7 @@ static __init int mcheck_init_device(void)
 	cpu_notifier_register_done();
 
 	/* register character device /dev/mcelog */
-	misc_register(&mce_chrdev_device);
+	err = misc_register(&mce_chrdev_device);
 
 	return err;
 }
-- 
1.7.9.5

