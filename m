From: Johan Wessfeldt <johan.wessfeldt@gmail.com>
Date: Thu, 03 Mar 2011 19:12:32 +0000
Subject: [PATCH] x86: mce: Potential memory leaks when initializing mcheck devices
Message-Id: <1299179552-31563-1-git-send-email-johan.wessfeldt@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch makes sure cleanup is done properly when mcheck fails
initializing any of its resources.

Note!
It should be safe to call mce_remove_device on ANY of the cpus as
mce_remove_device checks if corresponding cpu was initialized
before removing its resources.

Please review.

Signed-off-by: Johan Wessfeldt <johan.wessfeldt@gmail.com>
---
 arch/x86/kernel/cpu/mcheck/mce.c |   26 ++++++++++++++++++++------
 1 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/mcheck/mce.c b/arch/x86/kernel/cpu/mcheck/mce.c
index d916183..a9e3820 100644
--- a/arch/x86/kernel/cpu/mcheck/mce.c
+++ b/arch/x86/kernel/cpu/mcheck/mce.c
@@ -2122,8 +2122,10 @@ static __init int mcheck_init_device(void)
 	int err;
 	int i = 0;
 
-	if (!mce_available(&boot_cpu_data))
-		return -EIO;
+	if (!mce_available(&boot_cpu_data)) {
+		err = -EIO;
+		goto out;
+	}
 
 	zalloc_cpumask_var(&mce_dev_initialized, GFP_KERNEL);
 
@@ -2131,20 +2133,32 @@ static __init int mcheck_init_device(void)
 
 	err = sysdev_class_register(&mce_sysclass);
 	if (err)
-		return err;
+		goto out;
 
 	for_each_online_cpu(i) {
 		err = mce_create_device(i);
 		if (err)
-			return err;
+			goto out_unreg;
 	}
 
 	register_hotcpu_notifier(&mce_cpu_notifier);
-	misc_register(&mce_log_device);
+	err = misc_register(&mce_log_device);
+	if (err)
+		goto out_unreg_hotcpu;
+
+	return 0;
 
+out_unreg_hotcpu:
+	unregister_hotcpu_notifier(&mce_cpu_notifier);
+out_unreg:
+	i = 0;
+	for_each_online_cpu(i)
+		mce_remove_device(i);
+
+	sysdev_class_unregister(&mce_sysclass);
+out:
 	return err;
 }
-
 device_initcall(mcheck_init_device);
 
 /*
-- 
1.7.2.3

