From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 23 Sep 2005 08:22:07 +0000
Subject: [KJ] printk : arch/alpha/kernel/osf_sys.c
Message-Id: <20050923082207.GB10553@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26852693612526757=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============26852693612526757==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.14-rc2/arch/alpha/kernel/osf_sys.c
===================================================================
--- linux-2.6.14-rc2.orig/arch/alpha/kernel/osf_sys.c
+++ linux-2.6.14-rc2/arch/alpha/kernel/osf_sys.c
@@ -78,7 +78,7 @@ osf_set_program_attributes(unsigned long
 	mm->end_code = bss_start + bss_len;
 	mm->brk = bss_start + bss_len;
 #if 0
-	printk("set_program_attributes(%lx %lx %lx %lx)\n",
+	printk(KERN_DEBUG "set_program_attributes(%lx %lx %lx %lx)\n",
 		text_start, text_len, bss_start, bss_len);
 #endif
 	unlock_kernel();
@@ -182,7 +182,7 @@ osf_mmap(unsigned long addr, unsigned lo
 
 #if 0
 	if (flags & (_MAP_HASSEMAPHORE | _MAP_INHERIT | _MAP_UNALIGNED))
-		printk("%s: unimplemented OSF mmap flags %04lx\n", 
+		printk(KERN_DEBUG "%s: unimplemented OSF mmap flags %04lx\n", 
 			current->comm, flags);
 #endif
 	if (!(flags & MAP_ANONYMOUS)) {
@@ -387,7 +387,7 @@ osf_mount(unsigned long typenr, char __u
 		retval = osf_procfs_mount(name, data, flag);
 		break;
 	default:
-		printk("osf_mount(%ld, %x)\n", typenr, flag);
+		printk(KERN_INFO "osf_mount(%ld, %x)\n", typenr, flag);
 	}
 	putname(name);
  out:
@@ -625,7 +625,7 @@ osf_sysinfo(int command, char __user *bu
 	offset = command-1;
 	if (offset >= sizeof(sysinfo_table)/sizeof(char *)) {
 		/* Digital UNIX has a few unpublished interfaces here */
-		printk("sysinfo(%d)", command);
+		printk(KERN_INFO "sysinfo(%d)", command);
 		goto out;
 	}
 	


--===============26852693612526757==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26852693612526757==--
