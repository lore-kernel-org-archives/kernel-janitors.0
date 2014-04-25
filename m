From: Mathieu Souchaud <mattieu.souchaud@free.fr>
Date: Fri, 25 Apr 2014 17:40:04 +0000
Subject: [PATCH] x86/mce: Improve mcheck_init_device() error handling.
Message-Id: <1398447604-21471-1-git-send-email-mattieu.souchaud@free.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tony.luck@intel.com, bp@alien8.de, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Mathieu Souchaud <mattieu.souchaud@free.fr>

Check return code of every function called.

Signed-off-by: Mathieu Souchaud <mattieu.souchaud@free.fr>
---
 arch/x86/kernel/cpu/mcheck/mce.c |   30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/mcheck/mce.c b/arch/x86/kernel/cpu/mcheck/mce.c
index 68317c8..b865285 100644
--- a/arch/x86/kernel/cpu/mcheck/mce.c
+++ b/arch/x86/kernel/cpu/mcheck/mce.c
@@ -2437,33 +2437,49 @@ static __init int mcheck_init_device(void)
 	int err;
 	int i = 0;
 
-	if (!mce_available(&boot_cpu_data))
-		return -EIO;
+	if (!mce_available(&boot_cpu_data)) {
+		err = -EIO;
+		goto err_out;
+	}
 
-	zalloc_cpumask_var(&mce_device_initialized, GFP_KERNEL);
+	if (!zalloc_cpumask_var(&mce_device_initialized, GFP_KERNEL)) {
+		err = -ENOMEM;
+		goto err_out;
+	}
 
 	mce_init_banks();
 
 	err = subsys_system_register(&mce_subsys, NULL);
 	if (err)
-		return err;
+		goto err_out_mem;
 
 	cpu_notifier_register_begin();
 	for_each_online_cpu(i) {
 		err = mce_device_create(i);
 		if (err) {
 			cpu_notifier_register_done();
-			return err;
+			goto err_out_mem;
 		}
 	}
 
 	register_syscore_ops(&mce_syscore_ops);
-	__register_hotcpu_notifier(&mce_cpu_notifier);
+	err = __register_hotcpu_notifier(&mce_cpu_notifier);
 	cpu_notifier_register_done();
+	if (err)
+		goto err_out_mem;
 
 	/* register character device /dev/mcelog */
-	misc_register(&mce_chrdev_device);
+	err = misc_register(&mce_chrdev_device);
+	if (err)
+		goto err_out_mem;
+
+	return 0;
+
+err_out_mem:
+	free_cpumask_var(mce_device_initialized);
 
+err_out:
+	pr_err("Unable to init device /dev/mcelog (rc: %d)\n", err);
 	return err;
 }
 device_initcall_sync(mcheck_init_device);
-- 
1.7.9.5

