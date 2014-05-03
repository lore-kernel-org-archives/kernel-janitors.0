From: Mathieu Souchaud <mattieu.souchaud@free.fr>
Date: Sat, 03 May 2014 21:03:51 +0000
Subject: [PATCH v2] x86/mce: Improve mcheck_init_device() error handling
Message-Id: <1399151031-19905-1-git-send-email-mattieu.souchaud@free.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tony.luck@intel.com, bp@alien8.de, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Mathieu Souchaud <mattieu.souchaud@free.fr>

Check return code of every function called by mcheck_init_device().

Signed-off-by: Mathieu Souchaud <mattieu.souchaud@free.fr>
---
 arch/x86/kernel/cpu/mcheck/mce.c |   49 +++++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/mcheck/mce.c b/arch/x86/kernel/cpu/mcheck/mce.c
index 68317c8..284cfad 100644
--- a/arch/x86/kernel/cpu/mcheck/mce.c
+++ b/arch/x86/kernel/cpu/mcheck/mce.c
@@ -2437,32 +2437,65 @@ static __init int mcheck_init_device(void)
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
-			cpu_notifier_register_done();
-			return err;
+			goto err_device_create;
 		}
 	}
 
 	register_syscore_ops(&mce_syscore_ops);
-	__register_hotcpu_notifier(&mce_cpu_notifier);
+	err = __register_hotcpu_notifier(&mce_cpu_notifier);
+	if (err)
+		goto err_reg_hotcpu;
 	cpu_notifier_register_done();
 
 	/* register character device /dev/mcelog */
-	misc_register(&mce_chrdev_device);
+	err = misc_register(&mce_chrdev_device);
+	if (err)
+		goto err_register;
+
+	return 0;
+
+
+err_register:
+	cpu_notifier_register_begin();
+	__unregister_hotcpu_notifier(&mce_cpu_notifier);
+
+err_reg_hotcpu:
+	unregister_syscore_ops(&mce_syscore_ops);
+
+err_device_create:
+	/*
+	 * mce_device_remove behave properly if mce_device_create was not
+	 * called on that device.
+	 */
+	for_each_possible_cpu(i)
+		mce_device_remove(i);
+	cpu_notifier_register_done();
+
+err_out_mem:
+	free_cpumask_var(mce_device_initialized);
+
+err_out:
+	pr_err("Unable to init device /dev/mcelog (rc: %d)\n", err);
 
 	return err;
 }
-- 
1.7.9.5

