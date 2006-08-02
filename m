From: Neil Horman <nhorman@tuxdriver.com>
Date: Wed, 02 Aug 2006 02:21:52 +0000
Subject: Re: [KJ] [PATCH] apm: clean up module initalization
Message-Id: <20060802022152.GA9097@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060801214545.GA6827@martell.zuzino.mipt.ru>
In-Reply-To: <20060801214545.GA6827@martell.zuzino.mipt.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Copy all that.  New patch attached, with corrected cleanups for dangling proc
entry on kernel_thread failure, and logged warning on failure to register
misc_device.

Regards
Neil

Signed-off-by: Neil Horman <nhorman@tuxdriver.com>


 apm.c |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletion(-)


diff --git a/arch/i386/kernel/apm.c b/arch/i386/kernel/apm.c
index 8591f2f..24fd577 100644
--- a/arch/i386/kernel/apm.c
+++ b/arch/i386/kernel/apm.c
@@ -2339,6 +2339,7 @@ #endif
 	ret = kernel_thread(apm, NULL, CLONE_KERNEL | SIGCHLD);
 	if (ret < 0) {
 		printk(KERN_ERR "apm: disabled - Unable to start kernel thread.\n");
+		remove_proc_entry("apm", NULL);
 		return -ENOMEM;
 	}
 
@@ -2348,7 +2349,13 @@ #endif
 		return 0;
 	}
 
-	misc_register(&apm_device);
+	/*
+	 * Note we don't actually care if the misc_device cannot be registered.
+	 * this driver can do its job without it, even if userspace can't
+	 * control it.  just log the error
+	 */
+	if (misc_register(&apm_device))
+		printk(KERN_WARNING "apm: Could not register misc device.\n");
 
 	if (HZ != 100)
 		idle_period = (idle_period * HZ) / 100;

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
