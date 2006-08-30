From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:47:22 +0000
Subject: [KJ] [PATCH] 17/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214722.15055.18185.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 73c7622..2a90aef 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -387,7 +387,7 @@ osf_mount(unsigned long typenr, char __u
 		retval = osf_procfs_mount(name, data, flag);
 		break;
 	default:
-		printk("osf_mount(%ld, %x)\n", typenr, flag);
+		pr_info("osf_mount(%ld, %x)\n", typenr, flag);
 	}
 	putname(name);
  out:
@@ -625,7 +625,7 @@ osf_sysinfo(int command, char __user *bu
 	offset = command-1;
 	if (offset >= ARRAY_SIZE(sysinfo_table)) {
 		/* Digital UNIX has a few unpublished interfaces here */
-		printk("sysinfo(%d)", command);
+		printk(KERN_ERR "sysinfo(%d)", command);
 		goto out;
 	}
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
