From: Kulikov Vasiliy <segooon@gmail.com>
Date: Wed, 28 Jul 2010 16:39:44 +0000
Subject: [PATCH 04/10] x86: mce: fix error handling
Message-Id: <1280335185-23265-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>, Borislav Petkov <borislav.petkov@amd.com>, Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org

mcheck_init_device() poorly handles errors. If any request fails
unregister and free everything.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 arch/x86/kernel/cpu/mcheck/mce.c |   24 ++++++++++++++++++++----
 1 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/mcheck/mce.c b/arch/x86/kernel/cpu/mcheck/mce.c
index ed41562..a1119f1 100644
--- a/arch/x86/kernel/cpu/mcheck/mce.c
+++ b/arch/x86/kernel/cpu/mcheck/mce.c
@@ -2124,22 +2124,38 @@ static __init int mcheck_init_device(void)
 	if (!mce_available(&boot_cpu_data))
 		return -EIO;
 
-	zalloc_cpumask_var(&mce_dev_initialized, GFP_KERNEL);
+	if (!zalloc_cpumask_var(&mce_dev_initialized, GFP_KERNEL))
+		return -ENOMEM;
 
 	mce_init_banks();
 
 	err = sysdev_class_register(&mce_sysclass);
 	if (err)
-		return err;
+		goto err_free_cpumask_var;
 
 	for_each_online_cpu(i) {
 		err = mce_create_device(i);
 		if (err)
-			return err;
+			goto mce_remove_devices;
 	}
 
 	register_hotcpu_notifier(&mce_cpu_notifier);
-	misc_register(&mce_log_device);
+	err = misc_register(&mce_log_device);
+	if (err)
+		goto err_unreg_notifier;
+	return 0;
+
+err_unreg_notifier:
+	unregister_hotcpu_notifier(&mce_cpu_notifier);
+
+mce_remove_devices:
+	for_each_online_cpu(i)
+		mce_remove_device(i);
+
+	sysdev_class_unregister(&mce_sysclass);
+
+err_free_cpumask_var:
+	free_cpumask_var(mce_dev_initialized);
 
 	return err;
 }
-- 
1.7.0.4

